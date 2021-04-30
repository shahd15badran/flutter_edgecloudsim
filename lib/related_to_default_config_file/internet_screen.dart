import 'package:flutter/material.dart';
import 'package:flutter_edgecloudsim/services/auth.dart';
import 'package:flutter_edgecloudsim/widgets/constants.dart';
import 'package:flutter_edgecloudsim/widgets/original_button.dart';
import 'package:shared_preferences/shared_preferences.dart';
    class InternetScreen extends StatefulWidget {
  @override
  _InternetScreenState createState() => _InternetScreenState();
}

class _InternetScreenState extends State<InternetScreen> {
      AuthBase authBase = AuthBase();
      final wan_propagation_delay_controller=TextEditingController(text: "0.1");
      final lan_internal_delay_controller=TextEditingController(text: "0.005");
      final wlan_bandwidth_controller=TextEditingController(text: "200");
      final wan_bandwidth_controller=TextEditingController(text: "15");
      final gsm_bandwidth_controller=TextEditingController(text: "0");

      @override
      Widget build(BuildContext context) {
        return Scaffold(
          appBar: AppBar(
            iconTheme: IconThemeData(
              color:Colors.black,
            ),
            backgroundColor: Colors.white,
            title: Row(
              children: [
                Padding(
                  padding: const EdgeInsets.only(
                    left: 230,
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
              top: 140.0,
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
                              width: 200,
                              child: Text('wan_propagation_delay :',style: TextStyle(
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
                          top: 10,
                          left: 195,
                        ),
                        child: SizedBox(
                          height: 40,
                          width: 120,
                          child: OriginalButton(
                            text:'Save',
                            textColor: Colors.white,
                            color: Colors.blue,
                            onPressed: ()async{
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
              ),
            ),
        ),
        );
      }
}
