import 'package:shared_preferences/shared_preferences.dart';
import 'package:flutter/material.dart';

class AppXML extends StatefulWidget {
  @override
  _State createState() => _State();
}

class _State extends State<AppXML> {
  @override
  String application_name="";
  void initState (){
       getData();
     }
  getData() async{
  SharedPreferences prefs = await SharedPreferences.getInstance();
  setState((){
    application_name=prefs.getString('application_name');
  });
}

Widget build(BuildContext context) {
    return Container();
  }
}
