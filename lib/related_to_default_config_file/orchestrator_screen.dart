import 'dart:async';
import 'package:flutter/material.dart';
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
class Policy {
  final int id;
  final String name;

  Policy({
    this.id,
    this.name,
  });
}
class scenarios {
  final int id;
  final String name;

  scenarios({
    this.id,
    this.name,
  });
}
/////////////
class _OrchestratorScreenState extends State<OrchestratorScreen>with TickerProviderStateMixin {
  int _state = 0;
  bool _hasbeenpressed =false;
  bool _hasbeenpressed2 =false;

  var orchestrator_policies_controller;
  var simulation_scenarios1_controller;
  var simulation_scenarios2_controller;
  var simulation_scenarios3_controller;
  var attractiveness_L1_mean_waiting_time_controller;
  var attractiveness_L2_mean_waiting_time_controller;
  var attractiveness_L3_mean_waiting_time_controller;

  void initState (){
    getData();
    //_selectedPolicies = _policies;//[Policy(id: 1, name: 'NEXT_FIT')];
    _selectedScenarios = _scenarios;
    super.initState();
  }
  getData() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    setState(() {
      orchestrator_policies_controller=TextEditingController(text: prefs.getString('orchestrator_policies'));//
      simulation_scenarios1_controller=TextEditingController(text: prefs.getString('simulation_scenarios1'));//
      simulation_scenarios2_controller=TextEditingController(text: prefs.getString('simulation_scenarios2'));//
      simulation_scenarios3_controller=TextEditingController(text: prefs.getString('simulation_scenarios3'));//
      attractiveness_L1_mean_waiting_time_controller=TextEditingController(text: prefs.getString('attractiveness_L1_mean_waiting_time'));
      attractiveness_L2_mean_waiting_time_controller=TextEditingController(text: prefs.getString('attractiveness_L2_mean_waiting_time'));
      attractiveness_L3_mean_waiting_time_controller=TextEditingController(text: prefs.getString('attractiveness_L3_mean_waiting_time'));
      orchPolicies = prefs.getString('orchestrator_policies');
      simScenarios = prefs.getString('simulation_scenarios');

      _initialPolicies.add(Policy(id: 1, name: orchPolicies));//
      //print(Policy(id: 1, name: orchPolicies).name);//
      _selectedPolicies = _initialPolicies;//

      int Policies = ','.allMatches(orchPolicies).length +1; //TODO
      int Scenarios = ','.allMatches(simScenarios).length +1;

    });
  }

  static List<Policy> _Initpolicies = [
    Policy(id: 1, name: 'NEXT_FIT'),
    Policy(id: 2, name: 'ONLY_EDGE'),
  ];

  static List<Policy> _policies = [
    Policy(id: 1, name: 'NEXT_FIT'),
    Policy(id: 2, name: 'ONLY_EDGE'),
    Policy(id: 3, name: 'ONLY_MOBILE'),
    Policy(id: 4, name: 'NETWORK_BASED'),
    Policy(id: 5, name: 'HYBRID'),
    Policy(id: 6, name: 'UTILIZATION_BASED'),
    Policy(id: 7, name: 'FUZZY_BASED'),
    Policy(id: 8, name: 'FUZZY_COMPETITOR'),
  ];
  static List<scenarios> _scenarios = [
    scenarios(id: 1, name: 'SINGLE_TIER'),
    scenarios(id: 2, name: 'TWO_TIER'),
    scenarios(id: 3, name: 'TWO_TIER_WITH_EO'),
    scenarios(id: 4, name: 'MOBILE_PROCESSING_SCENARIO'),
  ];

  String orchPolicies;
  String simScenarios;
  final _items = _policies.map((p) => MultiSelectItem(p, p.name)).toList();
  List<Policy> _selectedPolicies = [];
  List<Policy> _initialPolicies = [];
  final _multiSelectKey = GlobalKey<FormFieldState>();
  final _items2 = _scenarios.map((s) => MultiSelectItem(s, s.name)).toList();
  List<scenarios> _selectedScenarios = [];
  final _multiSelectKey2 = GlobalKey<FormFieldState>();

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
            top: 70.0,
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
                    Padding(
                      padding: const EdgeInsets.only(
                        right: 100
                      ),
                      child: Row(
                        children: [
                          IconButton(
                            icon: Icon(Icons.announcement_outlined,color:  Colors.black45,size: 25),
                            tooltip:'You can choose more than one' ,
                          ),
                          Text('Edit orchestrator_policies',
                            style: TextStyle(
                              color: Color(0xFF072B4B),
                              fontSize: 18,
                              fontWeight: FontWeight.w600,

                            ),
                          ),
                        ],
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(
                        top: 25,
                        bottom: 25
                      ),
                      child: MultiSelectDialogField(
                        items: _items,
                        title: Text("Choose policies"),
                        selectedColor: Colors.blue,
                        decoration: BoxDecoration(
                          color: Color(0xFF77A5CD).withOpacity(0.7),
                          borderRadius: BorderRadius.all(Radius.circular(40)),
                          border: Border.all(
                            color:Color(0xFF77A5CD),
                            width: 2,
                          ),
                        ),
                        buttonIcon: Icon(
                          Icons.keyboard_arrow_down_sharp,
                          color: Colors.blue,
                        ),
                        buttonText:
                        Text("                orchestrator_policies",
                          style: TextStyle(
                            color: Colors.black87,
                            fontSize: 18,
                          ),
                        ),

                        onConfirm: (results) {
                          _selectedPolicies = results;
                        },
                      ),

                    ),
                    Padding(
                      padding: const EdgeInsets.only(
                          right: 70
                      ),
                      child: Row(
                        children: [
                          IconButton(
                            icon: Icon(Icons.announcement_outlined,color:  Colors.black45,size: 25),
                            tooltip:'You can choose more than one' ,
                          ),
                          Text('Edit simulation_scenarios',
                            style: TextStyle(
                              color: Color(0xFF072B4B),
                              fontSize: 18,
                              fontWeight: FontWeight.w600,

                            ),),
                        ],
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(
                        top: 25,
                        bottom: 50
                      ),
                      child: MultiSelectDialogField(
                        items: _items2,
                        title: Text("Choose sim scenarios"),
                        selectedColor: Colors.blue,
                        decoration: BoxDecoration(
                          color:Color(0xFF77A5CD).withOpacity(0.7),
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
                          "                  simulation_scenarios",
                          style: TextStyle(
                            color: Colors.black87,
                            fontSize: 18,
                          ),
                        ),
                        onConfirm: (results) {
                          _selectedScenarios = results;
                        },
                      ),
                    ),
                    ///////////////////////////////////////////////////
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
                                  String scenarios = _selectedScenarios[0].name;
                                  for(int i=1; i<_selectedPolicies.length; i++){
                                    policies += "," + _selectedPolicies[i].name ;
                                  };
                                  for(int i=1; i<_selectedScenarios.length; i++){
                                    scenarios += "," + _selectedScenarios[i].name ;
                                  };
                                  //orchPolicies = policies;
                                  //simScenarios = scenarios;
                                  prefs.setString('orchestrator_policies', policies);
                                  prefs.setString('simulation_scenarios', scenarios);
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
                        top: 30,
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
