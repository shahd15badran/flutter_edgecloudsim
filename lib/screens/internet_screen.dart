import 'package:flutter/material.dart';
import 'package:flutter_edgecloudsim/services/auth.dart';
import 'package:flutter_edgecloudsim/widgets/constants.dart';
import 'package:flutter_edgecloudsim/widgets/original_button.dart';
    class InternetScreen extends StatelessWidget {
      AuthBase authBase = AuthBase();
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
                                  decoration: textInputDecoration,
                                  initialValue: "0.1",
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
                                  decoration: textInputDecoration,
                                  initialValue: "0.005",
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
                                  decoration: textInputDecoration,
                                  initialValue: "200",
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
                                  decoration: textInputDecoration,
                                  initialValue: "15",
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
                                  decoration: textInputDecoration,
                                  initialValue: "0",
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
                                top: 50,
                                left: 70,
                              ),
                              child: SizedBox(
                                height: 60,
                                width: 200,
                                child: OriginalButton(
                                  text:'Submit',
                                  textColor: Colors.white,
                                  color: Colors.blue,
                                  onPressed: (){
                                    //edit data in firebase
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
