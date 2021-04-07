import 'package:flutter/material.dart';
import 'package:flutter_edgecloudsim/services/auth.dart';
import 'package:flutter_edgecloudsim/widgets/constants.dart';
import 'package:flutter_edgecloudsim/widgets/original_button.dart';
class EdgeUserScreen extends StatelessWidget {
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
              child: SizedBox(
                height: 20,
                width: 20,
                child: RaisedButton(
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
                    top: 30,
                    right: 16,
                    left: 16
                ),
                child: Column(
                  children:<Widget> [
                    Padding(
                      padding: const EdgeInsets.only(
                          bottom: 10
                      ),
                      child: Row(
                        children: [
                          SizedBox(
                            width: 240,
                            child: Text('min_number_of_mobile_devices :',style: TextStyle(
                              fontSize: 16,
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
                              width: 80,
                              height: 40,
                              child: TextFormField(
                                decoration: textInputDecoration,
                                initialValue: "100",
                              ),
                            ),
                          )
                        ],
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(
                          bottom: 10
                      ),
                      child: Row(
                        children: [
                          SizedBox(
                            width: 240,
                            child: Text('max_number_of_mobile_devices:',style: TextStyle(
                              fontSize: 16,
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
                              width: 80,
                              height: 40,
                              child: TextFormField(
                                decoration: textInputDecoration,
                                initialValue: "1000",
                              ),
                            ),
                          )
                        ],
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(
                          bottom: 10
                      ),
                      child: Row(
                        children: [
                          SizedBox(
                            width: 240,
                            child: Text('mobile_device_counter_size:',style: TextStyle(
                              fontSize: 16,
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
                              width: 80,
                              height: 40,
                              child: TextFormField(
                                decoration: textInputDecoration,
                                initialValue: "100",
                              ),
                            ),
                          )
                        ],
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(
                          bottom: 10,
                        left: 20
                      ),
                      child: Row(
                        children: [
                          SizedBox(
                            width: 300,
                            child: Text('______________________________________',style: TextStyle(
                              fontSize: 16,
                              color: Colors.black,
                              fontWeight: FontWeight.w800,
                            ),
                            ),
                          ),
                        ],
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(
                          top: 20,
                         bottom: 10,
                        left: 50
                      ),
                      child: Row(
                        children: [
                          SizedBox(
                            width: 200,
                            child: Text('core_for_mobile_vm :',style: TextStyle(
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
                          top: 2,
                          bottom: 10,
                          left: 50
                      ),
                      child: Row(
                        children: [
                          SizedBox(
                            width: 200,
                            child: Text('mips_for_mobile_vm :',style: TextStyle(
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
                          top: 2,
                          bottom: 10,
                          left: 50
                      ),
                      child: Row(
                        children: [
                          SizedBox(
                            width: 200,
                            child: Text('ram_for_mobile_vm :',style: TextStyle(
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
                          top: 2,
                          bottom: 10,
                          left: 50
                      ),
                      child: Row(
                        children: [
                          SizedBox(
                            width: 200,
                            child: Text('storage_for_mobile_vm :',style: TextStyle(
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
                          bottom: 10
                      ),
                      child: Row(
                        children: [
                          Padding(
                            padding: const EdgeInsets.only(
                              top: 10,
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
                          bottom: 2
                      ),
                      child: Row(
                        children: [
                          Padding(
                            padding: const EdgeInsets.only(
                              top: 10,
                              left: 5,
                            ),
                            child: SizedBox(
                              height: 50,
                              width: 200,
                              child: OriginalButton(
                                text:'Edit Data Centers',
                                textColor: Colors.white,
                                color: Colors.blueGrey,
                                onPressed: (){
                                  Navigator.of(context).pushNamed('data center');
                                },
                              ),
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.only(
                              top: 10,
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
          )

      ),
    );
  }
}
