
import 'dart:async';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_edgecloudsim/services/auth.dart';
import 'package:flutter_edgecloudsim/widgets/NavDrawer.dart';
import 'package:flutter_edgecloudsim/widgets/constants.dart';
import 'package:flutter_edgecloudsim/widgets/original_button.dart';
import 'package:shared_preferences/shared_preferences.dart';


class AddAppScreen extends StatefulWidget {
  @override
  _AddAppScreenState createState() => _AddAppScreenState();
}

class _AddAppScreenState extends State<AddAppScreen>with TickerProviderStateMixin {
  int _state = 0;
  bool  _hasbeenpressed=false;

  void initState (){
    getData();
    super.initState();
  }
  getData() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    setState(() {
      counter = prefs.getInt('counter');
    });

    application_name_controller = TextEditingController(text: prefs.getStringList('application_name')[counter - 1]);
    usage_percentage_controller = TextEditingController(text:prefs.getStringList('usage_percentage')[counter - 1]);
    prob_cloud_selection_controller = TextEditingController(text:  prefs.getStringList('prob_cloud_selection')[counter - 1]);
    poisson_interarrival_controller = TextEditingController(text:prefs.getStringList('poisson_interarrival')[counter - 1]);
    delay_sensitivity_controller = TextEditingController(text: prefs.getStringList('delay_sensitivity')[counter - 1]);
    active_period_controller = TextEditingController(text: prefs.getStringList('active_period')[counter - 1]);


    application_name= prefs.getStringList('application_name');
    usage_percentage=prefs.getStringList('usage_percentage');
    prob_cloud_selection=prefs.getStringList('prob_cloud_selection');
    poisson_interarrival=prefs.getStringList('poisson_interarrival');
    delay_sensitivity =prefs.getStringList('delay_sensitivity');
    active_period =prefs.getStringList('active_period');

  }
  AuthBase authBase = AuthBase();
  int counter=1;
  List <String> application_name;
  List <String> usage_percentage;
  List <String> prob_cloud_selection;
  List <String> poisson_interarrival;
  List <String> delay_sensitivity;
  List <String> active_period;

  var application_name_controller;
  var usage_percentage_controller;
  var prob_cloud_selection_controller;
  var poisson_interarrival_controller;
  var delay_sensitivity_controller;
  var active_period_controller;
  var idle_period_controller;



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
             //left: 10,
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
                  left: 120,
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
            top: 80.0,
          ),
          child: SingleChildScrollView(
            child: Container(
              //color: Colors.white70,
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
                              width: 190,
                              height: 40,
                              child: TextFormField  (
                                  controller: application_name_controller,
                                  decoration: textInputDecoration,
                                  onChanged: (text)async{
                                    application_name[counter-1] = application_name_controller.text;
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
                              width: 190,
                              height: 40,
                              child: TextFormField(
                                  controller: usage_percentage_controller,
                                  decoration: textInputDecoration,
                                  onChanged: (text)async{
                                    usage_percentage[counter-1]= usage_percentage_controller.text;
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
                              width: 190,
                              height: 40,
                              child: TextFormField(
                                  controller: prob_cloud_selection_controller,
                                  decoration: textInputDecoration,
                                  onChanged: (text)async{
                                    prob_cloud_selection[counter-1]=prob_cloud_selection_controller.text;
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
                              width: 190,
                              height: 40,
                              child: TextFormField(
                                  controller: poisson_interarrival_controller,
                                  decoration: textInputDecoration,
                                  onChanged: (text)async{
                                    poisson_interarrival[counter-1]=poisson_interarrival_controller.text;
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
                              width: 190,
                              height: 40,
                              child: TextFormField(
                                  controller: delay_sensitivity_controller,
                                  decoration: textInputDecoration,
                                  onChanged: (text)async{
                                    delay_sensitivity[counter-1]= delay_sensitivity_controller.text;
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
                              width: 190,
                              height: 40,
                              child: TextFormField(
                                  controller: active_period_controller,
                                  decoration: textInputDecoration,
                                  onChanged: (text)async{
                                    active_period[counter-1]=active_period_controller.text;
                                   // SharedPreferences prefs = await SharedPreferences.getInstance();
                                   // prefs.setString('active_period'[counter-1], active_period_controller.text);
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
                              left: 260,
                            ),
                            child: SizedBox(
                              height: 30,
                              width: 90,
                              child: new MaterialButton(
                                child: setUpButtonChild(),
                                onPressed: ()async{
                                  SharedPreferences prefs = await SharedPreferences.getInstance();
                                  prefs.setStringList('application_name', application_name);
                                  prefs.setStringList('usage_percentage', usage_percentage);
                                  prefs.setStringList('prob_cloud_selection', prob_cloud_selection);
                                  prefs.setStringList('poisson_interarrival', poisson_interarrival);
                                  prefs.setStringList('delay_sensitivity', delay_sensitivity);
                                  prefs.setStringList('active_period', active_period);
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
                         top: 30
                       ),
                       child: SizedBox(
                                width: 160,
                                height: 50,
                                  child: OriginalButton(
                                    text:'Continue Editing',
                                    textColor: Colors.white,
                                    color: Color(0xFF345979),
                                    onPressed: (){
                                      Navigator.of(context).pushNamed('cont add application');
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

