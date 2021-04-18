import 'package:flutter/material.dart';
import 'package:flutter_edgecloudsim/services/auth.dart';
import 'package:flutter_edgecloudsim/widgets/constants.dart';
import 'package:flutter_edgecloudsim/widgets/original_button.dart';
import 'package:shared_preferences/shared_preferences.dart';
class OrchestratorScreen extends StatefulWidget {
  @override
  _OrchestratorScreenState createState() => _OrchestratorScreenState();
}

class _OrchestratorScreenState extends State<OrchestratorScreen> {
  AuthBase authBase = AuthBase();

  final orchestrator_policies_controller=TextEditingController(text: "NEXT_FIT");

  final simulation_scenarios1_controller=TextEditingController(text: "SINGLE_TIER");
  final simulation_scenarios2_controller=TextEditingController(text: "TWO_TIER");
  final simulation_scenarios3_controller=TextEditingController(text: "TWO_TIER_WITH_EO");


  final attractiveness_L1_mean_waiting_time_controller=TextEditingController(text: "500");
  final attractiveness_L2_mean_waiting_time_controller=TextEditingController(text: "300");
  final attractiveness_L3_mean_waiting_time_controller=TextEditingController(text: "120");


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
                    top: 60,
                    right: 16,
                    left: 16
                ),
                child: Column(
                  children:<Widget> [
                    Padding(
                      padding: const EdgeInsets.only(
                          bottom: 60
                      ),
                      child: Row(
                        children: [
                          SizedBox(
                            width: 200,
                            child: Text('orchestrator_policies :',style: TextStyle(
                              fontSize: 18,
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
                                controller: orchestrator_policies_controller,
                                decoration: textInputDecoration,
                                  onChanged: (text)async{
                                    SharedPreferences prefs = await SharedPreferences.getInstance();
                                    prefs.setString('orchestrator_policies', orchestrator_policies_controller.text);
                                  }                              ),
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
                            width: 100,
                            child: Text('simulation_scenarios=>',style: TextStyle(
                              fontSize: 18,
                              color: Colors.blue,
                              fontWeight: FontWeight.w800,
                            ),
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.only(
                              left: 90,
                            ),
                            child: SizedBox(
                              width: 160,
                              height: 40,
                              child: TextFormField(
                                controller: simulation_scenarios1_controller,
                                decoration: textInputDecoration,
                                  onChanged: (text)async{
                                    SharedPreferences prefs = await SharedPreferences.getInstance();
                                    prefs.setString('simulation_scenarios', simulation_scenarios1_controller.text);
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
                            width: 100,
                          ),
                          Padding(
                            padding: const EdgeInsets.only(
                              left: 90,
                            ),
                            child: SizedBox(
                              width: 160,
                              height: 40,
                              child: TextFormField(
                                controller: simulation_scenarios2_controller,
                                decoration: textInputDecoration,
                                  onChanged: (text)async{
                                    SharedPreferences prefs = await SharedPreferences.getInstance();
                                    prefs.setString('simulation_scenarios', simulation_scenarios2_controller.text);
                                  }
                                ),
                              ),
                            ),
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
                            width: 100,
                          ),
                          Padding(
                            padding: const EdgeInsets.only(
                              left: 90,
                            ),
                            child: SizedBox(
                              width: 160,
                              height: 40,
                              child: TextFormField(
                                  controller: simulation_scenarios3_controller,
                                  decoration: textInputDecoration,
                                  onChanged: (text)async{
                                    SharedPreferences prefs = await SharedPreferences.getInstance();
                                    prefs.setString('simulation_scenarios', simulation_scenarios3_controller.text);
                                  }
                              ),
                            ),
                          )
                        ],
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(
                          top: 20,
                          bottom: 1,
                          left: 50
                      ),
                      child: Row(
                        children: [
                          SizedBox(
                            width: 200,
                            child: Text('attractiveness_L1 :',style: TextStyle(
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
                                  controller: attractiveness_L1_mean_waiting_time_controller,
                                  decoration: textInputDecoration,
                                  onChanged: (text)async{
                                    SharedPreferences prefs = await SharedPreferences.getInstance();
                                    prefs.setString('attractiveness_L1_mean_waiting_time', attractiveness_L1_mean_waiting_time_controller.text);
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
                          bottom: 1,
                          left: 50
                      ),
                      child: Row(
                        children: [
                          SizedBox(
                            width: 200,
                            child: Text('attractiveness_L2 :',style: TextStyle(
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
                                  controller: attractiveness_L1_mean_waiting_time_controller,
                                  decoration: textInputDecoration,
                                  onChanged: (text)async{
                                    SharedPreferences prefs = await SharedPreferences.getInstance();
                                    prefs.setString('attractiveness_L2_mean_waiting_time', attractiveness_L2_mean_waiting_time_controller.text);
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
                          bottom: 1,
                          left: 50
                      ),
                      child: Row(
                        children: [
                          SizedBox(
                            width: 200,
                            child: Text('attractiveness_L3 :',style: TextStyle(
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
                                  controller: attractiveness_L1_mean_waiting_time_controller,
                                  decoration: textInputDecoration,
                                  onChanged: (text)async{
                                    SharedPreferences prefs = await SharedPreferences.getInstance();
                                    prefs.setString('attractiveness_L3_mean_waiting_time', attractiveness_L3_mean_waiting_time_controller.text);
                                  }
                              ),
                            ),
                          )
                        ],
                      ),
                    ),
//////////////////////////////////////////////////////////////////
                    Padding(
                      padding: const EdgeInsets.only(
                          bottom: 20
                      ),
                      child: Row(
                        children: [
                          Padding(
                            padding: const EdgeInsets.only(
                              top: 40,
                              left: 5,
                            ),
                            child: SizedBox(
                              height: 50,
                              width: 200,
                              child: OriginalButton(
                                text:'Edit Basic Sim Setting',
                                textColor: Colors.white,
                                color: Colors.blueGrey,
                                onPressed: (){
                                  Navigator.of(context).pushNamed('basic setting');
                                },
                              ),
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.only(
                              top: 40,
                              left: 30,
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
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
      ),
    );
  }
}
