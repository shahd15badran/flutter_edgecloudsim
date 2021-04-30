import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_edgecloudsim/related_to_edge_devices_xml_file/edge_devices_xml.dart';
import 'package:flutter_edgecloudsim/services/auth.dart';
import 'package:flutter_edgecloudsim/widgets/original_button.dart';
class SimulationScreen extends StatefulWidget {
  @override
  _SimulationScreenState createState() => _SimulationScreenState();
}

class _SimulationScreenState extends State<SimulationScreen> {
  static const Platform =const MethodChannel("com.flutter.epic/epic");
  String _batteryLevel = '';
  var simRes;
  Future<void> _getBatteryLevel() async {
    //String simRes;
    try {
      final String result = await Platform.invokeMethod("Start Sim");
      simRes = ' $result';
    } on PlatformException catch (e) {
      print(e);
    }
    setState(() {
      _batteryLevel = simRes; //TODO put it in small text box
      print(_batteryLevel);
    });
  }

  ////
  String _logs = '';
  Future<void> _getlogs() async {
    String batteryLevel;
    try {
      final String result = await Platform.invokeMethod('get log file');
      batteryLevel = ' $result  ';
    } on PlatformException catch (e) {
      print(e);
    }
    setState(() {
      _logs = batteryLevel;
    });
  }
  ////

  @override
  void initState() {
    super.initState();
    //print("inittttt " +_batteryLevel);
  }

  AuthBase authBase = AuthBase();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        iconTheme: IconThemeData(
          color:Colors.black,
        ),
        backgroundColor: Colors.white,
        title: Row(
          children: [
            Padding(padding: const EdgeInsets.only(
              // left: 30,
            ),
              child: Text('Run simulator',style: TextStyle(
                fontSize: 18,
                color: Colors.black,
                fontWeight: FontWeight.w600,
              ),),
            ),
            Padding(
              padding: const EdgeInsets.only(
                left: 100,
              ),
              child: Padding(
                padding: const EdgeInsets.only(
                    left: 40
                ),
                child: FlatButton(
                  height: 20,
                  minWidth: 20,
                  color: Colors.white,
                  onPressed: () async {
                    await authBase.logout();
                    Navigator.of(context).pushReplacementNamed('login');
                  },
                  child:Row(
                    children:<Widget>[
                      Icon(Icons.logout,color: Colors.black,size: 20),
                    ],
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.only(
          top: 80,
          bottom: 10,
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: <Widget>[

            Padding(
              padding: const EdgeInsets.symmetric(horizontal:20),
              child: SizedBox(
                width:250 ,
                child: OriginalButton(
                  text: 'Start Simulation',
                  color: Colors.blue,
                  textColor: Colors.white,
                  onPressed: ()async{
                    _getBatteryLevel();
                  },
                ),
              ),
            ),
            //////////////////////////////////////////////////
            Expanded(
              child: SingleChildScrollView(
                scrollDirection: Axis.vertical,
                  child: Padding(
                    padding: const EdgeInsets.only(
                      top: 40,
                      right: 20,
                      left: 20,

                    ),
                    child: TextFormField(
                      initialValue:_batteryLevel,//simRes == null ? 'Display Running Time' : simRes,,
                      decoration: InputDecoration(
                        contentPadding: new EdgeInsets.symmetric(vertical: 80.0,horizontal: 10.0),
                        fillColor: Colors.white,
                        filled:true,
                        enabledBorder: OutlineInputBorder(
                            borderSide: BorderSide(color: Colors.black45,width: 1.0)
                        ),
                      ),
                    ),
                  ),

                ),
              ),
            Padding(
              padding: const EdgeInsets.only(
                top: 2,
                bottom: 1,
                left: 10,right: 100
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(
                top: 2,
                bottom: 5,
              ),
              child: SizedBox(
                width:250 ,
                child: OriginalButton(
                  text: 'Generated Log Files',
                  color: Colors.black38,
                  textColor: Colors.white,
                  onPressed: ()async{
                    _getlogs();
                   Navigator.of(context).pushNamed('MyFileList');
                  },
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(
                top: 10,
                bottom: 150,
              ),
              child: SizedBox(
                width:250 ,
                child: OriginalButton(
                  text: 'Apply Matlab Functions',
                  color: Colors.black38,
                  textColor: Colors.white,
                  onPressed: ()async{
                    Navigator.of(context).pushNamed('matlab screen');
                  },
                ),
              ),
            ),
          ],
        ),
      ),




    );
  }
}
