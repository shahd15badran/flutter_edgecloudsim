

import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_edgecloudsim/widgets/NavDrawer.dart';
import 'package:flutter_edgecloudsim/widgets/constants.dart';
import 'package:flutter_edgecloudsim/widgets/original_button.dart';
import 'package:shared_preferences/shared_preferences.dart';
class ContAddAppScreen extends StatefulWidget {
  @override
  _ContAddAppScreenState createState() => _ContAddAppScreenState();
}

class _ContAddAppScreenState extends State<ContAddAppScreen>with TickerProviderStateMixin {
  int _state = 0;
  bool  _hasbeenpressed=false;

  void initState (){
    getData();
    super.initState();
  }
  getData() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    setState((){
      counter= prefs.getInt('counter');
    });
    idle_period_controller=TextEditingController(text:prefs.getStringList('idle_period')[counter-1]);
    data_upload_controller=TextEditingController(text:prefs.getStringList('data_upload') [counter-1]);
    data_download_controller=TextEditingController(text:prefs.getStringList ('data_download')[counter-1]);
    task_length_controller=TextEditingController(text: prefs.getStringList('task_length')[counter-1]);
    required_core_controller=TextEditingController(text:prefs.getStringList ('required_core')[counter-1]);
    vm_utilization_on_edge_controller=TextEditingController(text: prefs.getStringList('vm_utilization_on_edge')[counter-1]);
    vm_utilization_on_cloud_controller=TextEditingController(text:prefs.getStringList ('vm_utilization_on_cloud')[counter-1]);
    vm_utilization_on_mobile_controller=TextEditingController(text:prefs.getStringList ('vm_utilization_on_mobile')[counter-1]);

