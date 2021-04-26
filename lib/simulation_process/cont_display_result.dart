import 'package:flutter/material.dart';
import 'package:flutter_edgecloudsim/services/auth.dart';
import 'package:flutter_edgecloudsim/widgets/original_button.dart';
import 'package:shared_preferences/shared_preferences.dart';
class ContResultScreen extends StatefulWidget {
  @override
  _LogScreenState createState() => _LogScreenState();
}

class _LogScreenState extends State<ContResultScreen> {
  AuthBase authBase = AuthBase();

  List <String> network=['Average Network Delay','Average WAN Delay','Average WLAN Delay'];
  List <String> addpdflist=['ALL_APPS','AUGMENTED_REALITY','HEALTH_APP','HEAVY_COMP_APP','INFOTAINMENT_APP'];


  String net ;
  String apppdf;
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
              child: Text('Sim Results'),
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
          top: 30,
          bottom: 10,
        ),
        child:SingleChildScrollView(
          child: Container(
            color: Colors.white70,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: <Widget>[
                Padding(
                  padding: const EdgeInsets.only(
                      top: 10,
                      bottom: 1,
                      left: 10,right: 10
                  ),
                  child:Text(' User choose plotAvgNetworkDelay function :',style: TextStyle(
                    fontSize: 18,
                    color: Colors.blue,
                    fontWeight: FontWeight.w800,
                  ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(
                    top: 20,
                    bottom: 5,
                  ),
                  child: Container(
                    decoration: BoxDecoration(
                      border: Border.all(color:Colors.grey,width: 1),
                      borderRadius: BorderRadius.circular(15),
                    ),
                    child: SizedBox(
                        width:250 ,
                        child: DropdownButton<String>(
                          hint: Text("   select function:"),
                          dropdownColor: Colors.grey,
                          icon: Icon(Icons.arrow_drop_down),
                          iconSize: 32,
                          isExpanded: true,
                          underline: SizedBox(),
                          style: TextStyle(
                            color: Colors.black,
                            fontSize: 18,
                          ),
                          value:net ,
                          onChanged: (newValue){
                            setState(() {
                              net=newValue;
                            });
                          },
                          items: network.map<DropdownMenuItem<String>>((valueItem){
                            return DropdownMenuItem(
                              value: valueItem,
                              child: Text(valueItem),
                            );
                          }).toList(),
                        )
                    ),
                  ),
                ),
                /////////////////////////////////////////////
                Padding(
                  padding: const EdgeInsets.only(
                      top: 30,
                      bottom: 1,
                      left: 10,right: 10
                  ),
                  child:Text('Choose App graph to display :',style: TextStyle(
                    fontSize: 18,
                    color: Colors.blue,
                    fontWeight: FontWeight.w800,
                  ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(
                    top: 20,
                    bottom: 5,
                  ),
                  child: Container(
                    decoration: BoxDecoration(
                      border: Border.all(color:Colors.grey,width: 1),
                      borderRadius: BorderRadius.circular(15),
                    ),
                    child: SizedBox(
                        width:250 ,
                        child: DropdownButton<String>(
                          hint: Text("   select App:"),
                          dropdownColor: Colors.grey,
                          icon: Icon(Icons.arrow_drop_down),
                          iconSize: 32,
                          isExpanded: true,
                          underline: SizedBox(),
                          style: TextStyle(
                            color: Colors.black,
                            fontSize: 18,
                          ),
                          value:apppdf ,
                          onChanged: (newValue){
                            setState(() {
                              apppdf=newValue;
                            });
                          },
                          items: addpdflist.map<DropdownMenuItem<String>>((valueItem){
                            return DropdownMenuItem(
                              value: valueItem,
                              child: Text(valueItem),
                            );
                          }).toList(),
                        )
                    ),
                  ),
                ),
                Text("_____________________________________________"),
                Padding(
                  padding: const EdgeInsets.only(
                      top: 20,
                      bottom: 1,
                      left: 10,right: 10
                  ),
                  child:Text('User choose plotAvgVmUtilization function :',style: TextStyle(
                    fontSize: 18,
                    color: Colors.blue,
                    fontWeight: FontWeight.w800,
                  ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(
                    top: 20,
                    bottom: 5,
                  ),
                  child: Container(
                    decoration: BoxDecoration(
                      border: Border.all(color:Colors.grey,width: 1),
                      borderRadius: BorderRadius.circular(15),
                    ),
                    child: SizedBox(
                        width:250 ,
                        child: DropdownButton<String>(
                          hint: Text("   select App:"),
                          dropdownColor: Colors.grey,
                          icon: Icon(Icons.arrow_drop_down),
                          iconSize: 32,
                          isExpanded: true,
                          underline: SizedBox(),
                          style: TextStyle(
                            color: Colors.black,
                            fontSize: 18,
                          ),
                          value:apppdf ,
                          onChanged: (newValue){
                            setState(() {
                              apppdf=newValue;
                            });
                          },
                          items: addpdflist.map<DropdownMenuItem<String>>((valueItem){
                            return DropdownMenuItem(
                              value: valueItem,
                              child: Text(valueItem),
                            );
                          }).toList(),
                        )
                    ),
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
                          top: 10,
                          left: 150,
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
                Padding(
                  padding: const EdgeInsets.only(
                      top: 50,
                      left: 20
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
                            text:'Back',
                            textColor: Colors.white,
                            color: Colors.blueGrey,
                            onPressed: (){
                              Navigator.of(context).pushNamed('result screen');
                            },
                          ),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(
                          left: 90,
                        ),
                        child: SizedBox(
                          width: 120,
                          height: 60,
                          child: Padding(
                            padding: const EdgeInsets.only(
                                left: 10
                            ),
                            child: OriginalButton(
                              text:'Next',
                              textColor: Colors.white,
                              color: Colors.blueGrey,
                              onPressed: (){
                                Navigator.of(context).pushNamed('selected graph');
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
      ),
    );

  }
}
