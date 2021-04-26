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

  void initState (){
    getData();
  }
  getData() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    setState((){
      counter= prefs.getInt('counter');});
  }

  AuthBase authBase = AuthBase();
  int counter=1;
  List<String>costPerBw=['0.1','0.1','0.1','0.1','0.1','0.1','0.1','0.1','0.1','0.1','0.1','0.1','0.1','0.1'];
  List<String>costPerSec=['3.0','3.0','3.0','3.0','3.0','3.0','3.0','3.0','3.0','3.0','3.0','3.0','3.0','3.0'];
  List<String>costPerMem=['0.05','0.05','0.05','0.05''0.05','0.05''0.05','0.05''0.05','0.05''0.05','0.05''0.05','0.05'];
  List<String>costPerStorage=['0.1','0.1','0.1','0.1''0.1','0.1''0.1','0.1''0.1','0.1''0.1','0.1''0.1','0.1'];
  List<String>x_pos=['1','2','3','4','5','6','7','8','9','10','11','12','13','14'];
  List<String>y_pos=['1','2','3','4','5','6','7','8','9','10','11','12','13','14'];
  List<String>wlan_id=['0','1','2','3','4','5','6','7','8','9','10','11','12','13'];
  List<String>attractiveness=['0','0','1','1','1','1','2','2','2','2','2','2','2','2'];

  var costPerBw_controller;
  var costPerSec_controller;
  var costPerMem_controller;
  var costPerStorage_controller;

  var x_pos_controller;
  var y_pos_controller;
  var wlan_id_controller;
  var attractiveness_controller;

  _DataCenterScreenState(){

  getData() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    setState((){
      counter= prefs.getInt('counter');
    });
  costPerBw_controller=TextEditingController(text:costPerBw[counter-1]);
  costPerSec_controller=TextEditingController(text: costPerSec[counter-1]);
  costPerMem_controller=TextEditingController(text:costPerMem[counter-1]);
  costPerStorage_controller=TextEditingController(text:costPerStorage [counter-1]);

  x_pos_controller=TextEditingController(text:x_pos[counter-1]);
  y_pos_controller=TextEditingController(text:y_pos[counter-1]);
  wlan_id_controller=TextEditingController(text:wlan_id [counter-1]);
  attractiveness_controller=TextEditingController(text:attractiveness[counter-1]);
  }
  getData();
}

@override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.black12,
        title: Row(
          children: [
            Padding(padding: const EdgeInsets.only(
              left: 30,
            ),
              child: Text('Data Center'+counter.toString()),
            ),
            Padding(
              padding: const EdgeInsets.only(
                left: 100,
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
            left: 25.0,
            right: 16.0,
            top: 60.0,
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
                          bottom: 20
                      ),
                      child: Row(
                        children: [
                          Padding(
                            padding: const EdgeInsets.only(
                              top: 10,
                              left: 170,
                            ),
                            child: SizedBox(
                              height: 40,
                              width: 100,
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
                    Padding(
                      padding: const EdgeInsets.only(
                        top: 30,
                      ),
                      child: Row(
                        children: [
                          SizedBox(
                            width: 160,
                            height: 60,
                            child: Padding(
                              padding: const EdgeInsets.only(
                                  right: 40
                              ),
                              child: OriginalButton(
                                text:'try',
                                textColor: Colors.white,
                                color: Colors.blueGrey,
                                onPressed: (){
                                  Navigator.of(context).pushNamed('edge xml');
                                },
                              ),
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.only(
                              left: 2,
                            ),
                            child: SizedBox(
                              width: 160,
                              height: 60,
                              child: Padding(
                                padding: const EdgeInsets.only(
                                    left: 10
                                ),
                                child: OriginalButton(
                                  text:'Continue Editing',
                                  textColor: Colors.white,
                                  color: Colors.blueGrey,
                                  onPressed: (){
                                    Navigator.of(context).pushNamed('cont data center');
                                  },
                                ),
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
