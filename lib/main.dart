import 'package:flutter/material.dart';
import 'package:flutter_edgecloudsim/screens/add_app_screen.dart';
import 'package:flutter_edgecloudsim/screens/applications_xml.dart';
import 'package:flutter_edgecloudsim/screens/auth_screen.dart';
import 'package:flutter_edgecloudsim/screens/basic_setting_screen.dart';
import 'package:flutter_edgecloudsim/screens/cont_app_screen.dart';
import 'package:flutter_edgecloudsim/screens/data_center_screen.dart';
import 'package:flutter_edgecloudsim/screens/edge_devices_xml.dart';
import 'package:flutter_edgecloudsim/screens/edge_users_screen.dart';
import 'package:flutter_edgecloudsim/screens/global_cloud_screen.dart';
import 'package:flutter_edgecloudsim/screens/graphical_screen.dart';
import 'package:flutter_edgecloudsim/screens/internet_screen.dart';
import 'package:flutter_edgecloudsim/screens/intro_screen.dart';
import 'package:flutter_edgecloudsim/screens/manually_screen.dart';
import 'package:flutter_edgecloudsim/screens/orchestrator_screen.dart';
import 'package:flutter_edgecloudsim/screens/simulation_screen.dart';
import 'package:flutter_edgecloudsim/screens/startup_screen.dart';

void main() async {
  runApp(MyApp());
}
class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
        visualDensity: VisualDensity.adaptivePlatformDensity,
        inputDecorationTheme: InputDecorationTheme(
          filled: true,
          fillColor: Color(0xfff2f9fe),
          enabledBorder: OutlineInputBorder(
            borderSide: BorderSide(color: Colors.grey[200]),
            borderRadius: BorderRadius.circular(25),
          ),
          focusedBorder: OutlineInputBorder(
            borderSide: BorderSide(color: Colors.grey[200]),
            borderRadius: BorderRadius.circular(25),
          ),
          disabledBorder: OutlineInputBorder(
            borderSide: BorderSide(color: Colors.grey[200]),
            borderRadius: BorderRadius.circular(25),
          ),
        ),
      ),
      home: DataCenterScreen(),
      routes: {
        'intro': (context) => IntroScreen(),
        'login': (context) => AuthScreen(authType: AuthType.login),
        'register': (context) => AuthScreen(authType: AuthType.register),
        'graphical':(context) =>GraphicalScreen(),
        'manually':(context) => ManuallyScreen() ,
        'startup':(context) =>StartupScreen(),
        'simulation':(context)=>SimulationScreen(),
        'orchestrator':(context)=>OrchestratorScreen(),
        'internet':(context) =>InternetScreen(),
        'global cloud':(context)=> GlobalCloudScreen(),
        'basic setting':(context)=> SettingScreen(),
        'add application':(context)=> AddAppScreen(),
        'cont add application':(context)=> ContAddAppScreen(),
        'edge users':(context) =>EdgeUserScreen(),
        'data center':(context) =>DataCenterScreen(),
        'app xml':(context) =>AppXML(),
        'edge xml':(context) =>EdgeXML(),
      },
    );
  }
}