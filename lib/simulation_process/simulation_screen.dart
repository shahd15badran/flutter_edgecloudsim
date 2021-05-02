import 'dart:async';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_edgecloudsim/services/auth.dart';
import 'package:flutter_edgecloudsim/widgets/original_button.dart';
import 'package:flutter_local_notifications/flutter_local_notifications.dart';

class SimulationScreen extends StatefulWidget {
  @override
  _SimulationScreenState createState() => _SimulationScreenState();
}

class _SimulationScreenState extends State<SimulationScreen> with TickerProviderStateMixin{
  int _state = 0;
  final Msg_controller=TextEditingController(text:"");
  int _stateM = 0;
  static const Platform = const MethodChannel("com.flutter.epic/epic");
  var simRes = '';
  Future<String> _getBatteryLevel() async {
    try {
      final String result = await Platform.invokeMethod("Start Sim");

    } on PlatformException catch (e) {
      print(e);
    } finally {
      setState(() {
      });
    }
  }
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
  FlutterLocalNotificationsPlugin flutterLocalNotificationsPlugin;
  @override
  void initState() {
    super.initState();
  }

  AuthBase authBase = AuthBase();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        iconTheme: IconThemeData(
          color: Colors.black,
        ),
        backgroundColor: Colors.white,
        title: Row(
          children: [
            Padding(padding: const EdgeInsets.only(
              // left: 30,
            ),
              child: Text('Run Simulator', style: TextStyle(
                fontSize: 18,
                color: Colors.black,
                fontWeight: FontWeight.w600,
              ),),
            ),
            Padding(
              padding: const EdgeInsets.only(
                left: 110,
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
                  child: Row(
                    children: <Widget>[
                      Icon(Icons.logout, color: Colors.black, size: 20),
                    ],
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
      body: Container(
        color: Colors.white,
        child: Padding(
          padding: const EdgeInsets.only(
            top: 80,
            bottom: 10,
          ),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: <Widget>[

              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 20),
                child: SizedBox(
                  width: 250,
                  child: OriginalButton(
                    text: 'Start Simulation',
                    color: Colors.blue,
                    textColor: Colors.white,
                    onPressed: () {
                      _getBatteryLevel();

                      setState(() {
                        if (_stateM == 0) {
                          animateButtonM();
                        }
                      });
                    },
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(
                  top:20
                ),
                child: SizedBox(
                  width: 250,
                  child: setUpMsgChild()
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(
                  right: 20,
                  left: 20
                ),
                child:Container(
                  color: Colors.white,
                  height: 200,
                  width: double.infinity,
                  child: SingleChildScrollView(
                    child: TextField(
                      maxLines: null,
                      enabled: false,
                      controller: Msg_controller,
                      decoration: InputDecoration(
                        fillColor: Colors.white,
                        filled: true,
                        border: InputBorder.none,
                        hintText: "         Click on the check icon when it appears!",
                      ),
                    ),
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(
                ),
                child: SizedBox(
                  width: 250,
                  child: new MaterialButton(
                    child: setUpButtonChild('Download Log Files'),
                    onPressed: () async{
                      _getlogs();
                      setState(() {
                        if (_state == 0) {
                          animateButton();
                        }
                      });
                      //Navigator.of(context).pushNamed('MyFileList');
                    },
                    elevation: 4.0,
                    minWidth:250.0,
                    height: 55.0,
                    color: Colors.black,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(15),
                    ),
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(
                  top: 10,
                  bottom: 150,
                ),
                child: SizedBox(
                  width: 250,
                  child: OriginalButton(
                    text: 'Apply Matlab Functions',
                    color: Colors.black,
                    textColor: Colors.white,
                    onPressed: () async {
                      Navigator.of(context).pushNamed('matlab screen');
                    },
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
  Widget setUpButtonChild(String name) {
    if (_state == 0) {
      return new Text(
        name,
        style: const TextStyle(
          color: Colors.white,
          fontSize: 16.0,
        ),
      );
    } else if (_state == 1) {
      return CircularProgressIndicator(
        valueColor: AlwaysStoppedAnimation<Color>(Colors.white),
      );
    } else {
      return Icon(Icons.check, color: Colors.white);
    }
  }

  void animateButton() {
    setState(() {
      _state = 1;
    });

    Timer(Duration(milliseconds: 2000), () {
      setState(() {
        _state = 2;
      });
      Navigator.of(context).pushNamed('MyFileList');
    });
  }
  Widget setUpMsgChild() {
    if (_stateM == 0) {
      return new Text(
        "Not yet",
        style: const TextStyle(
          color: Colors.white,
          fontSize: 16.0,
        ),
      );
    } else if (_stateM == 1) {
      return LinearProgressIndicator(
        valueColor: AlwaysStoppedAnimation<Color>(Colors.blueGrey),
      );
    } else {
      //print("hhhhhhhhhhhhhhhh" + simRes);
      return InkWell(
        splashColor: Colors.blue, // splash color
        onTap: ()async {
          try {
            final String result = await Platform.invokeMethod("getMsg");
            simRes = ' $result';
            print('on tap ' + simRes);
            Msg_controller.text=simRes;
          } on PlatformException catch (e) {
            print(e);
          }
        }, // button pressed
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Icon(Icons.check_circle_outline),
          ],
        ),
      );
    }
  }

  void animateButtonM() {
    setState(() {
      _stateM = 1;
    });

    Timer(Duration(milliseconds: 20000), () {
      setState(() {
        _stateM = 2;
      });
    });
  }

}