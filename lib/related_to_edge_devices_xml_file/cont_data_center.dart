import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_edgecloudsim/services/auth.dart';
import 'package:flutter_edgecloudsim/widgets/NavDrawer.dart';
import 'package:flutter_edgecloudsim/widgets/constants.dart';
import 'package:flutter_edgecloudsim/widgets/original_button.dart';
import 'package:shared_preferences/shared_preferences.dart';
class ContDataCenterScreen extends StatefulWidget {
  @override
  _ContDataCenterScreenState createState() => _ContDataCenterScreenState();
}

class _ContDataCenterScreenState extends State<ContDataCenterScreen>with TickerProviderStateMixin {
  int _state = 0;
bool _hasbeenpressed =false;
  void initState (){
    getData();
    super.initState();

  }
  getData() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    setState((){
      counter= prefs.getInt('counter');
    });

    core=prefs.getStringList('core');
    mips=prefs.getStringList('mips');
    ram=prefs.getStringList('ram');
    storage=prefs.getStringList('storage');
    core1=prefs.getStringList('core1');
    mips1=prefs.getStringList('mips1');
    ram1=prefs.getStringList('ram1');
    storage1=prefs.getStringList('storage1');
    core2=prefs.getStringList('core2');
    mips2=prefs.getStringList('mips2');
    ram2=prefs.getStringList('ram2');
    storage2=prefs.getStringList('storage2');

    core_controller=TextEditingController(text:core[counter-1]);
    mips_controller=TextEditingController(text: mips[counter-1]);
    ram_controller=TextEditingController(text:ram[counter-1]);
    storage_controller=TextEditingController(text:storage[counter-1]);

    core_vm1_controller=TextEditingController(text:core1[counter-1]);
    mips_vm1_controller=TextEditingController(text:mips1[counter-1]);
    ram_vm1_controller=TextEditingController(text:ram1[counter-1]);
    storage_vm1_controller=TextEditingController(text:storage1[counter-1]);

