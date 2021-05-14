import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class NavDrawer extends StatefulWidget {
  @override
  _NavDrawerState createState() => _NavDrawerState();
}

class _NavDrawerState extends State<NavDrawer> {

  String username = '';
  getData() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    setState(() {
      username = prefs.getString('name');
    });
  }
  @override
  void initState() {
    getData();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: ListView(
        padding: EdgeInsets.zero,
        children: <Widget>[
          DrawerHeader(
            decoration: BoxDecoration(
                color: Color(0xFFC29F9F),
            ),
            child: Padding(
              padding: const EdgeInsets.only(top: 90),
              child: Text('Hey ' +username +'!',
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 26,
                  fontWeight: FontWeight.w600,

                ),),
            ),

          ),
          ListTile(
            leading: Icon(Icons.input),
            title: Text('Welcome'),
            onTap: () => {Navigator.of(context).pushNamed('startup')},
          ),
          ListTile(
            leading: Icon(Icons.verified_user),
            title: Text('Profile'),
            onTap:() async {
              Navigator.of(context).pushReplacementNamed('profile');
              // Navigator.of(context).pop()
            },          ),
          ListTile(
            leading: Icon(Icons.border_color),
            title: Text('Tutorial'),
            onTap:() async {
              Navigator.of(context).pushReplacementNamed('tutorial');
              // Navigator.of(context).pop()
            },
          ),
          ListTile(
            leading: Icon(Icons.exit_to_app),
            title: Text('Logout'),
            onTap:() async {
            Navigator.of(context).pushReplacementNamed('intro');
             // Navigator.of(context).pop()
            },
          ),
        ],
      ),
    );
  }
}