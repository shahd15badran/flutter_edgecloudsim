import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_edgecloudsim/services/auth.dart';
import 'package:flutter_edgecloudsim/widgets/NavDrawer.dart';
import 'package:flutter_edgecloudsim/widgets/constants.dart';
import 'package:flutter_edgecloudsim/widgets/original_button.dart';
import 'package:shared_preferences/shared_preferences.dart';
class OrchestratorScreen extends StatefulWidget {
  @override
  _OrchestratorScreenState createState() => _OrchestratorScreenState();
}

class _OrchestratorScreenState extends State<OrchestratorScreen>with TickerProviderStateMixin {
  int _state = 0;
  AuthBase authBase = AuthBase();

  final orchestrator_policies_controller=TextEditingController(text: "NEXT_FIT");

  final simulation_scenarios1_controller=TextEditingController(text: "SINGLE_TIER");
  final simulation_scenarios2_controller=TextEditingController(text: "TWO_TIER");
  final simulation_scenarios3_controller=TextEditingController(text: "TWO_EO");


  final attractiveness_L1_mean_waiting_time_controller=TextEditingController(text: "500");
  final attractiveness_L2_mean_waiting_time_controller=TextEditingController(text: "300");
  final attractiveness_L3_mean_waiting_time_controller=TextEditingController(text: "120");


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
            top: 20.0,
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
                              color:  Color(0xFF345979),
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
                          bottom: 2
                      ),
                      child: Row(
                        children: [
                          Padding(
                            padding: const EdgeInsets.only(
                              top: 10,
                              left: 250,
                            ),
                            child: SizedBox(
                              height: 30,
                              width: 80,
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
                        ],//////////////////////////////////////
                ),
              ),
            ),
          ),
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
