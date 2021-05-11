import 'dart:async';
import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:flutter_edgecloudsim/screens/startup_screen.dart';
import 'package:flutter_edgecloudsim/widgets/NavDrawer.dart';
import 'package:http/http.dart' as http;
import 'package:shared_preferences/shared_preferences.dart';
import 'package:toast/toast.dart';


class Login extends StatefulWidget {
  @override
  _LoginState createState() => _LoginState();
}

enum LoginStatus { notSignIn, signIn }

class _LoginState extends State<Login> {
  LoginStatus _loginStatus = LoginStatus.notSignIn;
  String email, password;
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
      login();
    }
  }

  login() async {
    final response = await http
        .post("http://10.0.2.2/myphp/api_verification.php", body: {
      "flag": 1.toString(),
      "email": email,
      "password": password,
      "fcm_token": "test_fcm_token"
    });

    final data = jsonDecode(response.body);
    int value = data['value'];
    String message = data['message'];
    String emailAPI = data['email'];
    String nameAPI = data['name'];
    String id = data['id'];

    if (value == 1) {
      setState(() {
        _loginStatus = LoginStatus.signIn;
        savePref(value, emailAPI, nameAPI, id);
      });
      print(message);
      loginToast(message);
    } else {
      print("fail");
      print(message);
      loginToast(message);
    }
  }

  loginToast(String toast) {
    return Toast.show(toast, context, duration: Toast.LENGTH_SHORT, gravity:  Toast.BOTTOM, backgroundColor: Color(
        0xFF958B8B),
        textColor: Colors.white);
  }

  savePref(int value, String email, String name, String id) async {
    SharedPreferences preferences = await SharedPreferences.getInstance();
    setState(() {
      preferences.setInt("value", value);
      preferences.setString("name", name);
      preferences.setString("email", email);
      preferences.setString("id", id);
      preferences.commit();
    });
  }

  var value;

  getPref() async {
    SharedPreferences preferences = await SharedPreferences.getInstance();
    setState(() {
      value = preferences.getInt("value");

      _loginStatus = value == 1 ? LoginStatus.signIn : LoginStatus.notSignIn;
    });
  }

  signOut() async {
    SharedPreferences preferences = await SharedPreferences.getInstance();
    setState(() {
      preferences.setInt("value",0);
      preferences.setString("name", "");
      preferences.setString("email", "");
      preferences.setString("id", "");

      preferences.commit();
      _loginStatus = LoginStatus.notSignIn;
    });
  }

  clearPref() async{
    SharedPreferences preferences = await SharedPreferences.getInstance();
    preferences.clear();
  }

  @override
  void initState() {
    clearPref();
    super.initState();
    getPref();
  }

  @override
  Widget build(BuildContext context) {
    switch (_loginStatus) {
      case LoginStatus.notSignIn:
        return Scaffold(
          drawer: NavDrawer(),
          appBar: AppBar(
            iconTheme: IconThemeData(
              color:Colors.white,
            ),
            backgroundColor: Color(0xFF77A5CD),
          ),
        //  backgroundColor: Colors.white,
          body:SingleChildScrollView(
            child:Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Container(
                    padding: const EdgeInsets.all(8.0),

                   // color:  Color(0xFF77A5CD),
                    child: Form(
                      key: _key,
                      child: Padding(
                        padding: const EdgeInsets.only(bottom: 3),
                        child: Column(
                         // mainAxisAlignment: MainAxisAlignment.center,
                          children: <Widget>[
                            SizedBox(),
                            Hero(
                              tag: 'logoAnimation',
                              child: Image.asset(
                                'assets/images/ECS logo1.jpg',
                                height: 250,
                                fit: BoxFit.cover,
                              ),
                            ),
                            //card for Email TextFormField
                            Padding(
                              padding: const EdgeInsets.only(right: 269,top: 30,bottom: 5),
                              child: Text('Email Address',
                                style: TextStyle(
                                  color: Colors.black,
                                  fontSize: 17,
                                  fontWeight: FontWeight.w400,

                                ),),
                            ),
                             TextFormField(
                                validator: (e) {
                                  if (e.isEmpty) {
                                    return "Please Insert Email";
                                  }
                                },
                                onSaved: (e) => email = e,
                                style: TextStyle(
                                  color: Colors.black,
                                  fontSize: 16,
                                  fontWeight: FontWeight.w300,
                                ),
                                decoration: InputDecoration(
                                  fillColor: Colors.white,
                                  filled:true,
                                  enabledBorder: OutlineInputBorder(
                                      borderSide: BorderSide(color: Colors.black45,width: 1.0)
                                  ),
                                  focusedBorder: OutlineInputBorder(
                                      borderSide: BorderSide(color: Colors.blue,width: 1.0)
                                  ),
                                    prefixIcon: Padding(
                                      padding:
                                      EdgeInsets.only(left: 2, right: 1),
                                      child:
                                      Icon(Icons.person, color: Colors.black),
                                    ),
                                    contentPadding: EdgeInsets.all(10),
                                ),
                              ),

                            // Card for password TextFormField
                            Padding(
                              padding: const EdgeInsets.only(right: 299,bottom: 5,
                              top: 30),
                              child: Text('Password',
                                style: TextStyle(
                                  color: Colors.black,
                                  fontSize: 17,
                                  fontWeight: FontWeight.w400,

                                ),),
                            ),
                             TextFormField(
                                validator: (e) {
                                  if (e.isEmpty) {
                                    return "Password Can't be Empty";
                                  }
                                },
                                obscureText: _secureText,
                                onSaved: (e) => password = e,
                                style: TextStyle(
                                  color: Colors.black,
                                  fontSize: 16,
                                  fontWeight: FontWeight.w300,
                                ),
                                decoration: InputDecoration(
                                  fillColor: Colors.white,
                                  filled:true,
                                  enabledBorder: OutlineInputBorder(
                                      borderSide: BorderSide(color: Colors.black45,width: 1.0)
                                  ),
                                  focusedBorder: OutlineInputBorder(
                                      borderSide: BorderSide(color: Colors.blue,width: 1.0)
                                  ),
                                  prefixIcon: Padding(
                                    padding: EdgeInsets.only(left: 2, right: 1),
                                    child: Icon(Icons.phonelink_lock,
                                        color: Colors.black),
                                  ),
                                  suffixIcon: IconButton(
                                    onPressed: showHide,
                                    icon: Icon(_secureText
                                        ? Icons.visibility_off
                                        : Icons.visibility),
                                  ),
                                  contentPadding: EdgeInsets.all(18),
                                ),
                              ),
                                  Padding(
                                    padding: const EdgeInsets.only(
                                      top: 30
                                    ),
                                    child: SizedBox(
                                     width: 250,
                                      height: 50,
                                      child: RaisedButton(
                                          shape: RoundedRectangleBorder(
                                              borderRadius:
                                              BorderRadius.circular(15.0)),
                                          child: Text(
                                            "Doesn\'t have an acount?",
                                            style: TextStyle(fontSize: 18.0,),
                                          ),
                                          textColor:Color(0xFF3577B1),
                                          color: Colors.white,
                                          onPressed: () {
                                            Navigator.push(
                                              context,
                                              MaterialPageRoute(
                                                  builder: (context) => Register()),
                                            );
                                          })
                                    ),
                                  ),
                            Padding(
                              padding: const EdgeInsets.only(top: 20),
                              child: SizedBox(
                               width: 250,
                                  height: 50,
                                child: RaisedButton(
                                    shape: RoundedRectangleBorder(
                                        borderRadius:
                                        BorderRadius.circular(15.0)),
                                    child: Text(
                                      "Login",
                                      style: TextStyle(fontSize: 18.0),
                                    ),
                                    textColor: Colors.white,
                                    color:Color(0xFF3577B1),
                                    onPressed: () {
                                      check();
                                    }),
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
        break;

      case LoginStatus.signIn:
        return StartupScreen();
        //return MainMenu(signOut);
//        return ProfilePage(signOut);
        break;
    }
  }
}

class Register extends StatefulWidget {
  @override
  _RegisterState createState() => _RegisterState();
}

class _RegisterState extends State<Register>with TickerProviderStateMixin {
  int _state = 0;
  bool  _hasbeenpressed=false;
  String name, email, mobile, password;
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
      "fcm_token": "test_fcm_token"
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
    return Toast.show(toast, context, duration: Toast.LENGTH_LONG, gravity:  Toast.BOTTOM, backgroundColor: Color(0xFF958B8B),
        textColor: Colors.white);
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
                          "Register your account",style: TextStyle(
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
                              labelText: "Fullname"),
                        ),

                      Text(''),

                      //card for Email TextFormField
                       TextFormField(
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
                              labelText: "Email"),
                        ),
                      Text(''),
                      //card for Mobile TextFormField
                      TextFormField(
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
                            labelText: "Mobile",
                          ),
                          keyboardType: TextInputType.number,
                        ),

                      //card for Password TextFormField
                      Text(''),
                       TextFormField(
                          obscureText: _secureText,
                          onSaved: (e) => password = e,
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
                              suffixIcon: IconButton(
                                onPressed: showHide,
                                icon: Icon(_secureText
                                    ? Icons.visibility_off
                                    : Icons.visibility),
                              ),
                              prefixIcon: Padding(
                                padding: EdgeInsets.only(left: 20, right: 15),
                                child: Icon(Icons.phonelink_lock,
                                    color: Colors.black),
                              ),
                              contentPadding: EdgeInsets.all(18),
                              labelText: "Password"),
                        ),


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
                                  "Register",
                                  style: TextStyle(fontSize: 18.0),
                                ),
                                textColor: Colors.white,
                                color:Color(0xFF3577B1),
                                onPressed: () {
                                  check();
                                }),
                          ),

                      /*SizedBox(
                        height: 50.0,
                        width: 250,
                        child: RaisedButton(
                            shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(15.0)),
                            child: Text(
                              "GoTo Login",
                              style: TextStyle(fontSize: 18.0),
                            ),
                            textColor: Colors.white,
                            color:Color(0xFF3577B1),
                            onPressed: () {
                              Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) => Login()),
                              );
                            }),
                      ),*/
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


