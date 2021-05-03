import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_edgecloudsim/services/auth.dart';
import 'package:flutter_edgecloudsim/widgets/constants.dart';
import 'package:flutter_edgecloudsim/widgets/original_button.dart';
import 'package:shared_preferences/shared_preferences.dart';
class EdgeUserScreen extends StatefulWidget {
  @override
  _EdgeUserScreenState createState() => _EdgeUserScreenState();
}

class _EdgeUserScreenState extends State<EdgeUserScreen> with TickerProviderStateMixin {
  int _state = 0;
  AuthBase authBase = AuthBase();
  final min_number_of_mobile_devices_controller=TextEditingController(text: "100");
  final max_number_of_mobile_devices_controller=TextEditingController(text: "1000");
  final mobile_device_counter_size_controller=TextEditingController(text: "100");
  final core_for_mobile_vm_controller=TextEditingController(text: "0");
  final mips_for_mobile_vm_controller=TextEditingController(text: "0");
  final ram_for_mobile_vm_controller=TextEditingController(text: "0");
  final storage_for_mobile_vm_controller=TextEditingController(text: "0");


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
            left: 16.0,
            right: 10.0,
            top: 80.0,
          ),
          child: SingleChildScrollView(
            child: Container(
              color: Colors.white70,
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
                              color: Colors.blue,
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
                                  onChanged: (text)async{
                                    SharedPreferences prefs = await SharedPreferences.getInstance();
                                    prefs.setString('min_number_of_mobile_devices', min_number_of_mobile_devices_controller.text);
                                  }
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
                              color: Colors.blue,
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
                                  onChanged: (text)async{
                                    SharedPreferences prefs = await SharedPreferences.getInstance();
                                    prefs.setString('max_number_of_mobile_devices', max_number_of_mobile_devices_controller.text);
                                  }
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
                              color: Colors.blue,
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
                                  onChanged: (text)async{
                                    SharedPreferences prefs = await SharedPreferences.getInstance();
                                    prefs.setString('mobile_device_counter_size', mobile_device_counter_size_controller.text);
                                  }
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
                              color: Colors.blue,
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
                                  onChanged: (text)async{
                                    SharedPreferences prefs = await SharedPreferences.getInstance();
                                    prefs.setString('core_for_mobile_vm', core_for_mobile_vm_controller.text);
                                  }
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
                              color: Colors.blue,
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
                                  onChanged: (text)async{
                                    SharedPreferences prefs = await SharedPreferences.getInstance();
                                    prefs.setString('mips_for_mobile_vm', mips_for_mobile_vm_controller.text);
                                  }
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
                              color: Colors.blue,
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
                                  onChanged: (text)async{
                                    SharedPreferences prefs = await SharedPreferences.getInstance();
                                    prefs.setString('ram_for_mobile_vm', ram_for_mobile_vm_controller.text);
                                  }
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
                              color: Colors.blue,
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
                                  onChanged: (text)async{
                                    SharedPreferences prefs = await SharedPreferences.getInstance();
                                    prefs.setString('storage_for_mobile_vm', storage_for_mobile_vm_controller.text);
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
                              left: 245,
                            ),
                            child: SizedBox(
                              height: 30,
                              width: 90,
                              child: new MaterialButton(
                                color: Colors.blue,
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
                          color: Colors.blueGrey,
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
