import 'package:flutter/material.dart';
import 'package:flutter_edgecloudsim/services/auth.dart';
import 'package:flutter_edgecloudsim/widgets/constants.dart';
import 'package:flutter_edgecloudsim/widgets/original_button.dart';
import 'package:shared_preferences/shared_preferences.dart';
class ContDataCenterScreen extends StatefulWidget {
  @override
  _ContDataCenterScreenState createState() => _ContDataCenterScreenState();
}

class _ContDataCenterScreenState extends State<ContDataCenterScreen> {

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


  List<String>core=['8','8','8','8''8','8''8','8''8','8''8','8''8','8'];
  List<String>mips=['4000','4000','4000','4000''4000','4000''4000','4000''4000','4000''4000','4000''4000','4000'];
  List<String>ram=['8000','8000','8000','8000''8000','8000''8000','8000''8000','8000''8000','8000''8000','8000'];
  List<String>storage=['200000','200000','200000','200000''200000','200000''200000','200000''200000','200000''200000','200000''200000','200000'];

  List<String>core1=['2','2','2','2''2','2''2','2''2','2''2','2''2','2'];
  List<String>mips1=['1000','1000','1000','1000''1000','1000''1000','1000''1000','1000''1000','1000''1000','1000'];
  List<String>ram1=['2000','2000','2000','2000''2000','2000''2000','2000''2000','2000''2000','2000''2000','2000'];
  List<String>storage1=['50000','50000','50000','50000''50000','50000''50000','50000''50000','50000''50000','50000''50000','50000'];

  List<String>core2=['2','2','2','2''2','2''2','2''2','2''2','2''2','2'];
  List<String>mips2=['1000','1000','1000','1000''1000','1000''1000','1000''1000','1000''1000','1000''1000','1000'];
  List<String>ram2=['2000','2000'];
  List<String>storage2=['50000','50000','50000','50000''50000','50000''50000','50000''50000','50000''50000','50000''50000','50000'];
  var core_controller;
  var mips_controller;
  var ram_controller;
  var storage_controller;

  var core_vm1_controller;
  var mips_vm1_controller;
  var ram_vm1_controller;
  var storage_vm1_controller;

  var core_vm2_controller;
  var mips_vm2_controller;
  var ram_vm2_controller;
  var storage_vm2_controller;
  _ContDataCenterScreenState(){

    getData() async {
      SharedPreferences prefs = await SharedPreferences.getInstance();
      setState((){
        counter= prefs.getInt('counter');
      });

      core_controller=TextEditingController(text:core[counter-1]);
      mips_controller=TextEditingController(text: mips[counter-1]);
      ram_controller=TextEditingController(text:ram[counter-1]);
      storage_controller=TextEditingController(text:storage [counter-1]);

      core_vm1_controller=TextEditingController(text:core1[counter-1]);
      mips_vm1_controller=TextEditingController(text:mips1[counter-1]);
      ram_vm1_controller=TextEditingController(text:ram1 [counter-1]);
      storage_vm1_controller=TextEditingController(text:storage1 [counter-1]);

      core_vm2_controller=TextEditingController(text:core2[counter-1]);
      mips_vm2_controller=TextEditingController(text:mips2[counter-1]);
      ram_vm2_controller=TextEditingController(text:ram2 [counter-1]);
      storage_vm2_controller=TextEditingController(text:storage2[counter-1]);
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
            left: 16.0,
            right: 16.0,
            top: 80.0,
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
                          bottom: 50,
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
                        top: 10,
                      ),
                      child: Row(
                        children: [
                          SizedBox(
                            width: 160,
                            height: 60,
                            child: Padding(
                              padding: const EdgeInsets.only(
                                top: 10,
                                left: 20,
                              ),
                              child: SizedBox(
                                height: 40,
                                width: 120,
                                child: OriginalButton(
                                  text:'Prev. DataCenter',
                                  textColor: Colors.white,
                                  color: Colors.blue,
                                  onPressed: ()async{
                                    SharedPreferences prefs = await SharedPreferences.getInstance();
                                    counter = prefs.getInt(('counter'));
                                    if(counter != 1)
                                      prefs.setInt('counter', counter-1);
                                    else
                                      counter = 1;
                                    Navigator.of(context).pushNamed('data center');
                                    //edit data in firebase
                                    //change flag
                                  },
                                ),
                              ),
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.only(
                              top: 10,
                              left: 20,
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
                                text:'Delete App',
                                textColor: Colors.white,
                                color: Colors.blueGrey,
                                onPressed: ()async{
                                  SharedPreferences prefs = await SharedPreferences.getInstance();
                                  prefs.setInt('delete_app', counter);
                                  //edit data in firebase
                                  //change flag
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
                                  text:'Next DataCenter',
                                  textColor: Colors.white,
                                  color: Colors.blueGrey,
                                  onPressed: ()async{
                                    SharedPreferences prefs = await SharedPreferences.getInstance();
                                    prefs.setInt('counter', counter+1);
                                    Navigator.of(context).pushNamed('data center');
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
