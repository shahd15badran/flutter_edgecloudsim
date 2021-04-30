

import 'package:flutter/material.dart';
import 'package:flutter_edgecloudsim/services/auth.dart';
import 'package:flutter_edgecloudsim/widgets/constants.dart';
import 'package:flutter_edgecloudsim/widgets/original_button.dart';
import 'package:shared_preferences/shared_preferences.dart';
class ContAddAppScreen extends StatefulWidget {
  @override
  _ContAddAppScreenState createState() => _ContAddAppScreenState();
}

class _ContAddAppScreenState extends State<ContAddAppScreen> {
  void initState (){
    getData();
  }
  getData() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    setState((){
      counter= prefs.getInt('counter');});
  }

  AuthBase authBase = AuthBase();
  int counter=1;
  List <String> idle_period=['15','20','60','45'];//60
  List <String> data_upload=['1500','1250','2500','25'];
  List <String> data_download=['25','20','250','2000'];
  List <String> task_length=['2000','400','3000','750'];
  List <String> required_core=['1','1','1','1'];
  List <String> vm_utilization_on_edge=['20','5','30','10'];
  List <String> vm_utilization_on_cloud=['2','0.5','3','1'];
  List <String> vm_utilization_on_mobile=['0','0','0','1'];
  var idle_period_controller;
  var data_upload_controller;
  var data_download_controller;
  var task_length_controller;
  var required_core_controller;
  var vm_utilization_on_edge_controller;
  var vm_utilization_on_cloud_controller;
  var vm_utilization_on_mobile_controller;

  _ContAddAppScreenState(){

    getData() async {
      SharedPreferences prefs = await SharedPreferences.getInstance();
      setState((){
        counter= prefs.getInt('counter');
      });
      idle_period_controller=TextEditingController(text:idle_period[counter-1]);
      data_upload_controller=TextEditingController(text: data_upload[counter-1]);
      data_download_controller=TextEditingController(text: data_download[counter-1]);
      task_length_controller=TextEditingController(text: task_length[counter-1]);
      required_core_controller=TextEditingController(text: required_core[counter-1]);
      vm_utilization_on_edge_controller=TextEditingController(text: vm_utilization_on_edge[counter-1]);
      vm_utilization_on_cloud_controller=TextEditingController(text: vm_utilization_on_cloud[counter-1]);
      vm_utilization_on_mobile_controller=TextEditingController(text: vm_utilization_on_mobile[counter-1]);
    }
    getData();
  }

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
            Padding(padding: const EdgeInsets.only(
              // left: 30,
            ),
              child: Text('Application'+counter.toString(),style: TextStyle(
                fontSize: 18,
                color: Colors.black,
                fontWeight: FontWeight.w600,
              ),),
            ),
            Padding(
              padding: const EdgeInsets.only(
                left: 120,
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
            right: 20.0,
            top: 60.0,
          ),
          child: SingleChildScrollView(
            child: Container(
              color: Colors.white,
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
                            width: 200,
                            child: Text('idle_period :',style: TextStyle(
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
                              width: 120,
                              height: 40,
                              child: TextFormField(
                                  controller:idle_period_controller ,
                                  decoration: textInputDecoration,
                                  //idle_period_controller.text = idle_period[3];
                                  onChanged: (text)async{
                                    SharedPreferences prefs = await SharedPreferences.getInstance();
                                    prefs.setString('idle_period', idle_period_controller.text);
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
                              width: 120,
                              height: 40,
                              child: TextFormField(
                                  controller: data_upload_controller,
                                  decoration: textInputDecoration,
                                  onChanged: (text)async{
                                    SharedPreferences prefs = await SharedPreferences.getInstance();
                                    prefs.setString('data_upload', data_upload_controller.text);
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
                              width: 120,
                              height: 40,
                              child: TextFormField(
                                  controller: data_download_controller,
                                  decoration: textInputDecoration,
                                  onChanged: (text)async{
                                    SharedPreferences prefs = await SharedPreferences.getInstance();
                                    prefs.setString('data_download', data_download_controller.text);
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
                              width: 120,
                              height: 40,
                              child: TextFormField(
                                  controller: task_length_controller,
                                  decoration: textInputDecoration,
                                  onChanged: (text)async{
                                    SharedPreferences prefs = await SharedPreferences.getInstance();
                                    prefs.setString('task_length', task_length_controller.text);
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
                              width: 120,
                              height: 40,
                              child: TextFormField(
                                  controller: required_core_controller,
                                  decoration: textInputDecoration,
                                  onChanged: (text)async{
                                    SharedPreferences prefs = await SharedPreferences.getInstance();
                                    prefs.setString('required_core', required_core_controller.text);
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
                              width: 120,
                              height: 40,
                              child: TextFormField(
                                  controller: vm_utilization_on_edge_controller,
                                  decoration: textInputDecoration,
                                  onChanged: (text)async{
                                    SharedPreferences prefs = await SharedPreferences.getInstance();
                                    prefs.setString('vm_utilization_on_edge', vm_utilization_on_edge_controller.text);
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
                              width: 120,
                              height: 40,
                              child: TextFormField(
                                  controller: vm_utilization_on_cloud_controller,
                                  decoration: textInputDecoration,
                                  onChanged: (text)async{
                                    SharedPreferences prefs = await SharedPreferences.getInstance();
                                    prefs.setString('vm_utilization_on_cloud', vm_utilization_on_cloud_controller.text);
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
                              width: 120,
                              height: 40,
                              child: TextFormField(
                                  controller: vm_utilization_on_mobile_controller,
                                  decoration: textInputDecoration,
                                  onChanged: (text)async{
                                    SharedPreferences prefs = await SharedPreferences.getInstance();
                                    prefs.setString('vm_utilization_on_mobile', vm_utilization_on_mobile_controller.text);
                                  }
                              ),
                            ),
                          )
                        ],
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(
                        top: 40,
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
                                  child: OriginalButton(
                                    text:'Previous App',
                                    textColor: Colors.white,
                                    color: Colors.blue,
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
                                  ),
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
                                    text:'Save',
                                    textColor: Colors.white,
                                    color: Colors.blue,
                                    onPressed: ()async{
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
                              child: OriginalButton(
                                text:'Delete App',
                                textColor: Colors.white,
                                color: Colors.blueGrey,
                                onPressed: ()async{
                                  SharedPreferences prefs = await SharedPreferences.getInstance();
                                  prefs.setInt('delete_app', counter);

                                  //edit data in firebase
                                  //change flag
                                },
                              ),
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
                                  color: Colors.blueGrey,
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
    );
  }
}
