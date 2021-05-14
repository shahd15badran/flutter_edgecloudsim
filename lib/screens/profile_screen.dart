import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:flutter/material.dart';
import 'package:flutter_edgecloudsim/widgets/NavDrawer.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:toast/toast.dart';
class ProfileScreen extends StatefulWidget {
  @override
  _ProfileScreenState createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfileScreen> {
  int _state = 0;
  bool  _hasbeenpressed=false;
  var name, email, mobile, password;
  final _key = new GlobalKey<FormState>();
  bool _secureText = true;


  showHide() {
    setState(() {
      _secureText = !_secureText;
    });
  }

  check() {
    final form = _key.currentState;
    if (form.validate()) {
      form.save();
      save();
    }
  }

  save() async {
    final response = await http
        .post("http://10.0.2.2/myphp/api_verification.php", body: {
      "flag": 2.toString(),
      "name": name,
      "email": email,
      "mobile": mobile,
      "password": password,
      "fcm_token": "test_fcm_token",
    });

    final data = jsonDecode(response.body);
    int value = data['value'];
    String message = data['message'];
    if (value == 1) {
      setState(() {
        Navigator.pop(context);
      });
      print(message);
      registerToast(message);
    } else if (value == 2) {
      print(message);
      registerToast(message);
    } else {
      print(message);
      registerToast(message);
    }
  }

  registerToast(String toast) {
    return Toast.show(toast, context, duration: Toast.LENGTH_LONG, gravity:  Toast.BOTTOM, backgroundColor: Color(
        0xFFD42828),
        textColor: Colors.white);
  }
  void initState (){
    getData();
    super.initState();
  }
  getData() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    setState(() {
      name=TextEditingController(text: prefs.getString('name'));
      email=TextEditingController(text: prefs.getString('email'));
      mobile=TextEditingController(text: prefs.getString('mobile'));
    });
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
            Padding(
                padding: const EdgeInsets.only(
                  left: 230,
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
      body: Center(
        child: ListView(
          shrinkWrap: true,
          padding: EdgeInsets.all(15.0),
          children: <Widget>[
            Center(
              child: Container(
                padding: const EdgeInsets.all(8.0),
                child: Form(
                  key: _key,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: <Widget>[
                      SizedBox(
                        height: 40,
                      ),
                      SizedBox(
                        height: 50,
                        child: Text(
                          "Edit your account",style: TextStyle(
                          fontSize: 30,
                          color: Color(0xFF02101C),
                          fontWeight: FontWeight.w300,
                        ),
                        ),
                      ),
                      SizedBox(
                        height: 25,
                      ),

                      //card for Fullname TextFormField
                      TextFormField(
                        controller: name,
                        validator: (e) {
                          if (e.isEmpty) {
                            return "Please insert Full Name";
                          }
                        },
                        onSaved: (e) => name = e,
                        style: TextStyle(
                          color: Colors.black,
                          fontSize: 16,
                          fontWeight: FontWeight.w300,
                        ),
                        decoration: InputDecoration(
                            enabledBorder: OutlineInputBorder(
                                borderSide: BorderSide(color: Colors.black45,width: 1.0)
                            ),
                            focusedBorder: OutlineInputBorder(
                                borderSide: BorderSide(color: Colors.blue,width: 1.0)
                            ),
                            prefixIcon: Padding(
                              padding: EdgeInsets.only(left: 20, right: 15),
                              child: Icon(Icons.person, color: Colors.black),
                            ),
                            contentPadding: EdgeInsets.all(18),
                        ),
                      ),

                      Text(''),

                      //card for Email TextFormField
                      TextFormField(
                        controller: email,
                        validator: (e) {
                          if (e.isEmpty) {
                            return "Please insert Email";
                          }
                        },
                        onSaved: (e) => email = e,
                        style: TextStyle(
                          color: Colors.black,
                          fontSize: 16,
                          fontWeight: FontWeight.w300,
                        ),
                        decoration: InputDecoration(
                            enabledBorder: OutlineInputBorder(
                                borderSide: BorderSide(color: Colors.black45,width: 1.0)
                            ),
                            focusedBorder: OutlineInputBorder(
                                borderSide: BorderSide(color: Colors.blue,width: 1.0)
                            ),
                            prefixIcon: Padding(
                              padding: EdgeInsets.only(left: 20, right: 15),
                              child: Icon(Icons.email, color: Colors.black),
                            ),
                            contentPadding: EdgeInsets.all(18),
                        ),
                      ),
                      Text(''),
                      //card for Mobile TextFormField
                      TextFormField(
                        controller: mobile,
                        validator: (e) {
                          if (e.isEmpty) {
                            return "Please insert Mobile Number";
                          }
                        },
                        onSaved: (e) => mobile = e,
                        style: TextStyle(
                          color: Colors.black,
                          fontSize: 16,
                          fontWeight: FontWeight.w300,
                        ),
                        decoration: InputDecoration(
                          enabledBorder: OutlineInputBorder(
                              borderSide: BorderSide(color: Colors.black45,width: 1.0)
                          ),
                          focusedBorder: OutlineInputBorder(
                              borderSide: BorderSide(color: Colors.blue,width: 1.0)
                          ),
                          prefixIcon: Padding(
                            padding: EdgeInsets.only(left: 20, right: 15),
                            child: Icon(Icons.phone, color: Colors.black),
                          ),
                          contentPadding: EdgeInsets.all(18),
                        ),
                        keyboardType: TextInputType.number,
                      ),

                      Text(''),
                      Padding(
                        padding: const EdgeInsets.only(
                            top: 10
                        ),
                        child: SizedBox(
                          width: 350,
                          height: 50,
                          child: new GestureDetector(
                            onTap: () async{
                              Navigator.of(context).pushReplacementNamed('edit password');
                            },
                            child: Padding(
                              padding: const EdgeInsets.only(left: 10),
                              child: new Text("Edit your password",
                                  style: TextStyle(fontSize: 18.0,)),
                            ),
                          ),

                        ),
                      ),
                      Text(''),
                      Padding(
                        padding: EdgeInsets.all(30.0),
                      ),

                      SizedBox(
                        height: 50,
                        width: 250,
                        child: RaisedButton(
                            shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(15.0)),
                            child: Text(
                              "Save",
                              style: TextStyle(fontSize: 18.0),
                            ),
                            textColor: Colors.white,
                            color:Color(0xFF3577B1),
                            onPressed: () {
                              check();
                            }),
                      ),

                    ],
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
