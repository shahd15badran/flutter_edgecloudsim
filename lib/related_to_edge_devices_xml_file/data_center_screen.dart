import 'package:flutter/material.dart';
import 'package:flutter_edgecloudsim/services/auth.dart';
import 'package:flutter_edgecloudsim/widgets/constants.dart';
import 'package:flutter_edgecloudsim/widgets/original_button.dart';
import 'package:shared_preferences/shared_preferences.dart';
class DataCenterScreen extends StatefulWidget {
  @override
  _DataCenterScreenState createState() => _DataCenterScreenState();
}

class _DataCenterScreenState extends State<DataCenterScreen> {
  AuthBase authBase = AuthBase();
  final costPerBw_controller=TextEditingController(text:"0.1");
  final costPerSec_controller=TextEditingController(text: "3.0");
  final costPerMem_controller=TextEditingController(text: "0.05");
  final costPerStorage_controller=TextEditingController(text: "0.1");

  final x_pos_controller=TextEditingController(text: "1");
  final y_pos_controller=TextEditingController(text: "1");
  final wlan_id_controller=TextEditingController(text: "0");
  final attractiveness_controller=TextEditingController(text: "0");

  final core_controller=TextEditingController(text: "8");
  final mips_controller=TextEditingController(text: "4000");
  final ram_controller=TextEditingController(text: "8000");
  final storage_controller=TextEditingController(text: "200000");

  final core_vm1_controller=TextEditingController(text: "2");
  final mips_vm1_controller=TextEditingController(text: "1000");
  final ram_vm1_controller=TextEditingController(text: "2000");
  final storage_vm1_controller=TextEditingController(text: "50000");

