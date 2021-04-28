import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_edgecloudsim/services/auth.dart';
import 'package:shared_preferences/shared_preferences.dart';
class LogScreen extends StatefulWidget {
  @override
  _LogScreenState createState() => _LogScreenState();
}
class _LogScreenState extends State<LogScreen> {
  var xml_controller=TextEditingController();
  static const Platform =const MethodChannel("com.flutter.epic/epic");
  String _batteryLevel = '';
  Future<void> _getBatteryLevel() async {
    String batteryLevel;
    try {
      final String result = await Platform.invokeMethod('get log file');
      batteryLevel = ' $result  ';
    } on PlatformException catch (e) {
      print(e);
    }

    setState(() {
      _batteryLevel = batteryLevel;
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
              left: 30,
            ),
              child: Text('Log Files'),
            ),
            Padding(
              padding: const EdgeInsets.only(
                left: 100,
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
      body: Center(
        child: SingleChildScrollView(
          child: Container(
            child: Column(
              children: <Widget>[
                Padding(
                  padding: const EdgeInsets.only(
                  ),
                  child: RaisedButton(
                    color: Colors.indigoAccent,
                    child: Text("display"),
                    onPressed: ()async{
                      _getBatteryLevel();
                      xml_controller.text= _batteryLevel;
                    },
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(
                  ),
                  child:Container(
                    height: 495,
                    child: SingleChildScrollView(
                      child: TextField(
                        maxLines: null,
                        controller: xml_controller,
                        decoration: InputDecoration(
                          //contentPadding: new EdgeInsets.symmetric(vertical: 200.0,horizontal: 10.0),
                          contentPadding: EdgeInsets.all(1.0),
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
                  ),
                  child: RaisedButton(
                    color: Colors.amberAccent,
                    child: Text("download"),
                    onPressed: (){
                      Navigator.of(context).pushReplacementNamed('MyPDFList');
                     // _batteryLevel2=xml_controller.text;
                     // _getBatteryLevel2();
                    },
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
