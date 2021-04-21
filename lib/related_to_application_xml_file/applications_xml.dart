

import 'package:flutter_edgecloudsim/services/auth.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:flutter/material.dart';
import 'package:xml/xml.dart';
import 'package:flutter/services.dart';

class AppXML extends StatefulWidget {
  @override
  _State createState() => _State();
}
String application_name="AUGMENTED_REALITY";
String usage_percentage="30";
String prob_cloud_selection="20";
String poisson_interarrival="5";
String delay_sensitivity ="0";
String active_period ="45";
String idle_period="15";
String data_upload="1500";
String data_download="25";
String task_length="2000";
String required_core="1";
String vm_utilization_on_edge="20";
String vm_utilization_on_cloud="2";
String vm_utilization_on_mobile="0";
//////////////////////
String application_xml="";
class _State extends State<AppXML> {
  AuthBase authBase = AuthBase();

 final application_xml_controller=TextEditingController(text:display());

  static const Platform =const MethodChannel("com.flutter.epic/epic");
  String _batteryLevel = '';
  Future<void> _getBatteryLevel() async {
    String batteryLevel;
    try {
      final String result = await Platform.invokeMethod('getAppXML',display());
      batteryLevel = ' $result  ';
    } on PlatformException catch (e) {
      print(e);
    }

    setState(() {
      _batteryLevel = batteryLevel;
    });
  }
  @override


  void initState (){
    getData();
  }
  getData() async{
    SharedPreferences prefs = await SharedPreferences.getInstance();
    setState((){
      if(prefs.getString('application_name')!=null)  application_name=prefs.getString('application_name');
      if(prefs.getString('usage_percentage')!=null)   usage_percentage=prefs.getString('usage_percentage');
      if(prefs.getString('prob_cloud_selection')!=null)  prob_cloud_selection=prefs.getString('prob_cloud_selection');
      if(prefs.getString('poisson_interarrival')!=null) poisson_interarrival=prefs.getString('poisson_interarrival');
      if(prefs.getString('delay_sensitivity')!=null)   delay_sensitivity=prefs.getString('delay_sensitivity');
      if(prefs.getString('active_period')!=null)   active_period=prefs.getString('active_period');

      if(prefs.getString('idle_period')!=null)  idle_period=prefs.getString('idle_period');
      if(prefs.getString('data_upload')!=null)   data_upload=prefs.getString('data_upload');
      if(prefs.getString('data_download')!=null)  data_download=prefs.getString('data_download');
      if(prefs.getString('task_length')!=null) task_length=prefs.getString('task_length');
      if(prefs.getString('required_core')!=null)   required_core=prefs.getString('required_core');
      if(prefs.getString('vm_utilization_on_edge')!=null)   vm_utilization_on_edge=prefs.getString('vm_utilization_on_edge');
      if(prefs.getString('vm_utilization_on_cloud')!=null)   vm_utilization_on_cloud=prefs.getString('vm_utilization_on_cloud');
      if(prefs.getString('vm_utilization_on_mobile')!=null)   vm_utilization_on_mobile=prefs.getString('vm_utilization_on_mobile');
      //////////////////////////
      if(prefs.getString('application_xml')!=null)   application_xml=prefs.getString('application_xml');
    });
  }

  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.blue,
        title: Row(
          children: [
            Padding(
              padding: const EdgeInsets.only(
                left: 270,
              ),
              child: FlatButton(
                height: 20,
                minWidth: 20,
                color: Colors.white,
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
      body: Center(
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(

            children: <Widget>[
              Padding(
                padding: const EdgeInsets.only(
                  top:  10,
                ),
                child: RaisedButton(
                  child: Text("display"),
                  onPressed: (){
                    _getBatteryLevel();
                  },
                ),
              ),
              Text(_batteryLevel),
              SizedBox(
                height: 100,
                child: TextFormField  (
                    controller: application_xml_controller,
                    decoration: InputDecoration(

                      filled:true,
                      enabledBorder: OutlineInputBorder(
                          borderSide: BorderSide(color: Colors.black45,width: 1.0)
                      ),
                      focusedBorder: OutlineInputBorder(
                          borderSide: BorderSide(color: Colors.blue,width: 1.0)
                      ),
                    ),
                    onChanged: (text)async{
                      SharedPreferences prefs = await SharedPreferences.getInstance();
                      prefs.setString('application_xml', application_xml_controller.text);
                    }
                ),
              ),
            ],
          ),

        ),
      ),
    );
  }
}
display(){
  final builder = XmlBuilder();
  builder.processing('xml', 'version="1.0"');
  builder.element('applications', nest: () {
    builder.element('application', nest: () {
      builder.attribute('name', application_name);
      builder.element('usage_percentage', nest: usage_percentage);
      builder.element('prob_cloud_selection', nest: prob_cloud_selection);
      builder.element('poisson_interarrival', nest: poisson_interarrival);
      builder.element('delay_sensitivity', nest: delay_sensitivity);
      builder.element('active_period', nest: active_period);
      builder.element('idle_period', nest: idle_period);
      builder.element('data_upload', nest: data_upload);
      builder.element('data_download', nest: data_download);
      builder.element('task_length', nest: task_length);
      builder.element('required_core', nest: required_core);
      builder.element('vm_utilization_on_edge', nest: vm_utilization_on_edge);
      builder.element('vm_utilization_on_cloud', nest: vm_utilization_on_cloud);
      builder.element('vm_utilization_on_mobile', nest: vm_utilization_on_mobile);
      // builder.text('Growing a Language');
    });
  });
  final bookshelfXml = builder.buildDocument();
  final String xmlDoc = (bookshelfXml.toXmlString(pretty: true, indent: '\t'));
  return xmlDoc;
}
