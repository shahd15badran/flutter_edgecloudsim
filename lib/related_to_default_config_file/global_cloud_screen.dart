import 'dart:async';

import 'package:flutter/material.dart';
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
bool _hasbeenpressed =false;
  var number_of_host_on_cloud_datacenter_controller;
  var number_of_vm_on_cloud_host_controller;
  var core_for_cloud_vm_controller;
  var mips_for_cloud_vm_controller;
  var ram_for_cloud_vm_controller;
  var storage_for_cloud_vm_controller;

  void initState (){
    getData();
    super.initState();
  }
  getData() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    setState(() {
      number_of_host_on_cloud_datacenter_controller=TextEditingController(text: prefs.getString('number_of_host_on_cloud_datacenter'));
      number_of_vm_on_cloud_host_controller=TextEditingController(text: prefs.getString('number_of_vm_on_cloud_host'));
      core_for_cloud_vm_controller=TextEditingController(text: prefs.getString('core_for_cloud_vm'));
      mips_for_cloud_vm_controller=TextEditingController(text: prefs.getString('mips_for_cloud_vm'));
      ram_for_cloud_vm_controller=TextEditingController(text: prefs.getString('ram_for_cloud_vm'));
      storage_for_cloud_vm_controller=TextEditingController(text: prefs.getString('storage_for_cloud_vm'));
    });
  }

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
                                child: setUpButtonChild(),
                                onPressed: ()async{
                                  setState(() {
                                    if (_state == 0) {
                                      animateButton();
                                    }
                                  });
                                  SharedPreferences prefs = await SharedPreferences.getInstance();
                                  prefs.setString('save_app', 'true');
                                  prefs.setString('number_of_host_on_cloud_datacenter', number_of_host_on_cloud_datacenter_controller.text);
                                  prefs.setString('number_of_vm_on_cloud_host', number_of_vm_on_cloud_host_controller.text);
                                  prefs.setString('core_for_cloud_vm', core_for_cloud_vm_controller.text);
                                  prefs.setString('mips_for_cloud_vm', mips_for_cloud_vm_controller.text);
                                  prefs.setString('ram_for_cloud_vm', ram_for_cloud_vm_controller.text);
                                  prefs.setString('storage_for_cloud_vm', storage_for_cloud_vm_controller.text);

                                  //edit data in firebase
                                  //change flag
                                },
                                color: _hasbeenpressed?Colors.green :Colors.grey,

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
      setState(() {
        _hasbeenpressed = true;
      });
      return new Text('save',
        style: const TextStyle(
          color: Colors.white,
          fontSize: 16.0,
        ),
      );
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
