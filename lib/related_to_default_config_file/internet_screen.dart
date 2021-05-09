import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_edgecloudsim/services/auth.dart';
import 'package:flutter_edgecloudsim/widgets/NavDrawer.dart';
import 'package:flutter_edgecloudsim/widgets/constants.dart';
import 'package:shared_preferences/shared_preferences.dart';
    class InternetScreen extends StatefulWidget {
  @override
  _InternetScreenState createState() => _InternetScreenState();
}

class _InternetScreenState extends State<InternetScreen> with TickerProviderStateMixin{
  int _state = 0;
bool _hasbeenpressed =false;
  AuthBase authBase = AuthBase();
  var wan_propagation_delay_controller;
  var lan_internal_delay_controller;
  var wlan_bandwidth_controller;
  var wan_bandwidth_controller;
  var gsm_bandwidth_controller;

  void initState (){
    getData();
    super.initState();
  }
  getData() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    setState(() {
      wan_propagation_delay_controller = TextEditingController(text: prefs.getString('wan_propagation_delay'));
      lan_internal_delay_controller = TextEditingController(text: prefs.getString('lan_internal_delay'));
      wlan_bandwidth_controller = TextEditingController(text: prefs.getString('wlan_bandwidth'));
      wan_bandwidth_controller = TextEditingController(text: prefs.getString('wan_bandwidth'));
      gsm_bandwidth_controller = TextEditingController(text: prefs.getString('gsm_bandwidth'));
    });
  }


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
              top: 140.0,
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
                              width: 200,
                              child: Text('wan_propagation_delay :',style: TextStyle(
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
                                  controller: wan_propagation_delay_controller,
                                  decoration: textInputDecoration,
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
                              width: 200,
                              child: Text('lan_internal_delay :',style: TextStyle(
                                fontSize: 18,
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
                                  controller: lan_internal_delay_controller,
                                  decoration: textInputDecoration,
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
                              width: 200,
                              child: Text('wlan_bandwidth :',style: TextStyle(
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
                                  controller: wlan_bandwidth_controller,
                                  decoration: textInputDecoration,
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
                              width: 200,
                              child: Text('wan_bandwidth :',style: TextStyle(
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
                                  controller: wan_bandwidth_controller,
                                  decoration: textInputDecoration,
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
                              width: 200,
                              child: Text('gsm_bandwidth :',style: TextStyle(
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
                                  controller: gsm_bandwidth_controller,
                                  decoration: textInputDecoration,
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
                                left: 235,
                              ),
                              child: SizedBox(
                                height: 30,
                                width: 90,
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
                                    prefs.setString('wan_propagation_delay', wan_propagation_delay_controller.text);
                                    prefs.setString('lan_internal_delay', lan_internal_delay_controller.text);
                                    prefs.setString('wlan_bandwidth', wlan_bandwidth_controller.text);
                                    prefs.setString('wan_bandwidth', wan_bandwidth_controller.text);
                                    prefs.setString('gsm_bandwidth', gsm_bandwidth_controller.text);
                                    //edit data in firebase
                                    //change flag
                                  },
                                  color:_hasbeenpressed?Colors.green: Colors.grey,

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
