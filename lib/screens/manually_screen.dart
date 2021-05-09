import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:flutter_edgecloudsim/services/auth.dart';
import 'package:flutter_edgecloudsim/widgets/NavDrawer.dart';
import 'package:flutter_edgecloudsim/widgets/original_button.dart';
import 'package:permission_handler/permission_handler.dart';

class ManuallyScreen extends StatelessWidget {
  AuthBase authBase = AuthBase();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      drawer: NavDrawer(),
      appBar: AppBar(
        iconTheme: IconThemeData(
          color:Color(0xA3131212),
        ),
        backgroundColor: Colors.white,
      ),
      body: SingleChildScrollView(
        child: Column(
          children: <Widget>[
            Stack(
              children: <Widget>[
                Container(
                  height: MediaQuery.of(context).size.height * 0.7,
                  decoration: BoxDecoration(
                    color: Color(0xFF77A5CD),
                  ),
                ),
                Center(
                  child: Column(
                    children: <Widget>[
                      SizedBox(height: 60),
                      Padding(
                        padding: const EdgeInsets.only(
                          top: 30,
                          bottom: 25,
                          right: 90
                        ),
                        child: Text('Select the file you want to edit:',
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 20,
                            fontWeight: FontWeight.w500,
                          ),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(
                            right: 380
                        ),
                        child: const Tooltip(
                          showDuration: Duration(seconds: 3),
                          message: 'click application.xml to edit the file manually',
                          textStyle: TextStyle(
                              fontSize: 15, color: Colors.white, fontWeight: FontWeight.normal),
                          child: IconButton(
                            icon: Icon(Icons.help_center_outlined,color:  Color(0xFF345979),size: 20),
                          ),
                        ),
                      ),
                      SizedBox(
                        child: Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 20),
                          child: OriginalButton(

                            text: 'applications.xml',
                            color: Colors.white,
                            textColor: Color(0xFF345979),
                            onPressed: () {
                              Navigator.of(context).pushNamed('app xml');
                              //Navigator.of(context).pushNamed('app xml');
                            },
                          ),

                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(
                            right: 380
                        ),
                        child: const Tooltip(
                          showDuration: Duration(seconds: 3),
                          message: 'click default_config.properties to edit the file manually',
                          textStyle: TextStyle(
                              fontSize: 15, color: Colors.white, fontWeight: FontWeight.normal),
                          child: IconButton(
                            icon: Icon(Icons.help_center_outlined,color:  Color(0xFF345979),size: 20),
                          ),
                        ),
                      ),
                      SizedBox(
                        child: Padding(

                          padding: const EdgeInsets.symmetric(horizontal: 20),
                          child: OriginalButton(
                            text: 'default_config.properties',
                            color: Colors.white,
                            textColor:  Color(0xFF345979),
                            onPressed: () {
                              //Navigator.of(context).pushNamed('default_config_file');
                              Navigator.of(context).pushNamed('default_config_file');
                            },
                          ),

                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(
                            right: 380
                        ),
                        child: const Tooltip(
                          showDuration: Duration(seconds: 3),
                          message: 'click edge_devices.xml to edit the file manually',
                          textStyle: TextStyle(
                              fontSize: 15, color: Colors.white, fontWeight: FontWeight.normal),
                          child: IconButton(
                            icon: Icon(Icons.help_center_outlined,color:  Color(0xFF345979),size: 20),
                          ),
                        ),
                      ),
                      SizedBox(
                        child: Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 20),
                          child: OriginalButton(
                            text: 'edge_devices.xml',
                            color: Colors.white,
                            textColor:  Color(0xFF345979),
                            onPressed: () {
                             // Navigator.of(context).pushNamed('edge xml');
                              Navigator.of(context).pushNamed('edge xml');
                            },
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
            Padding(
              padding: const EdgeInsets.only(
                top: 45
              ),
              child: SizedBox(
                height: 60,
                width: 350,
                child: RaisedButton(

                  color: Color(0xFF345979),
                  onPressed: () async{
                      final status = await Permission.storage.request();
                      if (status.isGranted) {
                        Navigator.of(context).pushNamed('simulation');
                      }
                  },
                  child: Text('Go to simulation process' ,
                    style: TextStyle(
                        color: Colors.white,
                        fontSize: 20
                    ) ,),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}