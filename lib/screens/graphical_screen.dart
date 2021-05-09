import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_edgecloudsim/related_to_application_xml_file/applications_xml.dart';
import 'package:flutter_edgecloudsim/services/auth.dart';
import 'package:flutter_edgecloudsim/widgets/NavDrawer.dart';
import 'package:flutter_edgecloudsim/widgets/original_button.dart';
import 'package:permission_handler/permission_handler.dart';
import 'package:shared_preferences/shared_preferences.dart';
class GraphicalScreen extends StatefulWidget {
  @override
  _GraphicalScreenState createState() => _GraphicalScreenState();
}

class _GraphicalScreenState extends State<GraphicalScreen> {
  AuthBase authBase = AuthBase();

  /*
  */

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      drawer: NavDrawer(),
      appBar: AppBar(
        iconTheme: IconThemeData(
          color:Colors.white,
        ),
        backgroundColor: Color(0xFF77A5CD),
      ),
      body:Padding(
        padding: const EdgeInsets.only(
        ),
        child: Padding(
          padding: const EdgeInsets.only(
              //top: 20,
              bottom: 15
          ),
          child: SingleChildScrollView(
            child: Container(
              // color: Colors.black26,
              child: SafeArea(
                child: Column(
                  children: [
                    Padding(
                      padding: const EdgeInsets.only(
                        right: 380
                      ),
                      child: SizedBox(
                        height: 30,

                        child: Padding(
                          padding: const EdgeInsets.only(

                          ),
                          child: IconButton(

                            icon: Icon(Icons.help_center_outlined,color:  Colors.black45,size: 25),
                            tooltip:'Click the icon for detailed configuration before you go the simulation process' ,
                          ),
                        ),
                      ),
                    ),
                    Container(
                      child: Row(
                        children: <Widget>[
                          Padding(
                            padding: const EdgeInsets.only(
                              left: 70,
                            ),
                            child: Text('Global Cloud  ',style: TextStyle(
                              fontSize: 18,
                              color:  Color(0xFF345979),
                              fontWeight: FontWeight.w800,
                            ),
                            ),
                          ),
                          SizedBox(
                            height: 60,
                            width: 60,
                            child: RaisedButton(
                              color: Color(0xFF554F4F),
                              onPressed: (){
                                Navigator.of(context).pushNamed('global cloud');
                              },
                              shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(25)
                              ),
                              child:Row(
                                children:<Widget>[
                                  Icon(Icons.cloud,color: Colors.yellow,size: 28),
                                ],
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                    Container(
                      child: Row(
                        children: <Widget>[
                          Padding(
                            padding: const EdgeInsets.only(
                              left: 110,
                            ),
                            child: Column(
                              children: [
                                Text(''),
                                Text('Internet  ',style: TextStyle(
                                  fontSize: 18,
                                  color: Color(0xFF345979),
                                  fontWeight: FontWeight.w800,
                                ),
                                ),
                              ],
                            ),
                          ),
                          Column(
                            children: [
                              Icon(Icons.arrow_upward,size: 20),
                              SizedBox(
                                height: 60,
                                width: 60,
                                child: RaisedButton(
                                  color: Color(0xFF77A5CD),
                                  onPressed: (){
                                    Navigator.of(context).pushNamed('internet');
                                  },
                                  shape: RoundedRectangleBorder(
                                      borderRadius: BorderRadius.circular(25)
                                  ),
                                  child:Row(
                                    children:<Widget>[
                                      Icon(Icons.wifi_sharp,color: Colors.white,size: 28),
                                    ],
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ],
                      ),
                    ),
                    Container(
                      child: Row(
                        children: <Widget>[
                          Padding(
                            padding: const EdgeInsets.only(
                                left: 10
                            ),
                            child: SizedBox(
                              height: 80,
                              width: 80,
                              child: RaisedButton(
                                color: Colors.orangeAccent,
                                onPressed: (){
                                  Navigator.of(context).pushNamed('orchestrator');
                                },
                                shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(25)
                                ),
                                child:Row(
                                  children:<Widget>[
                                    Icon(Icons.settings,color: Colors.black,size: 46),
                                  ],
                                ),
                              ),
                            ),
                          ),
                          Padding(
                              padding: const EdgeInsets.only(
                                  left: 20
                              ),
                              child: Column(
                                children: [
                                  SizedBox( height: 50,
                                    width: 110,
                                    child: Padding(
                                      padding: const EdgeInsets.only(
                                          right: 30
                                      ),
                                      child: VerticalDivider(
                                        color: Colors.black,
                                        thickness: 2,
                                      ),
                                    ),
                                  ),
                                  Text('_____________________________________'),
                                ],
                              )

                          ),
                        ],
                      ),
                    ),
                    Row(
                      children: [
                        Padding(
                          padding: const EdgeInsets.only(
                              left: 15
                          ),
                          child: SizedBox(
                            height: 50,
                            width: 110,
                            child: Text('Edge Orchestrator',style: TextStyle(
                              fontSize: 18,
                              color: Colors.red,
                              fontWeight: FontWeight.w800,
                            ),
                            ),
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.only(
                              right: 10

                          ),
                          child: SizedBox(
                              height: 50,
                              width: 110,
                              child: VerticalDivider(
                                color: Colors.black,
                                thickness: 2,
                              )
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.only(
                              left: 55

                          ),
                          child: SizedBox(
                              height: 50,
                              width: 110,
                              child: VerticalDivider(
                                color: Colors.black,
                                thickness: 2,
                              )
                          ),
                        ),
                      ],
                    ),

                    Container(
                      child: Row(
                        children: <Widget>[
                          Padding(
                            padding: const EdgeInsets.only(
                                top: 25,
                                right: 10,
                                left: 50

                            ),
                            child: SizedBox(
                              height: 60,
                              width: 60,
                              child: RaisedButton(
                                color: Colors.grey,
                                onPressed: (){
                                  // Navigator.of(context).pushNamed('edge server');
                                },
                                shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(25)
                                ),
                                child:Row(
                                  children:<Widget>[
                                    Icon(Icons.storage,color: Colors.white,size: 28),
                                  ],
                                ),
                              ),
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.only(
                              top: 2,

                            ),
                            child: SizedBox(
                              height: 6,
                              width: 30,
                              child: Icon(Icons.minimize_rounded,size: 30),
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.only(

                            ),
                            child: Column(
                              children: [
                                Icon(Icons.arrow_drop_down,size: 20),
                                SizedBox(
                                  height: 60,
                                  width: 60,
                                  child: RaisedButton(
                                    color: Color(0xFF77A5CD),
                                    onPressed: (){
                                      Navigator.of(context).pushNamed('internet');
                                    },
                                    shape: RoundedRectangleBorder(
                                        borderRadius: BorderRadius.circular(25)
                                    ),
                                    child:Row(
                                      children:<Widget>[
                                        Icon(Icons.wifi_sharp,color: Colors.white,size: 28),
                                      ],
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.only(
                                top: 25,
                                right: 1,
                                left: 25
                            ),
                            child: SizedBox(
                              height: 60,
                              width: 60,
                              child: RaisedButton(
                                color: Colors.grey,
                                onPressed: (){
                                  // Navigator.of(context).pushNamed('edge server');
                                },
                                shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(25)
                                ),
                                child:Row(
                                  children:<Widget>[
                                    Icon(Icons.storage,color: Colors.white,size: 28),
                                  ],
                                ),
                              ),
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.only(
                                top: 2
                            ),
                            child: SizedBox(
                              height: 6,
                              width: 30,
                              child: Icon(Icons.minimize_rounded,size: 30),
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.only(
                            ),
                            child: Column(
                              children: [
                                Icon(Icons.arrow_drop_down,size: 20),
                                SizedBox(
                                  height: 60,
                                  width: 60,
                                  child: RaisedButton(
                                    color: Color(0xFF77A5CD),
                                    onPressed: (){
                                      Navigator.of(context).pushNamed('internet');
                                    },
                                    shape: RoundedRectangleBorder(
                                        borderRadius: BorderRadius.circular(25)
                                    ),
                                    child:Row(
                                      children:<Widget>[
                                        Icon(Icons.wifi_sharp,color: Colors.white,size: 28),
                                      ],
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                    ),
                    Row(
                      children: [
                        Padding(
                          padding: const EdgeInsets.only(
                              left: 60,
                              top: 8
                          ),
                          child: SizedBox(
                            width: 60,
                            child: Text('Edge Server   ',style: TextStyle(
                              fontSize: 18,
                              color:  Color(0xFF345979),
                              fontWeight: FontWeight.w800,
                            ),
                            ),
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.only(
                            left: 50,
                          ),
                          child: Text('AP   ',style: TextStyle(
                            fontSize: 18,
                            color: Color(0xFF345979),
                            fontWeight: FontWeight.w800,
                          ),
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.only(
                              left: 40,
                              top: 8
                          ),
                          child: SizedBox(
                            width: 60,
                            child: Text('Edge Server   ',style: TextStyle(
                              fontSize: 18,
                              color:  Color(0xFF345979),
                              fontWeight: FontWeight.w800,
                            ),
                            ),
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.only(
                            left: 40,
                          ),
                          child: Text('AP   ',style: TextStyle(
                            fontSize: 18,
                            color: Color(0xFF345979),
                            fontWeight: FontWeight.w800,
                          ),
                          ),
                        ),
                      ],
                    ),
                    Container(
                      child: Row(
                        children: <Widget>[
                          Padding(
                            padding: const EdgeInsets.only(

                                right: 110,
                                left: 150
                            ),
                            child: Column(
                              children: [
                                Icon(Icons.arrow_downward,size: 20),
                                SizedBox(
                                  height: 60,
                                  width: 60,
                                  child: RaisedButton(
                                    color: Colors.brown,
                                    onPressed: (){
                                      Navigator.of(context).pushNamed('edge users');
                                    },
                                    shape: RoundedRectangleBorder(
                                        borderRadius: BorderRadius.circular(25)
                                    ),
                                    child:Row(
                                      children:<Widget>[
                                        Icon(Icons.group_add_rounded,color: Colors.white,size: 28),
                                      ],
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.only(
                                left: 10
                            ),
                            child: Column(
                              children: [
                                Icon(Icons.arrow_downward,size: 20),
                                SizedBox(
                                  height: 60,
                                  width: 60,
                                  child: RaisedButton(
                                    color: Colors.brown,
                                    onPressed: (){
                                      Navigator.of(context).pushNamed('edge users');
                                    },
                                    shape: RoundedRectangleBorder(
                                        borderRadius: BorderRadius.circular(25)
                                    ),
                                    child:Row(
                                      children:<Widget>[
                                        Icon(Icons.group_add_rounded,color: Colors.white,size: 28),
                                      ],
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                    ),
                    Row(
                      children: [
                        Padding(
                          padding: const EdgeInsets.only(
                            top: 8,
                            left: 165,
                          ),
                          child: SizedBox(
                            width: 60,
                            child: Text('Edge Users  ',style: TextStyle(
                              fontSize: 18,
                              color:  Color(0xFF345979),
                              fontWeight: FontWeight.w800,
                            ),
                            ),
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.only(
                            top: 8,
                            left: 115,
                          ),
                          child: SizedBox(
                            width: 60,
                            child: Text('Edge Users  ',style: TextStyle(
                              fontSize: 18,
                              color:  Color(0xFF345979),
                              fontWeight: FontWeight.w800,
                            ),
                            ),
                          ),
                        ),
                      ],
                    ),
                    Container(
                      child: Row(
                        children: <Widget>[
                          Padding(
                            padding: const EdgeInsets.only(
                                top: 30,
                                left: 20
                            ),
                            child: SizedBox(
                              height: 60,
                              width: 150,
                              child: OriginalButton(
                                text:'Simulation Process',
                                textColor: Colors.white,
                                color: Color(0xFFA33A3A),
                                onPressed:() async{
                                  final status = await Permission.storage.request();
                                  if (status.isGranted) {
                                    Navigator.of(context).pushNamed('simulation');
                                  }
                                },
                              ),
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.only(
                              top: 30,
                              left: 80,
                            ),
                            child: SizedBox(
                              height: 60,
                              width: 150,
                              child: OriginalButton(
                                text:'Edit sample applications',
                                textColor: Colors.white,
                                color: Color(0xFF345979),
                                onPressed: ()async{
                                  SharedPreferences prefs = await SharedPreferences.getInstance();
                                  prefs.setInt('counter', 1);
                                  Navigator.of(context).pushNamed('add application');
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
      ),
    );
  }
}