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
  AuthBase authBase = AuthBase();
  final idle_period_controller=TextEditingController(text:"15");
  final data_upload_controller=TextEditingController(text: '1500');
  final data_download_controller=TextEditingController(text: '25');
  final task_length_controller=TextEditingController(text: '2000');
  final required_core_controller=TextEditingController(text: '1');
  final vm_utilization_on_edge_controller=TextEditingController(text: '20');
  final vm_utilization_on_cloud_controller=TextEditingController(text: '2');
  final vm_utilization_on_mobile_controller=TextEditingController(text: '0');


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        title: Row(
          children: [
            Padding(
              padding: const EdgeInsets.only(
                left: 270,
              ),
                child: FlatButton(
                  height: 20,
                  minWidth: 20,
                  color: Colors.blue,
                  onPressed: () async {
                    await authBase.logout();
                    Navigator.of(context).pushReplacementNamed('login');
                  },
                  child:Row(
                    children:<Widget>[
                      Icon(Icons.logout,color: Colors.white,size: 20),
                    ],
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
            top: 10.0,
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
                          bottom: 10
                      ),
                      child: Row(
                        children: [
                          Padding(
                            padding: const EdgeInsets.only(
                              top: 10,
                              left: 70,
                            ),
                            child: SizedBox(
                              height: 60,
                              width: 200,
                              child: OriginalButton(
                                text:'Submit',
                                textColor: Colors.white,
                                color: Colors.blue,
                                onPressed: (){
                                  Navigator.of(context).pushNamed('app xml');

                                  //edit data in firebase
                                },
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(
                        top: 10,
                        left: 250,
                      ),
                      child: SizedBox(
                        height: 50,
                        width: 100,
                        child: OriginalButton(
                          text:'Back',
                          textColor: Colors.white,
                          color: Colors.blueGrey,
                          onPressed: (){
                            Navigator.of(context).pushNamed('graphical');
                          },
                        ),
                      ),
                    )
                  ],
                ),
              ),
            ),
          )

      ),
    );
  }
}