    core_vm2_controller=TextEditingController(text:core2[counter-1]);
    mips_vm2_controller=TextEditingController(text:mips2[counter-1]);
    ram_vm2_controller=TextEditingController(text:ram2[counter-1]);
    storage_vm2_controller=TextEditingController(text:storage2[counter-1]);


  }
  AuthBase authBase = AuthBase();
  int counter=1;

  List<String>core;
  List<String>mips;
  List<String>ram;
  List<String>storage;
  List<String>core1;
  List<String>mips1;
  List<String>ram1;
  List<String>storage1;
  List<String>core2;
  List<String>mips2;
  List<String>ram2;
  List<String>storage2;

  var core_controller;
  var mips_controller;
  var ram_controller;
  var storage_controller;

  var core_vm1_controller;
  var mips_vm1_controller;
  var ram_vm1_controller;
  var storage_vm1_controller;

  var core_vm2_controller;
  var mips_vm2_controller;
  var ram_vm2_controller;
  var storage_vm2_controller;


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
            Padding(padding: const EdgeInsets.only(
              // left: 30,
            ),
              child: Text('Data Center'+counter.toString(),style: TextStyle(
                fontSize: 18,
                color: Colors.white,
                fontWeight: FontWeight.w600,
              ),
              ),
            ),
            Padding(
                  padding: const EdgeInsets.only(
                      left: 90
                  ),
                  child: new IconButton(
                    icon: new Icon(Icons.home_sharp,color: Colors.white,),
                    tooltip:'Home Page' ,
                    onPressed: () {   Navigator.of(context).pushNamed('graphical');
                    },
                  ),
                ),
            Padding(
              padding: const EdgeInsets.only(
                //  right: 20,
                  left: 25,
                  bottom: 15
              ),
              child: IconButton(
                icon: new Icon(Icons.arrow_right_rounded,color: Colors.white,size: 50),
                tooltip:'back' ,

                onPressed: () {   Navigator.of(context).pushNamed('data center');
                },
              ),
            ),
          ],
        ),
      ),
      body: Padding(
          padding: const EdgeInsets.only(
            left: 16.0,
            right: 16.0,
            top: 60.0,
          ),
          child: SingleChildScrollView(
            child: Container(
              //color: Colors.white70,
              child: Padding(
                padding: const EdgeInsets.only(
                    right: 10,
                    left: 10
                ),
                child: Column(
                  children:<Widget> [
                    Padding(
                      padding: const EdgeInsets.only(
                          left: 8
                      ),
                      child: Text('this file stores the characteristic of the data center, many data centers are used, each of them has a host and each host utilize some virtual machines..',style: TextStyle(
                        fontSize: 18,
                        color: Color(0xFF345979),
                        fontWeight: FontWeight.w800,
                      ),
                      ),
                    ),
                    ////////////////////////////////////////////
                    Padding(
                      padding: const EdgeInsets.only(
                          bottom: 1,
                          top: 50
                      ),
                      child: Row(
                        children: [
                          SizedBox(
                            width: 300,
                            child: Text('Hosts',style: TextStyle(
                              fontSize: 20,
                              color: Colors.black45,
                              fontWeight: FontWeight.w800,
                            ),
                            ),
                          ),
                        ],
                      ),
                    ),
                    /////////////////////////////////////////////////////
                    Padding(
                      padding: const EdgeInsets.only(
                          top: 5,
                          bottom: 1,
                          left: 100
                      ),
                      child: Row(
                        children: [

                            Text('host',style: TextStyle(
                              fontSize: 16,
                              color: Colors.black45,
                              fontWeight: FontWeight.w800,
                            ),
                            ),


                             Padding(
                               padding: const EdgeInsets.only(
                                 left: 80
                               ),
                               child: Text('VM',style: TextStyle(
                                fontSize: 16,
                                color: Colors.black45,
                                fontWeight: FontWeight.w800,
                            ),
                            ),
                             ),
                           Padding(
                             padding: const EdgeInsets.only(left: 50),
                             child: Text('VM',style: TextStyle(
                                fontSize: 16,
                                color: Colors.black45,
                                fontWeight: FontWeight.w800,
                              ),
                              ),
                           ),


                        ],
                      ),
                    ),

                    /////////////////////////////////////////////////////

                    Padding(
                      padding: const EdgeInsets.only(
                          top: 5,
                          bottom: 1,
                          left: 10
                      ),
                      child: Row(
                        children: [
                          SizedBox(
                            width: 80,
                            child: Text('core:',style: TextStyle(
                              fontSize: 16,
                              color: Color(0xFF345979),
                              fontWeight: FontWeight.w800,
                            ),
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.only(
                              left: 2,
                            ),
                            child: SizedBox(
                              width: 85,
                              height: 30,
                              child: TextFormField(
                                  controller: core_controller,
                                  decoration: textInputDecoration,
                                  onChanged: (text)async{
                                   core[counter-1]=core_controller.text;
                                  }

                              ),
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.only(
                              left: 6,
                            ),
                            child: SizedBox(
                              width: 80,
                              height: 30,
                              child: TextFormField(
                                  controller: core_vm1_controller,
                                  decoration: textInputDecoration,
                                  onChanged: (text)async{
                                    core1[counter-1]=core_vm1_controller.text;
                                  }
                              ),
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.only(
                              left: 6,
                            ),
                            child: SizedBox(
                              width: 80,
                              height: 30,
                              child: TextFormField(
                                  controller: core_vm2_controller,
                                  decoration: textInputDecoration,
                                  onChanged: (text)async{
                                   core2[counter-1]=core_vm2_controller.text;
                                  }
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(
                          top: 5,
                          bottom: 1,
                          left: 10
                      ),
                      child: Row(
                        children: [
                          SizedBox(
                            width: 80,
                            child: Text('mips:',style: TextStyle(
                              fontSize: 16,
                              color:  Color(0xFF345979),
                              fontWeight: FontWeight.w800,
                            ),
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.only(
                              left: 2,
                            ),
                            child: SizedBox(
                              width: 85,
                              height: 30,
                              child: TextFormField(
                                  controller: mips_controller,
                                  decoration: textInputDecoration,
                                  onChanged: (text)async{
                                    mips[counter-1]=mips_controller.text;
                                  }
                              ),
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.only(
                              left: 6,
                            ),
                            child: SizedBox(
                              width: 80,
                              height: 30,
                              child: TextFormField(
                                  controller: mips_vm1_controller,
                                  decoration: textInputDecoration,
                                  onChanged: (text)async{
                                   mips1[counter-1]=mips_vm1_controller.text;
                                  }
                              ),
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.only(
                              left: 6,
                            ),
                            child: SizedBox(
                              width: 80,
                              height: 30,
                              child: TextFormField(
                                  controller: mips_vm2_controller,
                                  decoration: textInputDecoration,
                                  onChanged: (text)async{
                                   mips2[counter-1]=mips_vm2_controller.text;
                                  }
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(
                          top: 5,
                          bottom: 1,
                          left: 10
                      ),
                      child: Row(
                        children: [
                          SizedBox(
                            width: 80,
                            child: Text('ram:',style: TextStyle(
                              fontSize: 16,
                              color:  Color(0xFF345979),
                              fontWeight: FontWeight.w800,
                            ),
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.only(
                              left: 2,
                            ),
                            child: SizedBox(
                              width: 85,
                              height: 30,
                              child: TextFormField(
                                  controller: ram_controller,
                                  decoration: textInputDecoration,
                                  onChanged: (text)async{
                                    ram[counter-1]=ram_controller.text;
                                  }
                              ),
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.only(
                              left: 6,
                            ),
                            child: SizedBox(
                              width: 80,
                              height: 30,
                              child: TextFormField(
                                  controller: ram_vm1_controller,
                                  decoration: textInputDecoration,
                                  onChanged: (text)async{
                                   ram1[counter-1]=ram_vm1_controller.text;
                                  }
                              ),
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.only(
                              left: 6,
                            ),
                            child: SizedBox(
                              width: 80,
                              height: 30,
                              child: TextFormField(
                                  controller: ram_vm2_controller,
                                  decoration: textInputDecoration,
                                  onChanged: (text)async{
                                  ram2[counter-1]=ram_vm2_controller.text;
                                  }
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(
                          top: 5,
                          bottom: 20,
                          left: 10
                      ),
                      child: Row(
                        children: [
                          SizedBox(
                            width: 80,
                            child: Text('storage:',style: TextStyle(
                              fontSize: 16,
                              color:  Color(0xFF345979),
                              fontWeight: FontWeight.w800,
                            ),
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.only(
                              left: 2,
                            ),
                            child: SizedBox(
                              width: 85,
                              height: 30,
                              child: TextFormField(
                                  controller: storage_controller,
                                  decoration: textInputDecoration,
                                  onChanged: (text)async{
                                   storage[counter-1]=storage_controller.text;
                                  }
                              ),
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.only(
                              left: 6,
                            ),
                            child: SizedBox(
                              width: 80,
                              height: 30,
                              child: TextFormField(
                                  controller: storage_vm1_controller,
                                  decoration: textInputDecoration,
                                  onChanged: (text)async{
                                   storage1[counter-1]=storage_vm1_controller.text;
                                  }
                              ),
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.only(
                              left: 6,
                            ),
                            child: SizedBox(
                              width: 80,
                              height: 30,
                              child: TextFormField(
                                  controller: storage_vm2_controller,
                                  decoration: textInputDecoration,
                                  onChanged: (text)async{
                                   storage2[counter-1]=storage_vm2_controller.text;
                                  }
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                    ////////////////////////////////////////////
                    Padding(
                      padding: const EdgeInsets.only(
                      ),
                      child: Row(
                        children: [
                          Padding(
                            padding: const EdgeInsets.only(
                              left: 260,
                              bottom: 30
                            ),
                            child: SizedBox(
                              height: 30,
                              width: 80,
                              child: new MaterialButton(
                                child: setUpButtonChild(),
                                onPressed: ()async{
                                  SharedPreferences prefs = await SharedPreferences.getInstance();
                                  prefs.setStringList('core', core);
                                  prefs.setStringList('mips', mips);
                                  prefs.setStringList('ram', ram);
                                  prefs.setStringList('storage', storage);
                                  prefs.setStringList('core1', core1);
                                  prefs.setStringList('mips1', mips1);
                                  prefs.setStringList('ram1', ram1);
                                  prefs.setStringList('storage1', storage1);
                                  prefs.setStringList('core2', core2);
                                  prefs.setStringList('mips2', mips2);
                                  prefs.setStringList('ram2', ram2);
                                  prefs.setStringList('storage2', storage2);
                                  setState(() {
                                    if (_state == 0) {
                                      animateButton();
                                    }
                                  });
                                  prefs.setString('save_app', 'true');
                                  //edit data in firebase
                                  //change flag
                                },
                                color:_hasbeenpressed?Colors.green: Colors.grey,

                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(
                        top: 30,
                      ),
                      child: Row(
                        children: [
                          Padding(
                            padding: const EdgeInsets.only(
                                left: 2,
                            ),
                            child: SizedBox(
                              width: 140,
                              height: 40,
                              child: OriginalButton(
                                text:'Previous DC',
                                textColor: Colors.white,
                                color:Color(0xFF345979),
                                onPressed: ()async{
                                  SharedPreferences prefs = await SharedPreferences.getInstance();
                                  counter = prefs.getInt(('counter'));
                                  if(counter != 1)
                                    prefs.setInt('counter', counter-1);
                                  else
                                    counter = 1;
                                  Navigator.of(context).pushNamed('data center');
                                  //edit data in firebase
                                  //change flag
                                },
                              ),
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.only(
                                left: 105
                            ),
                            child: SizedBox(
                              width: 100,
                              height: 40,
                              child: OriginalButton(
                                text:'Next DC',
                                textColor: Colors.white,
                                color: Color(0xFF345979),
                                onPressed: ()async{
                                  SharedPreferences prefs = await SharedPreferences.getInstance();
                                  prefs.setInt('counter', counter+1);
                                  Navigator.of(context).pushNamed('data center');
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