  final core_vm2_controller=TextEditingController(text: "2");
  final mips_vm2_controller=TextEditingController(text: "1000");
  final ram_vm2_controller=TextEditingController(text: "2000");
  final storage_vm2_controller=TextEditingController(text: "50000");

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
            right: 16.0,
            top: 20.0,
          ),
          child: SingleChildScrollView(
            child: Container(
              color: Colors.white70,
              child: Padding(
                padding: const EdgeInsets.only(
                    right: 10,
                    left: 10
                ),
                child: Column(
                  children:<Widget> [
                    Padding(
                      padding: const EdgeInsets.only(
                          bottom: 15
                      ),
                      child: Row(
                        children: [
                          SizedBox(
                            width: 300,
                            child: Text('Data Center Characteristic',style: TextStyle(
                              fontSize: 20,
                              color: Colors.black45,
                              fontWeight: FontWeight.w800,
                            ),
                            ),
                          ),
                        ],
                      ),
                    ),
                    /////////////////////////////////////////////////////
                    Padding(
                      padding: const EdgeInsets.only(
                          bottom: 1,
                        left: 50
                      ),
                      child: Row(
                        children: [
                          SizedBox(
                            width: 120,
                            child: Text('costPerBw :',style: TextStyle(
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
                              width: 100,
                              height: 30,
                              child: TextFormField(
                                controller: costPerBw_controller,
                                decoration: textInputDecoration,
                                  onChanged: (text)async{
                                    SharedPreferences prefs = await SharedPreferences.getInstance();
                                    prefs.setString('costPerBw', costPerBw_controller.text);
                                  }
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(
                          bottom: 1,
                          left: 50
                      ),
                      child: Row(
                        children: [
                          SizedBox(
                            width: 120,
                            child: Text('costPerSec:',style: TextStyle(
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
                              width: 100,
                              height: 30,
                              child: TextFormField(
                                controller:costPerSec_controller ,
                                decoration: textInputDecoration,
                                  onChanged: (text)async{
                                    SharedPreferences prefs = await SharedPreferences.getInstance();
                                    prefs.setString('costPerSec', costPerSec_controller.text);
                                  }
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(
                          bottom: 1,
                          left: 50
                      ),
                      child: Row(
                        children: [
                          SizedBox(
                            width: 120,
                            child: Text('costPerMem :',style: TextStyle(
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
                              width: 100,
                              height: 30,
                              child: TextFormField(
                                controller:costPerMem_controller ,
                                decoration: textInputDecoration,
                                  onChanged: (text)async{
                                    SharedPreferences prefs = await SharedPreferences.getInstance();
                                    prefs.setString('costPerMem', costPerMem_controller.text);
                                  }
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(
                          bottom: 1,
                          left: 50
                      ),
                      child: Row(
                        children: [
                          SizedBox(
                            width: 120,
                            child: Text('costPerStorage:',style: TextStyle(
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
                              width: 100,
                              height: 30,
                              child: TextFormField(
                                controller:costPerStorage_controller ,
                                decoration: textInputDecoration,
                                  onChanged: (text)async{
                                    SharedPreferences prefs = await SharedPreferences.getInstance();
                                    prefs.setString('costPerStorage', costPerStorage_controller.text);
                                  }
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                    ////////////////////////////////////////////
                    Padding(
                      padding: const EdgeInsets.only(
                          top: 10,
                          bottom: 1
                      ),
                      child: Row(
                        children: [
                          SizedBox(
                            width: 300,
                            child: Text('Location',style: TextStyle(
                              fontSize: 20,
                              color: Colors.black45,
                              fontWeight: FontWeight.w800,
                            ),
                            ),
                          ),
                        ],
                      ),
                    ),
                    /////////////////////////////////////////////////////
                    Padding(
                      padding: const EdgeInsets.only(
                        top: 5,
                          bottom: 1,
                          left: 50
                      ),
                      child: Row(
                        children: [
                          SizedBox(
                            width: 120,
                            child: Text('   x_pos :',style: TextStyle(
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
                              width: 100,
                              height: 30,
                              child: TextFormField(
                                controller:x_pos_controller ,
                                decoration: textInputDecoration,
                                  onChanged: (text)async{
                                    SharedPreferences prefs = await SharedPreferences.getInstance();
                                    prefs.setString('x_pos', x_pos_controller.text);
                                  }
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(
                          bottom: 1,
                          left: 50
                      ),
                      child: Row(
                        children: [
                          SizedBox(
                            width: 120,
                            child: Text('   y_pos:',style: TextStyle(
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
                              width: 100,
                              height: 30,
                              child: TextFormField(
                                controller:y_pos_controller ,
                                decoration: textInputDecoration,
                                  onChanged: (text)async{
                                    SharedPreferences prefs = await SharedPreferences.getInstance();
                                    prefs.setString('y_pos', y_pos_controller.text);
                                  }
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(
                          bottom: 1,
                          left: 50
                      ),
                      child: Row(
                        children: [
                          SizedBox(
                            width: 120,
                            child: Text('  wlan_id :',style: TextStyle(
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
                              width: 100,
                              height: 30,
                              child: TextFormField(
                                controller:wlan_id_controller ,
                                decoration: textInputDecoration,
                                  onChanged: (text)async{
                                    SharedPreferences prefs = await SharedPreferences.getInstance();
                                    prefs.setString('wlan_id', wlan_id_controller.text);
                                  }
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(
                          bottom: 1,
                          left: 50
                      ),
                      child: Row(
                        children: [
                          SizedBox(
                            width: 120,
                            child: Text('attractiveness:',style: TextStyle(
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
                              width: 100,
                              height: 30,
                              child: TextFormField(
                                controller: attractiveness_controller,
                                decoration: textInputDecoration,
                                  onChanged: (text)async{
                                    SharedPreferences prefs = await SharedPreferences.getInstance();
                                    prefs.setString('attractiveness', attractiveness_controller.text);
                                  }
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                    ////////////////////////////////////////////
                    Padding(
                      padding: const EdgeInsets.only(
                          bottom: 1,
                          top: 10
                      ),
                      child: Row(
                        children: [
                          SizedBox(
                            width: 300,
                            child: Text('Host',style: TextStyle(
                              fontSize: 20,
                              color: Colors.black45,
                              fontWeight: FontWeight.w800,
                            ),
                            ),
                          ),
                        ],
                      ),
                    ),
                    /////////////////////////////////////////////////////
                    Padding(
                      padding: const EdgeInsets.only(
                          top: 5,
                          bottom: 1,
                          left: 200
                      ),
                      child: Row(
                        children: [
                          SizedBox(
                            width: 50,
                            child: Text('VM',style: TextStyle(
                              fontSize: 16,
                              color: Colors.black45,
                              fontWeight: FontWeight.w800,
                            ),
                            ),
                          ),
                          SizedBox(
                            width: 50,
                            child: Text('      VM',style: TextStyle(
                              fontSize: 16,
                              color: Colors.black45,
                              fontWeight: FontWeight.w800,
                            ),
                            ),
                          ),

                        ],
                      ),
                    ),

                    /////////////////////////////////////////////////////

                    Padding(
                      padding: const EdgeInsets.only(
                          top: 5,
                          bottom: 1,
                          left: 10
                      ),
                      child: Row(
                        children: [
                          SizedBox(
                            width: 80,
                            child: Text('core:',style: TextStyle(
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
                              width: 80,
                              height: 30,
                              child: TextFormField(
                                controller: core_controller,
                                decoration: textInputDecoration,
                                  onChanged: (text)async{
                                    SharedPreferences prefs = await SharedPreferences.getInstance();
                                    prefs.setString('core', core_controller.text);
                                  }

                              ),
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.only(
                              left: 6,
                            ),
                            child: SizedBox(
                              width: 80,
                              height: 30,
                              child: TextFormField(
                                controller: core_vm1_controller,
                                decoration: textInputDecoration,
                                  onChanged: (text)async{
                                    SharedPreferences prefs = await SharedPreferences.getInstance();
                                    prefs.setString('core_vm1', core_vm1_controller.text);
                                  }
                              ),
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.only(
                              left: 6,
                            ),
                            child: SizedBox(
                              width: 80,
                              height: 30,
                              child: TextFormField(
                                controller: core_vm2_controller,
                                decoration: textInputDecoration,
                                  onChanged: (text)async{
                                    SharedPreferences prefs = await SharedPreferences.getInstance();
                                    prefs.setString('core_vm2', core_vm2_controller.text);
                                  }
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(
                          top: 5,
                          bottom: 1,
                          left: 10
                      ),
                      child: Row(
                        children: [
                          SizedBox(
                            width: 80,
                            child: Text('mips:',style: TextStyle(
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
                              width: 80,
                              height: 30,
                              child: TextFormField(
                                controller: mips_controller,
                                decoration: textInputDecoration,
                                  onChanged: (text)async{
                                    SharedPreferences prefs = await SharedPreferences.getInstance();
                                    prefs.setString('mips', mips_controller.text);
                                  }
                              ),
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.only(
                              left: 6,
                            ),
                            child: SizedBox(
                              width: 80,
                              height: 30,
                              child: TextFormField(
                                controller: mips_vm1_controller,
                                decoration: textInputDecoration,
                                  onChanged: (text)async{
                                    SharedPreferences prefs = await SharedPreferences.getInstance();
                                    prefs.setString('mips_vm1', mips_vm1_controller.text);
                                  }
                              ),
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.only(
                              left: 6,
                            ),
                            child: SizedBox(
                              width: 80,
                              height: 30,
                              child: TextFormField(
                                controller: mips_vm2_controller,
                                decoration: textInputDecoration,
                                  onChanged: (text)async{
                                    SharedPreferences prefs = await SharedPreferences.getInstance();
                                    prefs.setString('mips_vm2', mips_vm2_controller.text);
                                  }
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(
                          top: 5,
                          bottom: 1,
                          left: 10
                      ),
                      child: Row(
                        children: [
                          SizedBox(
                            width: 80,
                            child: Text('ram:',style: TextStyle(
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
                              width: 80,
                              height: 30,
                              child: TextFormField(
                                controller: ram_controller,
                                decoration: textInputDecoration,
                                  onChanged: (text)async{
                                    SharedPreferences prefs = await SharedPreferences.getInstance();
                                    prefs.setString('ram', ram_controller.text);
                                  }
                              ),
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.only(
                              left: 6,
                            ),
                            child: SizedBox(
                              width: 80,
                              height: 30,
                              child: TextFormField(
                                controller: ram_vm1_controller,
                                decoration: textInputDecoration,
                                  onChanged: (text)async{
                                    SharedPreferences prefs = await SharedPreferences.getInstance();
                                    prefs.setString('ram_vm1', ram_vm1_controller.text);
                                  }
                              ),
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.only(
                              left: 6,
                            ),
                            child: SizedBox(
                              width: 80,
                              height: 30,
                              child: TextFormField(
                                controller: ram_vm2_controller,
                                decoration: textInputDecoration,
                                  onChanged: (text)async{
                                    SharedPreferences prefs = await SharedPreferences.getInstance();
                                    prefs.setString('ram_vm2', ram_vm2_controller.text);
                                  }
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(
                          top: 5,
                          bottom: 1,
                          left: 10
                      ),
                      child: Row(
                        children: [
                          SizedBox(
                            width: 80,
                            child: Text('storage:',style: TextStyle(
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
                              width: 80,
                              height: 30,
                              child: TextFormField(
                                controller: storage_controller,
                                decoration: textInputDecoration,
                                  onChanged: (text)async{
                                    SharedPreferences prefs = await SharedPreferences.getInstance();
                                    prefs.setString('storage', storage_controller.text);
                                  }
                              ),
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.only(
                              left: 6,
                            ),
                            child: SizedBox(
                              width: 80,
                              height: 30,
                              child: TextFormField(
                                controller: storage_vm1_controller,
                                decoration: textInputDecoration,
                                  onChanged: (text)async{
                                    SharedPreferences prefs = await SharedPreferences.getInstance();
                                    prefs.setString('storage_vm1', storage_vm1_controller.text);
                                  }
                              ),
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.only(
                              left: 6,
                            ),
                            child: SizedBox(
                              width: 80,
                              height: 30,
                              child: TextFormField(
                                controller: storage_vm2_controller,
                                decoration: textInputDecoration,
                                  onChanged: (text)async{
                                    SharedPreferences prefs = await SharedPreferences.getInstance();
                                    prefs.setString('storage_vm2', storage_vm2_controller.text);
                                  }
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                    ////////////////////////////////////////////
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
                              height: 40,
                              width: 100,
                              child: OriginalButton(
                                text:'Submit',
                                textColor: Colors.white,
                                color: Colors.blue,
                                onPressed: (){
                                  Navigator.of(context).pushNamed('edge xml');

                                  //edit data in firebase
                                },
                              ),
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.only(
                              top: 10,
                              left: 85,
                            ),
                            child: SizedBox(
                              height: 40,
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

                  ],
                ),
              ),
            ),
          )

      ),
    );
  }
}
