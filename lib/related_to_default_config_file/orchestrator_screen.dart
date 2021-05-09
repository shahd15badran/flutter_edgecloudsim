import 'dart:async';
import 'package:flutter/material.dart';
import 'package:flutter_edgecloudsim/services/auth.dart';
import 'package:flutter_edgecloudsim/widgets/NavDrawer.dart';
import 'package:flutter_edgecloudsim/widgets/constants.dart';
import 'package:flutter_edgecloudsim/widgets/original_button.dart';
import 'package:multi_select_flutter/dialog/multi_select_dialog_field.dart';
import 'package:multi_select_flutter/util/multi_select_item.dart';
import 'package:shared_preferences/shared_preferences.dart';
class OrchestratorScreen extends StatefulWidget {
  @override
  _OrchestratorScreenState createState() => _OrchestratorScreenState();
}

class Animal { //
  final int id;
  final String name;

  Animal({
    this.id,
    this.name,
  });
}

class Policy {
  final int id;
  final String name;

  Policy({
    this.id,
    this.name,
  });
}

class _OrchestratorScreenState extends State<OrchestratorScreen>with TickerProviderStateMixin {
  int _state = 0;
  bool _hasbeenpressed =false;
  AuthBase authBase = AuthBase();

  var orchestrator_policies_controller;
  var simulation_scenarios1_controller;
  var simulation_scenarios2_controller;
  var simulation_scenarios3_controller;
  var attractiveness_L1_mean_waiting_time_controller;
  var attractiveness_L2_mean_waiting_time_controller;
  var attractiveness_L3_mean_waiting_time_controller;

  void initState (){
    getData();
    _selectedPolicies = _policies;
    super.initState();
  }
  getData() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    setState(() {
      orchestrator_policies_controller=TextEditingController(text: prefs.getString('orchestrator_policies'));
      simulation_scenarios1_controller=TextEditingController(text: prefs.getString('simulation_scenarios1'));
      simulation_scenarios2_controller=TextEditingController(text: prefs.getString('simulation_scenarios2'));
      simulation_scenarios3_controller=TextEditingController(text: prefs.getString('simulation_scenarios3'));
      attractiveness_L1_mean_waiting_time_controller=TextEditingController(text: prefs.getString('attractiveness_L1_mean_waiting_time'));
      attractiveness_L2_mean_waiting_time_controller=TextEditingController(text: prefs.getString('attractiveness_L2_mean_waiting_time'));
      attractiveness_L3_mean_waiting_time_controller=TextEditingController(text: prefs.getString('attractiveness_L3_mean_waiting_time'));
    });
  }

  static List<Policy> _policies = [ //
    Policy(id: 1, name: 'NEXT_FIT'),
    Policy(id: 2, name: 'ONLY_EDGE'),
    Policy(id: 3, name: 'ONLY_MOBILE'),
    Policy(id: 4, name: 'NETWORK_BASED'),
    Policy(id: 5, name: 'HYBRID'),
    Policy(id: 6, name: 'UTILIZATION_BASED'), //FUZZY_BASED,FUZZY_COMPETITOR
    Policy(id: 7, name: 'FUZZY_BASED'),
    Policy(id: 8, name: 'FUZZY_COMPETITOR'),
  ];

  final _items = _policies.map((p) => MultiSelectItem(p, p.name)).toList();
  List<Policy> _selectedPolicies = [];
  final _multiSelectKey = GlobalKey<FormFieldState>();

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
           // top: 20.0,
          ),
          child: SingleChildScrollView(
            child: Container(
              color: Colors.white70,
              child: Padding(
                padding: const EdgeInsets.only(
                    //top: 60,
                    right: 16,
                    left: 16
                ),
                child: Column(
                  children:<Widget> [
                    SizedBox(height: 40),
                    MultiSelectDialogField(
                      items: _items,
                      title: Text("Choose policies"),
                      selectedColor: Colors.blue,
                      decoration: BoxDecoration(
                        color: Colors.blue.withOpacity(0.1),
                        borderRadius: BorderRadius.all(Radius.circular(40)),
                        border: Border.all(
                          color: Colors.blue,
                          width: 2,
                        ),
                      ),
                      buttonIcon: Icon(
                        Icons.keyboard_arrow_down_sharp,
                        color: Colors.blue,
                      ),
                      buttonText: Text(
                        "  orchestrator_policies",
                        style: TextStyle(
                          color: Colors.blue[800],
                          fontSize: 16,
                        ),
                      ),
                      onConfirm: (results) {
                        _selectedPolicies = results;
                      },
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
                              left: 70,
                            ),
                            child: SizedBox(
                              width: 180,
                              height: 40,
                              child: TextFormField(
                                controller: simulation_scenarios1_controller,
                                decoration: textInputDecoration,
                                  onChanged: (text)async{
                                    SharedPreferences prefs = await SharedPreferences.getInstance();
                                    //prefs.setString('simulation_scenarios1', simulation_scenarios1_controller.text);
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
                              left: 70,
                            ),
                            child: SizedBox(
                              width: 180,
                              height: 40,
                              child: TextFormField(
                                controller: simulation_scenarios2_controller,
                                decoration: textInputDecoration,
                                  onChanged: (text)async{
                                    SharedPreferences prefs = await SharedPreferences.getInstance();
                                   // prefs.setString('simulation_scenarios2', simulation_scenarios2_controller.text);
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
                              left: 70,
                            ),
                            child: SizedBox(
                              width: 180,
                              height: 40,
                              child: TextFormField(
                                  controller: simulation_scenarios3_controller,
                                  decoration: textInputDecoration,
                                  onChanged: (text)async{
                                    SharedPreferences prefs = await SharedPreferences.getInstance();
                                    //prefs.setString('simulation_scenarios3', simulation_scenarios3_controller.text);
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
                                    //prefs.setString('attractiveness_L1_mean_waiting_time', attractiveness_L1_mean_waiting_time_controller.text);
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
                                  controller: attractiveness_L2_mean_waiting_time_controller,
                                  decoration: textInputDecoration,
                                  onChanged: (text)async{
                                    SharedPreferences prefs = await SharedPreferences.getInstance();
                                    //prefs.setString('attractiveness_L2_mean_waiting_time', attractiveness_L2_mean_waiting_time_controller.text);
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
                                  controller: attractiveness_L3_mean_waiting_time_controller,
                                  decoration: textInputDecoration,
                                  onChanged: (text)async{
                                    SharedPreferences prefs = await SharedPreferences.getInstance();
                                    //prefs.setString('attractiveness_L3_mean_waiting_time', attractiveness_L3_mean_waiting_time_controller.text);
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
                              left: 250,
                            ),
                            child: SizedBox(
                              height: 30,
                              width: 80,
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
                                  String policies = _selectedPolicies[0].name;
                                  _selectedPolicies.forEach((element) {
                                    policies += "," + element.name ;
                                  });
                                  prefs.setString('orchestrator_policies', policies);
                                  prefs.setString('simulation_scenarios1', simulation_scenarios1_controller.text);
                                  prefs.setString('simulation_scenarios2', simulation_scenarios2_controller.text);
                                  prefs.setString('simulation_scenarios3', simulation_scenarios3_controller.text);
                                  prefs.setString('attractiveness_L1_mean_waiting_time', attractiveness_L1_mean_waiting_time_controller.text);
                                  prefs.setString('attractiveness_L2_mean_waiting_time', attractiveness_L2_mean_waiting_time_controller.text);
                                  prefs.setString('attractiveness_L3_mean_waiting_time', attractiveness_L3_mean_waiting_time_controller.text);

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
                        top: 10,
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
                  ],
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
