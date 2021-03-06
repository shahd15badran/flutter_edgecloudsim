import 'dart:ui';

import 'package:file_picker/file_picker.dart';
import 'package:flutter/material.dart';
import 'package:flutter_edgecloudsim/widgets/NavDrawer.dart';
import 'package:flutter_edgecloudsim/widgets/original_button.dart';
import 'package:permission_handler/permission_handler.dart';
import 'package:shared_preferences/shared_preferences.dart';

class ManuallyScreen extends StatefulWidget {

  @override
  _ManuallyScreenState createState() => _ManuallyScreenState();
}

class _ManuallyScreenState extends State<ManuallyScreen> {

  getPref() async{
    SharedPreferences prefs = await SharedPreferences.getInstance();
    String user_id = prefs.getString('user_id');
  }

  @override
  void initState() {
    getPref();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return new WillPopScope(
      onWillPop: () {   Navigator.of(context).pushNamed('startup');},
      child: Scaffold(
      backgroundColor: Colors.white,
      drawer: NavDrawer(),
      appBar: AppBar(
        title: Row(
          children: [
            Padding(
              padding: const EdgeInsets.only(
                //left: 80,
              ),
              child: Text('Configuration Files',style: TextStyle(
                fontSize: 18,
                color: Colors.black,
                fontWeight: FontWeight.w600,
              ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(
                left: 122,
              ),

              child: new IconButton(
                icon: new Icon(Icons.home_sharp,color: Colors.black,),
                tooltip:'Home Page' ,

                onPressed: () {   Navigator.of(context).pushNamed('graphical');
                },
              ),

            ),
          ],
        ),
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
                     // SizedBox(height: 60),
                      Padding(
                        padding: const EdgeInsets.only(
                            top: 30,
                          //  bottom: 25,
                            right:20,
                          left: 20
                        ),
                        child: Text(
                            'applications.xml, characteristic of applications are declared in it.\n\n'
                          'default_config.properties file basically stores the simulation settings.\n\n'
                            'edge_devices.xml file, stores the characteristic of the data centers.'
                            ,
                          style: TextStyle(
                            color: Color(0xFF11202D),
                            fontSize: 18,
                            fontWeight: FontWeight.w400,
                          ),
                        ),
                      ),

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

                      SizedBox(
                        child: Padding(
                          padding: const EdgeInsets.only(
                            bottom: 20,
                            right: 20,
                            left: 20
                          ),
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

                      SizedBox(
                        child: Padding(

                          padding: const EdgeInsets.only(
                              bottom: 20,
                              right: 20,
                              left: 20
                          ),
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
                      SharedPreferences prefs = await SharedPreferences.getInstance();
                      if (status.isGranted) {
                        Navigator.of(context).pushNamed('simulation');
                        prefs.setString('manual', 't');
                      }
                  },
                  child: Text('Go to simulation process' ,
                    style: TextStyle(
                        color: Colors.white,
                        fontSize: 20
                    ),
                  ),
                ),
              ),
            ),
            /*
            Padding( ///////////////////////////////////////////////////////////
              padding: const EdgeInsets.only(
                  top: 45
              ),
              child: SizedBox(
                height: 60,
                width: 350,
                child: RaisedButton(
                  color: Color(0xFF345979),
                  onPressed: () async{
                    FilePickerResult filePicker = await FilePicker.platform.pickFiles(
                      type: FileType.custom,
                      //allowedExtensions: ['jpg', 'pdf', 'doc'],
                    );
                    if(filePicker != null) {
                      PlatformFile file = filePicker.files.first;

                      print(file.name);
                      //print(file.bytes);
                      //print(file.size);
                      //print(file.extension);
                      //print(file.path);
                      print(file.readStream);
                    } else {
                      // User canceled the picker
                    }
                  },
                  child: Text('Upload' ,
                    style: TextStyle(
                        color: Colors.white,
                        fontSize: 20
                    ),
                  ),
                ),
              ),
            ),*/

          ],
        ),
      ),
    ));
  }
}