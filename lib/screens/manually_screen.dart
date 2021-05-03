import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:flutter_edgecloudsim/services/auth.dart';
import 'package:flutter_edgecloudsim/widgets/original_button.dart';
import 'package:permission_handler/permission_handler.dart';

class ManuallyScreen extends StatelessWidget {
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
      body: SingleChildScrollView(
        child: Column(
          children: <Widget>[
            Stack(
              children: <Widget>[
                Container(
                  height: MediaQuery.of(context).size.height * 0.7,
                  decoration: BoxDecoration(
                    color: Colors.blue,
                  ),
                ),
                Center(
                  child: Column(
                    children: <Widget>[
                      SizedBox(height: 60),
                      Padding(
                        padding: const EdgeInsets.only(
                          top: 100,
                          bottom: 25,
                          right: 90
                        ),
                        child: Text('Select the file you want to edit:',
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 20,
                            fontWeight: FontWeight.w400,
                          ),
                        ),
                      ),
                      SizedBox(
                        child: Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 20),
                          child: OriginalButton(
                            text: 'applications.xml',
                            color: Colors.white,
                            textColor: Colors.lightBlue,
                            onPressed: () {
                              Navigator.of(context).pushNamed('app xml');
                              //Navigator.of(context).pushNamed('app xml');
                            },
                          ),

                        ),
                      ),
                      Text(''),
                      SizedBox(
                        child: Padding(

                          padding: const EdgeInsets.symmetric(horizontal: 20),
                          child: OriginalButton(
                            text: 'default_config.properties',
                            color: Colors.white,
                            textColor: Colors.lightBlue,
                            onPressed: () {
                              //Navigator.of(context).pushNamed('default_config_file');
                              Navigator.of(context).pushNamed('default_config_file');
                            },
                          ),

                        ),
                      ),
                      Text(''),
                      SizedBox(
                        child: Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 20),
                          child: OriginalButton(
                            text: 'edge_devices.xml',
                            color: Colors.white,
                            textColor: Colors.lightBlue,
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
                top: 60
              ),
              child: SizedBox(
                height: 60,
                width: double.infinity,
                child: RaisedButton(
                  color: Colors.blue,
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