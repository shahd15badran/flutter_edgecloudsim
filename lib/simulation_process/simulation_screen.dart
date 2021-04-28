import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_edgecloudsim/services/auth.dart';
import 'package:flutter_edgecloudsim/widgets/original_button.dart';
class SimulationScreen extends StatefulWidget {
  @override
  _SimulationScreenState createState() => _SimulationScreenState();
}

class _SimulationScreenState extends State<SimulationScreen> {
  static const Platform =const MethodChannel("com.flutter.epic/epic");
  String _batteryLevel = '';
  Future<void> _getBatteryLevel() async {
    String simRes;
    try {
      final String result = await Platform.invokeMethod("Start Sim");
      simRes = ' $result';
    } on PlatformException catch (e) {
      print(e);
    }
    setState(() {
      _batteryLevel = simRes; //TODO put it in small text box
    });
  }
  AuthBase authBase = AuthBase();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.black12,
        title: Row(
          children: [
            Padding(padding: const EdgeInsets.only(
              left: 20,
            ),
              child: Text('Simulation Process'),
            ),
            Padding(
              padding: const EdgeInsets.only(
                left: 60,
              ),
              child: FlatButton(
                height: 20,
                minWidth: 20,
                color: Colors.blue,
                onPressed: () async {
                  await authBase.logout();
                  Navigator.of(context).pushReplacementNamed('login');
                },
                child:Row(
                  children:<Widget>[
                    Icon(Icons.logout,color: Colors.white,size: 20),
                  ],
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
                      decoration: InputDecoration(
                        contentPadding: new EdgeInsets.symmetric(vertical: 80.0,horizontal: 10.0),
                        fillColor: Colors.white,
                        filled:true,
                        enabledBorder: OutlineInputBorder(
                            borderSide: BorderSide(color: Colors.black45,width: 1.0)
                        ),
                        labelText: 'Display Running Time',
                      ),
                    ),
                  ),

                ),
              ),
            Padding(
              padding: const EdgeInsets.only(
                top: 20,
                bottom: 1,
                left: 10,right: 10
              ),
              child:Text('You can choose how you want to display your result:',style: TextStyle(
                fontSize: 19,
                color: Colors.blue,
                fontWeight: FontWeight.w800,
              ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(
                top: 20,
                bottom: 5,
              ),
              child: SizedBox(
                width:250 ,
                child: OriginalButton(
                  text: 'Show log files',
                  color: Colors.black38,
                  textColor: Colors.white,
                  onPressed: ()async{
                    Navigator.of(context).pushNamed('log screen');
                  },
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(
                top: 10,
                bottom: 20,
              ),
              child: SizedBox(
                width:250 ,
                child: OriginalButton(
                  text: 'Show Results',
                  color: Colors.black38,
                  textColor: Colors.white,
                  onPressed: ()async{
                    Navigator.of(context).pushNamed('result screen');
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
