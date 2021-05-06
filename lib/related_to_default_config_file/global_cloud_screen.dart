import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_edgecloudsim/services/auth.dart';
import 'package:flutter_edgecloudsim/widgets/NavDrawer.dart';
import 'package:flutter_edgecloudsim/widgets/constants.dart';
import 'package:flutter_edgecloudsim/widgets/original_button.dart';
import 'package:shared_preferences/shared_preferences.dart';
class GlobalCloudScreen extends StatefulWidget {
  @override
  _GlobalCloudScreenState createState() => _GlobalCloudScreenState();
}

class _GlobalCloudScreenState extends State<GlobalCloudScreen>with TickerProviderStateMixin {
  int _state = 0;

  AuthBase authBase = AuthBase();
  final number_of_host_on_cloud_datacenter_controller=TextEditingController(text: "1");
  final number_of_vm_on_cloud_host_controller=TextEditingController(text: "4");
  final core_for_cloud_vm_controller=TextEditingController(text: "4");
  final mips_for_cloud_vm_controller=TextEditingController(text: "10000");
  final ram_for_cloud_vm_controller=TextEditingController(text: "32000");
  final storage_for_cloud_vm_controller=TextEditingController(text: "1000000");


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: NavDrawer(),
      appBar: AppBar(
        iconTheme: IconThemeData(
          color:Colors.white,
        ),
        backgroundColor: Color(0xFF77A5CD),
        title: Row(
          children: [
            Padding(
                padding: const EdgeInsets.only(
                  left: 210,
                ),
                child: Padding(
                  padding: const EdgeInsets.only(
                      left: 40
                  ),
                  child: new IconButton(
                    icon: new Icon(Icons.home_sharp,color: Colors.white,),
                    onPressed: () {   Navigator.of(context).pushNamed('graphical');
                    },
                  ),
                )
            ),
          ],
        ),
      ),
      body: Padding(
          padding: const EdgeInsets.only(
            left: 16.0,
            right: 10.0,
            top: 100.0,
          ),
          child: SingleChildScrollView(
            child: Container(
              //color: Colors.white,
              child: Padding(
                padding: const EdgeInsets.only(
                    top: 50,
                    right: 16,
                    left: 16
                ),
                child: Column(
                  children:<Widget> [
                    Padding(
                      padding: const EdgeInsets.only(
                          bottom: 20
                      ),
                      child: Row(
                        children: [
                          SizedBox(
                            width: 200,
                            child: Text('number_of_host_on_cloud_datacenter :',style: TextStyle(
                              fontSize: 16,
                              color:  Color(0xFF345979),
                              fontWeight: FontWeight.w800,
                            ),
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.only(
                              left: 20,
                            ),
                            child: SizedBox(
                              width: 120,
                              height: 40,
                              child: TextFormField(
                                controller: number_of_host_on_cloud_datacenter_controller,
                                decoration: textInputDecoration,
                                  onChanged: (text)async{
                                    SharedPreferences prefs = await SharedPreferences.getInstance();
                                    prefs.setString('number_of_host_on_cloud_datacenter', number_of_host_on_cloud_datacenter_controller.text);
                                  }
                              ),
                            ),
                          )
                        ],
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(
                          bottom: 20
                      ),
                      child: Row(
                        children: [
                          SizedBox(
                            width: 200,
                            child: Text('number_of_vm_on_cloud_ host :',style: TextStyle(
                              fontSize: 16,
                              color: Color(0xFF345979),
                              fontWeight: FontWeight.w800,
                            ),
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.only(
                              left: 20,
                            ),
                            child: SizedBox(
                              width: 120,
                              height: 40,
                              child: TextFormField(
                                controller: number_of_vm_on_cloud_host_controller,
                                decoration: textInputDecoration,
                                  onChanged: (text)async{
                                    SharedPreferences prefs = await SharedPreferences.getInstance();
                                    prefs.setString('number_of_vm_on_cloud_host', number_of_vm_on_cloud_host_controller.text);
                                  }
                              ),
                            ),
                          )
                        ],
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(
                          bottom: 20
                      ),
                      child: Row(
                        children: [
                          SizedBox(
                            width: 200,
                            child: Text('core_for_cloud_vm :',style: TextStyle(
                              fontSize: 16,
                              color:  Color(0xFF345979),
                              fontWeight: FontWeight.w800,
                            ),
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.only(
                              left: 20,
                            ),
                            child: SizedBox(
                              width: 120,
                              height: 40,
                              child: TextFormField(
                                controller: core_for_cloud_vm_controller,
                                decoration: textInputDecoration,
                                  onChanged: (text)async{
                                    SharedPreferences prefs = await SharedPreferences.getInstance();
                                    prefs.setString('core_for_cloud_vm', core_for_cloud_vm_controller.text);
                                  }
                              ),
                            ),
                          )
                        ],
                      ),
                    ),

                    Padding(
                      padding: const EdgeInsets.only(
                          bottom: 20
                      ),
                      child: Row(
                        children: [
                          SizedBox(
                            width: 200,
                            child: Text('mips_for_cloud_vm :',style: TextStyle(
                              fontSize: 16,
                              color:  Color(0xFF345979),
                              fontWeight: FontWeight.w800,
                            ),
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.only(
                              left: 20,
                            ),
                            child: SizedBox(
                              width: 120,
                              height: 40,
                              child: TextFormField(
                                controller: mips_for_cloud_vm_controller,
                                decoration: textInputDecoration,
                                  onChanged: (text)async{
                                    SharedPreferences prefs = await SharedPreferences.getInstance();
                                    prefs.setString('mips_for_cloud_vm', mips_for_cloud_vm_controller.text);
                                  }
                              ),
                            ),
                          )
                        ],
                      ),
                    ),

                    Padding(
                      padding: const EdgeInsets.only(
                          bottom: 20
                      ),
                      child: Row(
                        children: [
                          SizedBox(
                            width: 200,
                            child: Text('ram_for_cloud_vm :',style: TextStyle(
                              fontSize: 16,
                              color:  Color(0xFF345979),
                              fontWeight: FontWeight.w800,
                            ),
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.only(
                              left: 20,
                            ),
                            child: SizedBox(
                              width: 120,
                              height: 40,
                              child: TextFormField(
                                controller: ram_for_cloud_vm_controller,
                                decoration: textInputDecoration,
                                  onChanged: (text)async{
                                    SharedPreferences prefs = await SharedPreferences.getInstance();
                                    prefs.setString('ram_for_cloud_vm', ram_for_cloud_vm_controller.text);
                                  }
                              ),
                            ),
                          )
                        ],
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(
                          bottom: 20
                      ),
                      child: Row(
                        children: [
                          SizedBox(
                            width: 200,
                            child: Text('storage_for_cloud_vm :',style: TextStyle(
                              fontSize: 16,
                              color:  Color(0xFF345979),
                              fontWeight: FontWeight.w800,
                            ),
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.only(
                              left: 20,
                            ),
                            child: SizedBox(
                              width: 120,
                              height: 40,
                              child: TextFormField(
                                controller: storage_for_cloud_vm_controller,
                                decoration: textInputDecoration,
                                  onChanged: (text)async{
                                    SharedPreferences prefs = await SharedPreferences.getInstance();
                                    prefs.setString('storage_for_cloud_vm', storage_for_cloud_vm_controller.text);
                                  }
                              ),
                            ),
                          )
                        ],
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(
                          bottom: 2
                      ),
                      child: Row(
                        children: [
                          Padding(
                            padding: const EdgeInsets.only(
                              top: 10,
                              left: 235,
                            ),
                            child: SizedBox(
                              height: 30,
                              width: 90,
                              child: new MaterialButton(
                                color: Colors.grey,
                                child: setUpButtonChild(),
                                onPressed: ()async{
                                  setState(() {
                                    if (_state == 0) {
                                      animateButton();
                                    }
                                  });
                                  SharedPreferences prefs = await SharedPreferences.getInstance();
                                  prefs.setString('save_app', 'true');
                                  //edit data in firebase
                                  //change flag
                                },
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ),
          )

      ),
    );
  }
  Widget setUpButtonChild() {
    if (_state == 0) {
      return new Text('save',
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

    Timer(Duration(milliseconds: 1000), () {
      setState(() {
        _state = 2;
      });
      // Navigator.of(context).pushNamed('MyFileList');
    });
  }
}
