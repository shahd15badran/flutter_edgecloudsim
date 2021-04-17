
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_edgecloudsim/services/auth.dart';
import 'package:flutter_edgecloudsim/widgets/constants.dart';
import 'package:flutter_edgecloudsim/widgets/original_button.dart';
import 'package:shared_preferences/shared_preferences.dart';
class AddAppScreen extends StatefulWidget {
  @override
  _AddAppScreenState createState() => _AddAppScreenState();
}

class _AddAppScreenState extends State<AddAppScreen> {
  AuthBase authBase = AuthBase();

  final application_name_controller=TextEditingController(text:"AUGMENTED");
  final usage_percentage_controller=TextEditingController(text: "30");
  final prob_cloud_selection_controller=TextEditingController(text: "20");
  final poisson_interarrival_controller=TextEditingController(text: "5");
  final delay_sensitivity_controller=TextEditingController(text: "0");
  final active_period_controller=TextEditingController(text: "45");

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
                            width: 160,
                            child: Text('application name :',style: TextStyle(
                              fontSize: 16,
                              color: Colors.blue,
                              fontWeight: FontWeight.w800,
                            ),
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.only(
                              left: 2,
                            ),
                            child: SizedBox(
                              width: 190,
                              height: 40,
                              child: TextFormField  (
                                  controller: application_name_controller,
                                  decoration: textInputDecoration,
                                 onChanged: (text)async{
                                  SharedPreferences prefs = await SharedPreferences.getInstance();
                                  prefs.setString('application_name', application_name_controller.text);
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
                            width: 160,
                            child: Text('usage_percentage :',style: TextStyle(
                              fontSize: 16,
                              color: Colors.blue,
                              fontWeight: FontWeight.w800,
                            ),
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.only(
                              left: 2,
                            ),
                            child: SizedBox(
                              width: 190,
                              height: 40,
                              child: TextFormField(
                                controller: usage_percentage_controller,
                                decoration: textInputDecoration,
                                  onChanged: (text)async{
                                    SharedPreferences prefs = await SharedPreferences.getInstance();
                                    prefs.setString('usage_percentage', usage_percentage_controller.text);
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
                            width: 160,
                            child: Text('prob_cloud_selection:',style: TextStyle(
                              fontSize: 16,
                              color: Colors.blue,
                              fontWeight: FontWeight.w800,
                            ),
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.only(
                              left: 2,
                            ),
                            child: SizedBox(
                              width: 190,
                              height: 40,
                              child: TextFormField(
                                controller: prob_cloud_selection_controller,
                                decoration: textInputDecoration,
                                  onChanged: (text)async{
                                    SharedPreferences prefs = await SharedPreferences.getInstance();
                                    prefs.setString('prob_cloud_selection', prob_cloud_selection_controller.text);
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
                            width: 160,
                            child: Text('poisson_interarrival :',style: TextStyle(
                              fontSize: 16,
                              color: Colors.blue,
                              fontWeight: FontWeight.w800,
                            ),
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.only(
                              left: 2,
                            ),
                            child: SizedBox(
                              width: 190,
                              height: 40,
                              child: TextFormField(
                                controller: poisson_interarrival_controller,
                                decoration: textInputDecoration,
                                  onChanged: (text)async{
                                    SharedPreferences prefs = await SharedPreferences.getInstance();
                                    prefs.setString('poisson_interarrival', poisson_interarrival_controller.text);
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
                            width: 160,
                            child: Text('delay_sensitivity :',style: TextStyle(
                              fontSize: 16,
                              color: Colors.blue,
                              fontWeight: FontWeight.w800,
                            ),
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.only(
                              left: 2,
                            ),
                            child: SizedBox(
                              width: 190,
                              height: 40,
                              child: TextFormField(
                                controller: delay_sensitivity_controller,
                                decoration: textInputDecoration,
                                  onChanged: (text)async{
                                    SharedPreferences prefs = await SharedPreferences.getInstance();
                                    prefs.setString('delay_sensitivity', delay_sensitivity_controller.text);
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
                            width: 160,
                            child: Text('active_period :',style: TextStyle(
                              fontSize: 16,
                              color: Colors.blue,
                              fontWeight: FontWeight.w800,
                            ),
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.only(
                              left: 2,
                            ),
                            child: SizedBox(
                              width: 190,
                              height: 40,
                              child: TextFormField(
                               controller: active_period_controller,
                                decoration: textInputDecoration,
                                  onChanged: (text)async{
                                    SharedPreferences prefs = await SharedPreferences.getInstance();
                                    prefs.setString('active_period', active_period_controller.text);
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
                          Padding(
                            padding: const EdgeInsets.only(
                              top: 30,
                              left: 70,
                            ),
                            child: SizedBox(
                              height: 60,
                              width: 200,
                              child: OriginalButton(
                                text:'Continue Editing',
                                textColor: Colors.white,
                                color: Colors.blue,
                                onPressed: (){

                                  //edit data in firebase
                                  Navigator.of(context).pushNamed('cont add application');
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
