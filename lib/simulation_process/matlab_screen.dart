import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_edgecloudsim/services/auth.dart';
import 'package:flutter_edgecloudsim/widgets/original_button.dart';
class MatlabScreen extends StatefulWidget {
  @override
  _SimulationScreenState createState() => _SimulationScreenState();
}

class _SimulationScreenState extends State<MatlabScreen> with TickerProviderStateMixin{
  int _state1 = 0;
  int _state2 = 0;
  int _state3 = 0;
  int _state4 = 0;
  int _state5 = 0;

  static const Platform =const MethodChannel("com.flutter.epic/epic");
  String _pdfs = '';
  Future<void> _getpdfs(fname) async {
    String batteryLevel;
    try {
      final String result = await Platform.invokeMethod(fname);
      batteryLevel = ' $result  ';
    } on PlatformException catch (e) {
      print(e);
    }
    setState(() {
      _pdfs = batteryLevel;
    });
  }

  @override
  void initState() {
    super.initState();
    //print("inittttt " +_pdfs);
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
            Padding(
              padding: const EdgeInsets.only(
                left: 230,
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
            top: 30,
            bottom: 80,
            left:55
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Padding(
              padding: const EdgeInsets.only(
                bottom: 30,
                right: 70

              ),
              child: SizedBox(
                width:250 ,
                child: Text('Choose a function to run on the results:',style: TextStyle(
                  fontSize: 21,
                  color: Colors.black,
                  fontWeight: FontWeight.w500,
                ),
                ),
              ),
            ),
            new Padding(
              padding: const EdgeInsets.all(16.0),
              child: Row(
                children: [
                  new MaterialButton(
                    child: setUpButtonChild('plotAvgFailedTask',1),
                    onPressed: () async{
                      setState(() {
                        if (_state1 == 0) {
                          animateButton(1);
                        }
                      });
                      try {
                        final String result = await Platform.invokeMethod('pdfs_failed');
                      } on PlatformException catch (e) {
                        print(e);
                      }
                    },
                    elevation: 4.0,
                    minWidth:250.0,
                    height: 50.0,
                    color: Colors.blueAccent,
                  ),
                  SizedBox.fromSize(
                    size: Size(50, 50), // button width and height
                      child: Material(
                        color: Colors.white, // button color
                        child: InkWell(
                          splashColor: Colors.blue, // splash color
                          onTap: () {
                            Navigator.of(context).pushNamed('MyPDFList');
                          }, // button pressed
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: <Widget>[
                              Icon(Icons.arrow_forward_ios_outlined),
                            ],
                          ),
                        ),
                      ),
                    ),

                ],
              ),
            ),
            new Padding(
              padding: const EdgeInsets.all(16.0),
              child: Row(
                children: [
                  new MaterialButton(
                    child: setUpButtonChild('plotAvgNetworkDelay',2),
                    onPressed: () async{
                      setState(() {
                        if (_state2 == 0) {
                          animateButton(2);
                        }
                      });
                      try {
                        final String result = await Platform.invokeMethod('pdfs_network');
                      } on PlatformException catch (e) {
                        print(e);
                      }
                    },
                    elevation: 4.0,
                    minWidth:250.0,
                    height: 50.0,
                    color: Colors.blueAccent,
                  ),
                  SizedBox.fromSize(
                    size: Size(50, 50), // button width and height
                    child: Material(
                      color: Colors.white, // button color
                      child: InkWell(
                        splashColor: Colors.blue, // splash color
                        onTap: () {
                          Navigator.of(context).pushNamed('MyPDFList');
                        }, // button pressed
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: <Widget>[
                            Icon(Icons.arrow_forward_ios_outlined),
                          ],
                        ),
                      ),
                    ),
                  ),

                ],
              ),
            ),
            new Padding(
              padding: const EdgeInsets.all(16.0),
              child: Row(
                children: [
                  new MaterialButton(
                    child: setUpButtonChild('plotAvgProcessingTime',3),
                    onPressed: () async{
                      setState(() {
                        if (_state3 == 0) {
                          animateButton(3);
                        }
                      });
                      try {
                        final String result = await Platform.invokeMethod('pdfs_process');
                      } on PlatformException catch (e) {
                        print(e);
                      }
                    },
                    elevation: 4.0,
                    minWidth:250.0,
                    height: 50.0,
                    color: Colors.blueAccent,
                  ),
                  SizedBox.fromSize(
                    size: Size(50, 50), // button width and height
                    child: Material(
                      color: Colors.white, // button color
                      child: InkWell(
                        splashColor: Colors.blue, // splash color
                        onTap: () {
                          Navigator.of(context).pushNamed('MyPDFList');
                        }, // button pressed
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: <Widget>[
                            Icon(Icons.arrow_forward_ios_outlined),
                          ],
                        ),
                      ),
                    ),
                  ),

                ],
              ),
            ),
            new Padding(
              padding: const EdgeInsets.all(16.0),
              child: Row(
                children: [
                  new MaterialButton(
                    child: setUpButtonChild('plotAvgServiceTime',4),
                    onPressed: () async{
                      setState(() {
                        if (_state4 == 0) {
                          animateButton(4);
                        }
                      });
                      try {
                        final String result = await Platform.invokeMethod('pdfs_service');
                      } on PlatformException catch (e) {
                        print(e);
                      }
                    },
                    elevation: 4.0,
                    minWidth:250.0,
                    height: 50.0,
                    color: Colors.blueAccent,
                  ),
                  SizedBox.fromSize(
                    size: Size(50, 50), // button width and height
                    child: Material(
                      color: Colors.white, // button color
                      child: InkWell(
                        splashColor: Colors.blue, // splash color
                        onTap: () {
                          Navigator.of(context).pushNamed('MyPDFList');
                        }, // button pressed
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: <Widget>[
                            Icon(Icons.arrow_forward_ios_outlined),
                          ],
                        ),
                      ),
                    ),
                  ),

                ],
              ),
            ),
            new Padding(
              padding: const EdgeInsets.all(16.0),
              child: Row(
                children: [
                  new MaterialButton(
                    child: setUpButtonChild('plotAvgVmUtilization',5),
                    onPressed: () async{
                      setState(() {
                        if (_state5 == 0) {
                          animateButton(5);
                        }
                      });
                      try {
                        final String result = await Platform.invokeMethod('pdfs_vm');
                      } on PlatformException catch (e) {
                        print(e);
                      }
                    },
                    elevation: 4.0,
                    minWidth:250.0,
                    height: 50.0,
                    color: Colors.blueAccent,
                  ),
                  SizedBox.fromSize(
                    size: Size(50, 50), // button width and height
                    child: Material(
                      color: Colors.white, // button color
                      child: InkWell(
                        splashColor: Colors.blue, // splash color
                        onTap: () {
                          Navigator.of(context).pushNamed('MyPDFList');
                        }, // button pressed
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: <Widget>[
                            Icon(Icons.arrow_forward_ios_outlined),
                          ],
                        ),
                      ),
                    ),
                  ),

                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
  Widget setUpButtonChild(String name, int n) {
    int _state = -1;
    switch(n){
      case 1:
        _state = _state1;
        break;
      case 2:
        _state = _state2;
        break;
      case 3:
        _state = _state3;
        break;
      case 4:
        _state = _state4;
        break;
      case 5:
        _state = _state5;
        break;
    }
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

  void animateButton(int n) {
    switch (n) {
      case 1:
        setState(() {
          _state1 = 1;
        });
        Timer(Duration(milliseconds: 8300), () {
          setState(() {
            _state1 = 2;
          });
        });
        break;
      case 2:
        setState(() {
          _state2 = 1;
        });
        Timer(Duration(milliseconds: 8300), () {
          setState(() {
            _state2 = 2;
          });
        });
        break;
      case 3:
        setState(() {
          _state3 = 1;
        });
        Timer(Duration(milliseconds: 8300), () {
          setState(() {
            _state3 = 2;
          });
        });
        break;
      case 4:
        setState(() {
          _state4 = 1;
        });
        Timer(Duration(milliseconds: 8300), () {
          setState(() {
            _state4 = 2;
          });
        });
        break;
      case 5:
        setState(() {
          _state5 = 1;
        });
        Timer(Duration(milliseconds: 8300), () {
          setState(() {
            _state5 = 2;
          });
        });
        break;

    }



  }
}