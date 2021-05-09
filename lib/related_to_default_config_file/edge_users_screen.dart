import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_edgecloudsim/services/auth.dart';
import 'package:flutter_edgecloudsim/widgets/NavDrawer.dart';
import 'package:flutter_edgecloudsim/widgets/constants.dart';
import 'package:flutter_edgecloudsim/widgets/original_button.dart';
import 'package:shared_preferences/shared_preferences.dart';
class EdgeUserScreen extends StatefulWidget {
  @override
  _EdgeUserScreenState createState() => _EdgeUserScreenState();
}

class _EdgeUserScreenState extends State<EdgeUserScreen> with TickerProviderStateMixin {
  int _state = 0;
  bool _hasbeenpressed=false;
  AuthBase authBase = AuthBase();
  var min_number_of_mobile_devices_controller;
  var max_number_of_mobile_devices_controller;
  var mobile_device_counter_size_controller;
  var core_for_mobile_vm_controller;
  var mips_for_mobile_vm_controller;
  var ram_for_mobile_vm_controller;
  var storage_for_mobile_vm_controller;

  void initState (){
    getData();
    super.initState();
  }
  getData() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    setState(() {
      min_number_of_mobile_devices_controller = TextEditingController(text: prefs.getString('min_number_of_mobile_devices'));
      max_number_of_mobile_devices_controller = TextEditingController(text: prefs.getString('max_number_of_mobile_devices'));
      mobile_device_counter_size_controller = TextEditingController(text: prefs.getString('mobile_device_counter_size'));
      core_for_mobile_vm_controller = TextEditingController(text: prefs.getString('core_for_mobile_vm'));
      mips_for_mobile_vm_controller = TextEditingController(text: prefs.getString('mips_for_mobile_vm'));
      ram_for_mobile_vm_controller = TextEditingController(text: prefs.getString('ram_for_mobile_vm'));
      storage_for_mobile_vm_controller = TextEditingController(text: prefs.getString('storage_for_mobile_vm'));
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
            top: 80.0,
          ),
          child: SingleChildScrollView(
            child: Container(
              //color: Colors.white70,
              child: Padding(
                padding: const EdgeInsets.only(
                    top: 30,
                    right: 16,
                    left: 16
                ),
                child: Column(
                  children:<Widget> [
                    Padding(
                      padding: const EdgeInsets.only(
                          bottom: 10
                      ),
                      child: Row(
                        children: [
                          SizedBox(
                            width: 240,
                            child: Text('min_number_of_mobile_devices :',style: TextStyle(
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
                              width: 80,
                              height: 40,
                              child: TextFormField(
                                controller: min_number_of_mobile_devices_controller,
                                decoration: textInputDecoration,
                              ),
                            ),
                          )
                        ],
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(
                          bottom: 10
                      ),
                      child: Row(
                        children: [
                          SizedBox(
                            width: 240,
                            child: Text('max_number_of_mobile_devices:',style: TextStyle(
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
                              width: 80,
                              height: 40,
                              child: TextFormField(
                                controller: max_number_of_mobile_devices_controller,
                                decoration: textInputDecoration,
                              ),
                            ),
                          )
                        ],
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(
                          bottom: 10
                      ),
                      child: Row(
                        children: [
                          SizedBox(
                            width: 240,
                            child: Text('mobile_device_counter_size:',style: TextStyle(
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
                              width: 80,
                              height: 40,
                              child: TextFormField(
                                controller:mobile_device_counter_size_controller ,
                                decoration: textInputDecoration,
                              ),
                            ),
                          )
                        ],
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(
                          bottom: 10,
                        left: 20
                      ),
                      child: Row(
                        children: [
                          SizedBox(
                            width: 300,
                            child: Text('______________________________________',style: TextStyle(
                              fontSize: 16,
                              color: Colors.black,
                              fontWeight: FontWeight.w800,
                            ),
                            ),
                          ),
                        ],
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(
                          top: 20,
                         bottom: 10,
                        left: 50
                      ),
                      child: Row(
                        children: [
                          SizedBox(
                            width: 200,
                            child: Text('core_for_mobile_vm :',style: TextStyle(
                              fontSize: 16,
                              color:  Color(0xFF345979),
                              fontWeight: FontWeight.w800,
                            ),
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.only(

                            ),
                            child: SizedBox(
                              width: 80,
                              height: 40,
                              child: TextFormField(
                                controller: core_for_mobile_vm_controller,
                                decoration: textInputDecoration,
                              ),
                            ),
                          )
                        ],
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(
                          top: 2,
                          bottom: 10,
                          left: 50
                      ),
                      child: Row(
                        children: [
                          SizedBox(
                            width: 200,
                            child: Text('mips_for_mobile_vm :',style: TextStyle(
                              fontSize: 16,
                              color:  Color(0xFF345979),
                              fontWeight: FontWeight.w800,
                            ),
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.only(

                            ),
                            child: SizedBox(
                              width: 80,
                              height: 40,
                              child: TextFormField(
                                controller: mips_for_mobile_vm_controller,
                                decoration: textInputDecoration,
                              ),
                            ),
                          )
                        ],
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(
                          top: 2,
                          bottom: 10,
                          left: 50
                      ),
                      child: Row(
                        children: [
                          SizedBox(
                            width: 200,
                            child: Text('ram_for_mobile_vm :',style: TextStyle(
                              fontSize: 16,
                              color:  Color(0xFF345979),
                              fontWeight: FontWeight.w800,
                            ),
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.only(

                            ),
                            child: SizedBox(
                              width: 80,
                              height: 40,
                              child: TextFormField(
                                controller: ram_for_mobile_vm_controller,
                                decoration: textInputDecoration,
                              ),
                            ),
                          )
                        ],
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(
                          top: 2,
                          bottom: 10,
                          left: 50
                      ),
                      child: Row(
                        children: [
                          SizedBox(
                            width: 200,
                            child: Text('storage_for_mobile_vm :',style: TextStyle(
                              fontSize: 16,
                              color:  Color(0xFF345979),
                              fontWeight: FontWeight.w800,
                            ),
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.only(

                            ),
                            child: SizedBox(
                              width: 80,
                              height: 40,
                              child: TextFormField(
                                controller: storage_for_mobile_vm_controller,
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
                              left: 245,
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
                                  prefs.setString('min_number_of_mobile_devices', min_number_of_mobile_devices_controller.text);
                                  prefs.setString('max_number_of_mobile_devices', max_number_of_mobile_devices_controller.text);
                                  prefs.setString('mobile_device_counter_size', mobile_device_counter_size_controller.text);
                                  prefs.setString('core_for_mobile_vm', core_for_mobile_vm_controller.text);
                                  prefs.setString('mips_for_mobile_vm', mips_for_mobile_vm_controller.text);
                                  prefs.setString('ram_for_mobile_vm', ram_for_mobile_vm_controller.text);
                                  prefs.setString('storage_for_mobile_vm', storage_for_mobile_vm_controller.text);
                                  //edit data in firebase
                                  //change flag
                                },
                                color: _hasbeenpressed?Colors.green : Colors.grey,

                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(
                        top: 50,
                        left: 15,
                      ),
                      child: SizedBox(
                        height: 50,
                        width: 200,
                        child: OriginalButton(
                          text:'Edit Data Centers',
                          textColor: Colors.white,
                          color: Color(0xFF345979),
                          onPressed: ()async{
                            SharedPreferences prefs = await SharedPreferences.getInstance();
                            prefs.setInt('counter', 1);
                            Navigator.of(context).pushNamed('data center');
                          },
                        ),
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
