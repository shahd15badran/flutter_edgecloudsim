import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_edgecloudsim/services/auth.dart';
import 'package:flutter_edgecloudsim/widgets/original_button.dart';
class MatlabScreen extends StatefulWidget {
  @override
  _SimulationScreenState createState() => _SimulationScreenState();
}

class _SimulationScreenState extends State<MatlabScreen> {
  static const Platform =const MethodChannel("com.flutter.epic/epic");
  String _pdfs = '';
  Future<void> _getpdfs() async {
    String batteryLevel;
    try {
      final String result = await Platform.invokeMethod('pdfs_failed');
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
                left: 280,
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
          left:80
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Padding(
              padding: const EdgeInsets.only(
                bottom: 40,

              ),
              child: SizedBox(
                width:250 ,
                child: Text('Choose a function to run on the results:',style: TextStyle(
                  fontSize: 22,
                  color: Colors.black,
                  fontWeight: FontWeight.w800,
                ),
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(
                bottom: 15
              ),
              child: SizedBox(
                width:250 ,
                child: OriginalButton(
                  text: 'plotAvgFailedTask',
                  color: Colors.blueAccent,
                  textColor: Colors.white,
                  onPressed: ()async{
                    try {
                      final String result = await Platform.invokeMethod('pdfs_failed');
                    } on PlatformException catch (e) {
                      print(e);
                    }
                  },
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(
                  bottom: 15
              ),
              child: SizedBox(
                width:250 ,
                child: OriginalButton(
                  text: 'plotAvgNetworkDelay',
                  color: Colors.blueAccent,
                  textColor: Colors.white,
                  onPressed: ()async{
                    try {
                      final String result = await Platform.invokeMethod('pdfs_network');
                    } on PlatformException catch (e) {
                      print(e);
                    }
                    Navigator.of(context).pushReplacementNamed('MyPDFList');
                  },
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(
                  bottom: 15
              ),
              child: SizedBox(
                width:250 ,
                child: OriginalButton(
                  text: 'plotAvgProcessingTime',
                  color: Colors.blueAccent,
                  textColor: Colors.white,
                  onPressed: ()async{
                  },
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(
                  bottom: 15
              ),
              child: SizedBox(
                width:250 ,
                child: OriginalButton(
                  text: 'plotAvgServiceTime',
                  color: Colors.blueAccent,
                  textColor: Colors.white,
                  onPressed: ()async{
                  },
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(
                  bottom: 15
              ),
              child: SizedBox(
                width:250 ,
                child: OriginalButton(
                  text: 'plotAvgVmUtilization',
                  color: Colors.blueAccent,
                  textColor: Colors.white,
                  onPressed: ()async{
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
