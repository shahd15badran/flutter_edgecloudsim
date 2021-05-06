import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_edgecloudsim/services/auth.dart';
import 'package:flutter_edgecloudsim/widgets/NavDrawer.dart';
import 'package:flutter_edgecloudsim/widgets/constants.dart';
import 'package:flutter_edgecloudsim/widgets/original_button.dart';
import 'package:shared_preferences/shared_preferences.dart';
class DataCenterScreen extends StatefulWidget {
  @override
  _DataCenterScreenState createState() => _DataCenterScreenState();
}

class _DataCenterScreenState extends State<DataCenterScreen> with TickerProviderStateMixin{
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
  List<String>costPerBw=['0.1','0.1','0.1','0.1','0.1','0.1','0.1','0.1','0.1','0.1','0.1','0.1','0.1','0.1'];
  List<String>costPerSec=['3.0','3.0','3.0','3.0','3.0','3.0','3.0','3.0','3.0','3.0','3.0','3.0','3.0','3.0'];
  List<String>costPerMem=['0.05','0.05','0.05','0.05','0.05','0.05','0.05','0.05','0.05','0.05','0.05','0.05','0.05','0.05'];
  List<String>costPerStorage=['0.1','0.1','0.1','0.1','0.1','0.1','0.1','0.1','0.1','0.1','0.1','0.1','0.1','0.1'];
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
      drawer: NavDrawer(),
      appBar: AppBar(
        iconTheme: IconThemeData(
          color:Colors.white,
        ),
        backgroundColor: Color(0xFF77A5CD),
        title: Row(
          children: [
            Padding(padding: const EdgeInsets.only(
              // left: 30,
            ),
              child: Text('Data Center'+counter.toString(),style: TextStyle(
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
            left: 25.0,
            right: 16.0,
            top: 90.0,
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
                          bottom: 30
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
                          bottom: 30,
                          left: 50
                      ),
                      child: Row(
                        children: [
                          SizedBox(
                            width: 120,
                            child: Text('costPerStorage:',style: TextStyle(
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
                          bottom: 30
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
                          bottom: 2
                      ),
                      child: Row(
                        children: [
                          Padding(
                            padding: const EdgeInsets.only(
                              top: 10,
                              left: 175,
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
                    Padding(
                      padding: const EdgeInsets.only(
                          top: 30,
                        right: 10
                      ),
                      child: SizedBox(
                        width: 160,
                        height: 50,
                        child: OriginalButton(
                          text:'Continue Editing',
                          textColor: Colors.white,
                          color: Color(0xFF345979),
                          onPressed: (){
                            Navigator.of(context).pushNamed('cont data center');
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
