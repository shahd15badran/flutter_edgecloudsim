import 'package:flutter/material.dart';
import 'package:flutter_edgecloudsim/related_to_application_xml_file/add_app_screen.dart';
import 'package:flutter_edgecloudsim/related_to_application_xml_file/applications_xml.dart';
import 'package:flutter_edgecloudsim/related_to_application_xml_file/cont_app_screen.dart';
import 'package:flutter_edgecloudsim/related_to_default_config_file/basic_setting_screen.dart';
import 'package:flutter_edgecloudsim/related_to_default_config_file/default_config_file.dart';
import 'package:flutter_edgecloudsim/related_to_default_config_file/edge_users_screen.dart';
import 'package:flutter_edgecloudsim/related_to_default_config_file/global_cloud_screen.dart';
import 'package:flutter_edgecloudsim/related_to_default_config_file/internet_screen.dart';
import 'package:flutter_edgecloudsim/related_to_default_config_file/orchestrator_screen.dart';
import 'package:flutter_edgecloudsim/related_to_edge_devices_xml_file/cont_data_center.dart';
import 'package:flutter_edgecloudsim/related_to_edge_devices_xml_file/data_center_screen.dart';
import 'package:flutter_edgecloudsim/related_to_edge_devices_xml_file/edge_devices_xml.dart';
import 'package:flutter_edgecloudsim/screens/ListingFiles.dart';
import 'package:flutter_edgecloudsim/screens/auth_screen.dart';
import 'package:flutter_edgecloudsim/screens/edit_password.dart';
import 'package:flutter_edgecloudsim/screens/profile_screen.dart';
import 'package:flutter_edgecloudsim/screens/test.dart';
import 'package:flutter_edgecloudsim/screens/tutorial_screen.dart';
import 'package:flutter_edgecloudsim/simulation_process/matlab_screen.dart';
import 'simulation_process/cont_display_result.dart';
import 'simulation_process/display_log_result.dart';
import 'simulation_process/display_result.dart';
import 'package:flutter_edgecloudsim/screens/graphical_screen.dart';
import 'package:flutter_edgecloudsim/screens/intro_screen.dart';
import 'package:flutter_edgecloudsim/screens/manually_screen.dart';
import 'simulation_process/selected_graph.dart';
import 'simulation_process/simulation_screen.dart';
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
      home:IntroScreen(),//DataCenterScreen(),
      routes: {
        'intro': (context) => IntroScreen(),
        'login':(context)=>Login(),
        'startup':(context) =>StartupScreen(),
        'graphical':(context) =>GraphicalScreen(),
        'manually':(context) => ManuallyScreen() ,
        'simulation':(context)=>SimulationScreen(),
        'orchestrator':(context)=>OrchestratorScreen(),
        'internet':(context) =>InternetScreen(),
        'global cloud':(context)=> GlobalCloudScreen(),
        'basic setting':(context)=> SettingScreen(),
        'add application':(context)=> AddAppScreen(),
        'cont add application':(context)=> ContAddAppScreen(),
        'edge users':(context) =>EdgeUserScreen(),
        'data center':(context) =>DataCenterScreen(),
        'cont data center':(context)=>ContDataCenterScreen(),
        'app xml':(context) =>AppXML(),
        'edge xml':(context) =>EdgeXML(),
        'default_config_file':(context)=>DefaultConfig(),
        'simulation_screen':(context)=>SimulationScreen(),
        'log screen':(context)=>LogScreen(),
        'result screen':(context)=>ResultScreen(),
        'cont result screen':(context)=>ContResultScreen(),
        'selected graph':(context)=>SelectedGraph(),
        'matlab screen':(context)=>MatlabScreen(),
        'MyFileList':(context)=>MyFileList(),
        'tutorial':(context)=>TutorialScreen(),
        'profile':(context)=>ProfileScreen(),
        'edit password':(context)=>EditPasswprd(),

        'test':(context)=>App(),


      },
    );
  }
}