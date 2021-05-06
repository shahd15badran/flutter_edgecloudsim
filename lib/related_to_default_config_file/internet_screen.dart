import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_edgecloudsim/services/auth.dart';
import 'package:flutter_edgecloudsim/widgets/NavDrawer.dart';
import 'package:flutter_edgecloudsim/widgets/constants.dart';
import 'package:flutter_edgecloudsim/widgets/original_button.dart';
import 'package:shared_preferences/shared_preferences.dart';
    class InternetScreen extends StatefulWidget {
  @override
  _InternetScreenState createState() => _InternetScreenState();
}

class _InternetScreenState extends State<InternetScreen> with TickerProviderStateMixin{
  int _state = 0;

  AuthBase authBase = AuthBase();
      final wan_propagation_delay_controller=TextEditingController(text: "0.1");
      final lan_internal_delay_controller=TextEditingController(text: "0.005");
      final wlan_bandwidth_controller=TextEditingController(text: "200");
      final wan_bandwidth_controller=TextEditingController(text: "15");
      final gsm_bandwidth_controller=TextEditingController(text: "0");

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
                                  controller: wan_bandwidth_controller,
                                  decoration: textInputDecoration,
                                    onChanged: (text)async{
                                      SharedPreferences prefs = await SharedPreferences.getInstance();
                                      prefs.setString('wan_propagation_delay', wan_bandwidth_controller.text);
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
                                    onChanged: (text)async{
                                      SharedPreferences prefs = await SharedPreferences.getInstance();
                                      prefs.setString('lan_internal_delay', lan_internal_delay_controller.text);
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
                                    onChanged: (text)async{
                                      SharedPreferences prefs = await SharedPreferences.getInstance();
                                      prefs.setString('wlan_bandwidth', wlan_bandwidth_controller.text);
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
                                    onChanged: (text)async{
                                      SharedPreferences prefs = await SharedPreferences.getInstance();
                                      prefs.setString('wan_bandwidth', wan_bandwidth_controller.text);
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
                                    onChanged: (text)async{
                                      SharedPreferences prefs = await SharedPreferences.getInstance();
                                      prefs.setString('gsm_bandwidth', gsm_bandwidth_controller.text);
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
                                left: 235,
                              ),
                              child: SizedBox(
                                height: 30,
                                width: 90,
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
