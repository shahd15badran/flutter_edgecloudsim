import 'package:flutter/material.dart';
import 'package:flutter_edgecloudsim/services/auth.dart';

class NavDrawer extends StatelessWidget {
  AuthBase authBase = AuthBase();
  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: ListView(
        padding: EdgeInsets.zero,
        children: <Widget>[
          DrawerHeader(
            decoration: BoxDecoration(
                color: Color(0xFFC29F9F),), child: null,/*
                image: DecorationImage(
                    fit: BoxFit.fill,
                   //image: AssetImage('assets/images/EdgeCloud.png')
                )
            ),*/
          ),
          ListTile(
            leading: Icon(Icons.input),
            title: Text('Welcome'),
            onTap: () => {},
          ),
          ListTile(
            leading: Icon(Icons.verified_user),
            title: Text('Profile'),
            onTap: () => {Navigator.of(context).pop()},
          ),
          ListTile(
            leading: Icon(Icons.settings),
            title: Text('Settings'),
            onTap: () => {Navigator.of(context).pop()},
          ),
          ListTile(
            leading: Icon(Icons.border_color),
            title: Text('Feedback'),
            onTap: () => {Navigator.of(context).pop()},
          ),
          ListTile(
            leading: Icon(Icons.exit_to_app),
            title: Text('Logout'),
            onTap:() async {
            await authBase.logout();
            Navigator.of(context).pushReplacementNamed('login');
             // Navigator.of(context).pop()
            },
          ),
        ],
      ),
    );
  }
}