    idle_period = prefs.getStringList('idle_period');
    data_upload =prefs.getStringList('data_upload');
    data_download=prefs.getStringList ('data_download');
    task_length= prefs.getStringList('task_length');
    required_core=prefs.getStringList ('required_core');
    vm_utilization_on_edge= prefs.getStringList('vm_utilization_on_edge');
    vm_utilization_on_cloud=prefs.getStringList ('vm_utilization_on_cloud');
    vm_utilization_on_mobile=prefs.getStringList ('vm_utilization_on_mobile');


  }


  int counter=1;

  List <String> idle_period;
  List <String> data_upload;
  List <String> data_download;
  List <String> task_length;
  List <String> required_core;
  List <String> vm_utilization_on_edge;
  List <String> vm_utilization_on_cloud;
  List <String> vm_utilization_on_mobile;

  var idle_period_controller;
  var data_upload_controller;
  var data_download_controller;
  var task_length_controller;
  var required_core_controller;
  var vm_utilization_on_edge_controller;
  var vm_utilization_on_cloud_controller;
  var vm_utilization_on_mobile_controller;


  @override
  Widget build(BuildContext context) {
    return new WillPopScope(
        onWillPop: () {   Navigator.of(context).pushNamed('add application');},
        child: Scaffold(
      appBar: AppBar(
        backgroundColor:  Color(0xFF77A5CD),
        title: Row(
          children: [
            Padding(
              padding: const EdgeInsets.only(
               //left: 80,
            ),
              child: Text('Application'+counter.toString(),style: TextStyle(
                fontSize: 18,
                color: Colors.white,
                fontWeight: FontWeight.w600,
              ),
              ),
            ),
            Padding(
                padding: const EdgeInsets.only(
                 left: 170,
                ),

                  child: new IconButton(
                    icon: new Icon(Icons.home_sharp,color: Colors.white,),
                    tooltip:'Home Page' ,

                    onPressed: () {   Navigator.of(context).pushNamed('graphical');
                    },
                  ),

                ),
          ],
        ),
      ),
      body: Padding(
          padding: const EdgeInsets.only(
           // left: 16.0,
            right: 20.0,
            top: 40.0,
          ),
          child: SingleChildScrollView(
            child: Container(
              child: Padding(
                padding: const EdgeInsets.only(
                    top: 30,
                    right: 16,
                    left: 30
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
                            width: 200,
                            child: Text('idle_period :',style: TextStyle(
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
                                  controller:idle_period_controller ,
                                  decoration: textInputDecoration,
                                  //idle_period_controller.text = idle_period[3];
                                  onChanged: (text)async{
                                   idle_period[counter-1]=idle_period_controller.text;
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
                            width: 200,
                            child: Text('data_upload :',style: TextStyle(
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
                                  controller: data_upload_controller,
                                  decoration: textInputDecoration,
                                  onChanged: (text)async{
                                   data_upload[counter-1]=data_upload_controller.text;
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
                            width: 200,
                            child: Text('data_download :',style: TextStyle(
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
                                  controller: data_download_controller,
                                  decoration: textInputDecoration,
                                  onChanged: (text)async{
                                   data_download[counter-1]=data_download_controller.text;
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
                            width: 200,
                            child: Text('task_length :',style: TextStyle(
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
                                  controller: task_length_controller,
                                  decoration: textInputDecoration,
                                  onChanged: (text)async{
                                   task_length[counter-1]=task_length_controller.text;
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
                            width: 200,
                            child: Text('required_core :',style: TextStyle(
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
                                  controller: required_core_controller,
                                  decoration: textInputDecoration,
                                  onChanged: (text)async{
                                   required_core[counter-1]=required_core_controller.text;
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
                            width: 200,
                            child: Text('vm_utilization_on_edge :',style: TextStyle(
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
                                  controller: vm_utilization_on_edge_controller,
                                  decoration: textInputDecoration,
                                  onChanged: (text)async{
                                   vm_utilization_on_edge[counter-1]=vm_utilization_on_edge_controller.text;
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
                            width: 200,
                            child: Text('vm_utilization_on_cloud :',style: TextStyle(
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
                                  controller: vm_utilization_on_cloud_controller,
                                  decoration: textInputDecoration,
                                  onChanged: (text)async{
                                   vm_utilization_on_cloud[counter-1]=vm_utilization_on_cloud_controller.text;
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
                            width: 200,
                            child: Text('vm_utilization_on_mobile :',style: TextStyle(
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
                                  controller: vm_utilization_on_mobile_controller,
                                  decoration: textInputDecoration,
                                  onChanged: (text)async{
                                  vm_utilization_on_mobile[counter-1]=vm_utilization_on_mobile_controller.text;
                                  }
                              ),
                            ),
                          )
                        ],
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(
                        top: 15,
                      ),
                      child: Row(
                        children: [
                          Padding(
                            padding: const EdgeInsets.only(
                              left: 247,
                            ),
                            child: SizedBox(
                              height: 30,
                              width: 90,
                              child: new MaterialButton(
                                child: setUpButtonChild(),
                                onPressed: ()async{
                                  SharedPreferences prefs = await SharedPreferences.getInstance();
                                  prefs.setStringList('idle_period', idle_period);
                                  prefs.setStringList('data_upload', data_upload);
                                  prefs.setStringList('data_download', data_download);
                                  prefs.setStringList('task_length', task_length);
                                  prefs.setStringList('required_core', required_core);
                                  prefs.setStringList('vm_utilization_on_edge', vm_utilization_on_edge);
                                  prefs.setStringList('vm_utilization_on_cloud', vm_utilization_on_cloud);
                                  prefs.setStringList('vm_utilization_on_mobile', vm_utilization_on_mobile);
                                  setState(() {
                                    if (_state == 0) {
                                      animateButton();
                                    }
                                  });
                                  prefs.setString('save_app', 'true');
                                  //edit data in firebase
                                  //change flag
                                },
                                color: _hasbeenpressed? Colors.green : Colors.grey,
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
                                left: 2
                            ),
                            child: SizedBox(
                              width: 140,
                              height: 40,
                              child: counter>1?OriginalButton(
                                text:'Previous App',
                                textColor: Colors.white,
                                color:  Color(0xFF345979),
                                onPressed: ()async{
                                  SharedPreferences prefs = await SharedPreferences.getInstance();
                                  counter = prefs.getInt(('counter'));
                                  if(counter != 1)
                                    prefs.setInt('counter', counter-1);
                                  else
                                    counter = 1;
                                  Navigator.of(context).pushNamed('add application');
                                  //edit data in firebase
                                  //change flag
                                },
                              ):Text(''),
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.only(
                                left: 90
                            ),
                            child: SizedBox(
                              width: 100,
                              height: 40,
                                child: OriginalButton(
                                  text:'Next App',
                                  textColor: Colors.white,
                                  color:  Color(0xFF345979),
                                  onPressed: ()async{
                                    SharedPreferences prefs = await SharedPreferences.getInstance();
                                    prefs.setInt('counter', counter+1);
                                    Navigator.of(context).pushNamed('add application');
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
    ));
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
    } else  {
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
