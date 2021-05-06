import 'dart:async';
import 'dart:io';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_edgecloudsim/screens/ListingPdfFiles.dart';
import 'package:flutter_edgecloudsim/services/auth.dart';
import 'package:flutter_edgecloudsim/widgets/NavDrawer.dart';
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

  bool _hasBeenPressed1 = false;
  bool _hasBeenPressed2 = false;
  bool _hasBeenPressed3 = false;
  bool _hasBeenPressed4 = false;
  bool _hasBeenPressed5 = false;

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

  _createFolder()async {
    final folderName = "Pdfs";
    final path = Directory("storage/emulated/0/Documents/$folderName");
    if ((await path.exists())) {
    } else {
      path.create();
    }
  }

  _createSubFolder(folderName) async{
    final path = Directory("storage/emulated/0/Documents/Pdfs/$folderName");
    if ((await path.exists())) {
      print("exist");
    } else {
      print("not exist");
      path.create();
    }
  }

  @override
  void initState() {
    _createFolder();
    super.initState();
  }

  AuthBase authBase = AuthBase();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: NavDrawer(),
      appBar: AppBar(

        iconTheme: IconThemeData(
          color:Color(0xA3131212),
        ),
        backgroundColor: Color(0xFF5896CB),
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
                      _createSubFolder('failedTasks');
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
                    color: _hasBeenPressed1? Colors.green : Color(0xFF5896CB),
                  ),
                  SizedBox.fromSize(
                    size: Size(50, 50), // button width and height
                      child: Material(
                        color: Colors.white, // button color
                        child: InkWell(
                          splashColor: Color(0xFF5896CB), // splash color
                          onTap: !_hasBeenPressed1? null :() {
                            Navigator.push(context,
                                MaterialPageRoute(
                                    builder: (context) => MyPDFList('failedTasks')
                                )
                            );
                          }, // button pressed
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: <Widget>[
                              Icon(Icons.arrow_forward_ios_outlined,color: _hasBeenPressed1?Colors.black:Colors.white ,),
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
                      _createSubFolder('networkDelay');
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
                    color: _hasBeenPressed2? Colors.green : Color(0xFF5896CB),
                  ),
                  SizedBox.fromSize(
                    size: Size(50, 50), // button width and height
                    child: Material(
                      color: Colors.white, // button color
                      child: InkWell(
                        splashColor: Color(0xFF5896CB),// splash color
                        onTap: !_hasBeenPressed2? null :() {
                          Navigator.push(context,
                              MaterialPageRoute(
                                  builder: (context) => MyPDFList('networkDelay')
                              )
                          );
                        }, // button pressed
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: <Widget>[
                            Icon(Icons.arrow_forward_ios_outlined,color: _hasBeenPressed2?Colors.black:Colors.white ,),
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
                      _createSubFolder('ProcessingTime');
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
                    color: _hasBeenPressed3? Colors.green : Color(0xFF5896CB),
                  ),
                  SizedBox.fromSize(
                    size: Size(50, 50), // button width and height
                    child: Material(
                      color: Colors.white, // button color
                      child: InkWell(
                        splashColor: Color(0xFF5896CB),// splash color
                        onTap: !_hasBeenPressed3? null :() {
                          Navigator.push(context,
                              MaterialPageRoute(
                                  builder: (context) => MyPDFList('processingTime')
                              )
                          );
                        }, // button pressed
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: <Widget>[
                            Icon(Icons.arrow_forward_ios_outlined,color: _hasBeenPressed3?Colors.black:Colors.white ,),
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
                      _createSubFolder('serviceTime');
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
                    color: _hasBeenPressed4? Colors.green : Color(0xFF5896CB),
                  ),
                  SizedBox.fromSize(
                    size: Size(50, 50), // button width and height
                    child: Material(
                      color: Colors.white, // button color
                      child: InkWell(
                        splashColor: Color(0xFF5896CB),// splash color
                        onTap:!_hasBeenPressed4? null : () {
                          Navigator.push(context,
                              MaterialPageRoute(
                                  builder: (context) => MyPDFList('serviceTime')
                              )
                          );
                        }, // button pressed
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: <Widget>[
                            Icon(Icons.arrow_forward_ios_outlined,color: _hasBeenPressed4?Colors.black:Colors.white ,),
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
                      _createSubFolder('vmUtilization');
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
                    color: _hasBeenPressed5? Colors.green : Color(0xFF5896CB),
                  ),
                  SizedBox.fromSize(
                    size: Size(50, 50), // button width and height
                    child: Material(
                      color: Colors.white, // button color
                      child: InkWell(
                        splashColor: Color(0xFF5896CB), // splash color
                        onTap:!_hasBeenPressed5? null : () {
                          Navigator.push(context,
                              MaterialPageRoute(
                                  builder: (context) => MyPDFList('vmUtilization')
                              )
                          );
                        }, // button pressed
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: <Widget>[
                            Icon(Icons.arrow_forward_ios_outlined,color: _hasBeenPressed5?Colors.black:Colors.white ,),
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
      //return Icon(Icons.check, color: Colors.white);
      switch(n){
        case 1:
          setState(() {
            _hasBeenPressed1 =  true;
          });
          break;
        case 2:
          setState(() {
            _hasBeenPressed2 =  true;
          });
          break;
        case 3:
          setState(() {
            _hasBeenPressed3 =  true;
          });
          break;
        case 4:
          setState(() {
            _hasBeenPressed4 =  true;
          });
          break;
        case 5:
          setState(() {
            _hasBeenPressed5 =  true;
          });
          break;
      }
      return new Text(
        name,
        style: const TextStyle(
          color: Colors.white,
          fontSize: 16.0,
        ),
      );
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