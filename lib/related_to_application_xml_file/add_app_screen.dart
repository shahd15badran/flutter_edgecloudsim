
import 'dart:async';

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

class _AddAppScreenState extends State<AddAppScreen>with TickerProviderStateMixin {
  int _state = 0;
  void initState (){
    getData();
    super.initState();
  }
  getData() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    setState((){
      counter= prefs.getInt('counter');});
  }

  AuthBase authBase = AuthBase();
  int counter=1;
  List <String> application_name=['AUGMENTED','HEALTH','HEAVY_COMP','INFOTAINMENT'];
  List <String> usage_percentage=['30','20','20','30'];
  List <String> prob_cloud_selection=['20','20','40','15'];
  List <String> poisson_interarrival=['5','30','60','7'];
  List <String> delay_sensitivity =['0','0','0','0'];
  List <String> active_period =['45','10','60','15'];
  List <String> idle_period=['15','20','60','45'];
  var application_name_controller;
  var usage_percentage_controller;
  var prob_cloud_selection_controller;
  var poisson_interarrival_controller;
  var delay_sensitivity_controller;
  var active_period_controller;
  var idle_period_controller;
_AddAppScreenState(){
  getData() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    setState(() {
      counter = prefs.getInt('counter');
    });

    application_name_controller = TextEditingController(text:application_name[counter-1]);
    usage_percentage_controller = TextEditingController(text: usage_percentage[counter-1]);
    prob_cloud_selection_controller = TextEditingController(text: prob_cloud_selection[counter-1]);
    poisson_interarrival_controller = TextEditingController(text: poisson_interarrival[counter-1]);
    delay_sensitivity_controller = TextEditingController(text: delay_sensitivity[counter-1]);
    active_period_controller = TextEditingController(text: active_period[counter-1]);
    idle_period_controller=TextEditingController(text: idle_period[counter-1]);
  }
  getData();
}


  @override

  Widget build(BuildContext context) {
    //final rcvdData = ModalRoute.withName('cont add application').toString();
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
            right: 10.0,
            top: 80.0,
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
                          bottom: 2
                      ),
                      child: Row(
                        children: [
                          Padding(
                            padding: const EdgeInsets.only(
                              top: 10,
                              left: 210,
                            ),
                            child: SizedBox(
                              height: 30,
                              width: 90,
                              child: new MaterialButton(
                                color: Colors.blue,
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
                         top: 30
                       ),
                       child: SizedBox(
                                width: 160,
                                height: 50,
                                  child: OriginalButton(
                                    text:'Continue Editing',
                                    textColor: Colors.white,
                                    color: Colors.blueGrey,
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

