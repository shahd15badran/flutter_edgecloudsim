

import 'package:flutter_edgecloudsim/services/auth.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:flutter/material.dart';
import 'package:xml/xml.dart';
import 'package:flutter/services.dart';

class AppXML extends StatefulWidget {
  @override
  _State createState() => _State();
}
List <String> application_content=['application name','usage_percentage','prob_cloud_selection','poisson_interarrival','delay_sensitivity','active_period','idle_period','data_upload'
    'data_download','task_length','required_core','vm_utilization_on_edge','vm_utilization_on_cloud',
  'vm_utilization_on_mobile'];

//////////////////////
int counter=1;
int deleteApp;
class _State extends State<AppXML> {
  List <String> application_name=['AUGMENTED_REALITY','HEALTH_APP','HEAVY_COMP_APP','INFOTAINMENT_APP'];
  List <String> usage_percentage=['30','20','20','30'];
  List <String> prob_cloud_selection=['20','20','40','15'];
  List <String> poisson_interarrival=['5','30','60','7'];
  List <String> delay_sensitivity =['0','0','0','0'];
  List <String> active_period =['45','10','60','15'];
  List <String> idle_period=['15','20','60','45'];
  List <String> data_upload=['1500','1250','2500','25'];
  List <String> data_download=['25','20','250','2000'];
  List <String> task_length=['2000','400','3000','750'];
  List <String> required_core=['1','1','1','1'];
  List <String> vm_utilization_on_edge=['20','5','30','10'];
  List <String> vm_utilization_on_cloud=['2','0.5','3','1'];
  List <String> vm_utilization_on_mobile=['0','0','0','1'];


  ///////////////////////
  String application_name1='AUGMENTED_REALITY';
  String usage_percentage1='30';
  String prob_cloud_selection1='20';
  String poisson_interarrival1='5';
  String delay_sensitivity1 ='0';
  String active_period1 ='45';
  String idle_period1='15';
  String data_upload1='1500';
  String data_download1='25';
  String task_length1='2000';
  String required_core1='1';
  String vm_utilization_on_edge1='20';
  String vm_utilization_on_cloud1='2';
  String vm_utilization_on_mobile1='0';
  AuthBase authBase = AuthBase();

  //final application_xml_controller=TextEditingController(text:display());

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

      prefs.setStringList('application_name', application_name);
//////////////////////////////////////////////////////
      if(prefs.getInt('delete_app')!=null) {
        deleteApp=prefs.getInt('delete_app');

        application_name.removeAt(deleteApp);
        usage_percentage.removeAt(deleteApp);
        prob_cloud_selection.removeAt(deleteApp);
        poisson_interarrival.removeAt(deleteApp);
        delay_sensitivity.removeAt(deleteApp);
        active_period.removeAt(deleteApp);
        idle_period.removeAt(deleteApp);
        data_upload.removeAt(deleteApp);
        data_download.removeAt(deleteApp);
        task_length.removeAt(deleteApp);
        required_core.removeAt(deleteApp);
        vm_utilization_on_edge.removeAt(deleteApp);
        vm_utilization_on_cloud.removeAt(deleteApp);
        vm_utilization_on_mobile.removeAt(deleteApp);
      }


      counter=prefs.getInt('counter');
      print("OOOOOOO"+counter.toString());
      if(counter>0) {
          if (((prefs.getStringList('application_name')[counter-1] != null) &&
              (prefs.getString('save_app') == 'true')))
            application_name[counter-1] = prefs.getStringList('application_name')[counter-1];


          else if (((prefs.getStringList('usage_percentage')[counter-1] != null) &&
              (prefs.getString('save_app') == 'true')))
            usage_percentage[counter-1] = prefs.getStringList('usage_percentage')[counter-1];


          else if (((prefs.getStringList('prob_cloud_selection')[counter-1] != null) &&
              (prefs.getString('save_app') == 'true')))
            prob_cloud_selection[counter-1] = prefs.getStringList('prob_cloud_selection')[counter-1];

          else if (((prefs.getStringList('poisson_interarrival')[counter-1][counter-1] != null) &&
              (prefs.getString('save_app') == 'true')))
            poisson_interarrival[counter-1] = prefs.getStringList('poisson_interarrival')[counter-1];


          else if (((prefs.getStringList('delay_sensitivity')[counter-1] != null) &&
              (prefs.getString('save_app') == 'true')))
            delay_sensitivity[counter-1] = prefs.getStringList('delay_sensitivity')[counter-1];


          else if (((prefs.getStringList('active_period')[counter-1] != null) &&
              (prefs.getString('save_app') == 'true')))
            active_period[counter-1] = prefs.getStringList('active_period')[counter-1];


          else if (((prefs.getStringList('idle_period')[counter-1] != null) &&
              (prefs.getString('save_app') == 'true')))
            idle_period[counter-1] = prefs.getStringList('idle_period')[counter-1];


          else if (((prefs.getStringList('data_upload')[counter-1] != null) &&
              (prefs.getString('save_app') == 'true')))
            data_upload[counter-1] = prefs.getStringList('data_upload')[counter-1];


          else if (((prefs.getStringList('data_download')[counter-1] != null) &&
              (prefs.getString('save_app') == 'true')))
            data_download[counter-1] = prefs.getStringList('data_download')[counter-1];



          else if (((prefs.getStringList('task_length')[counter-1] != null) &&
              (prefs.getString('save_app') == 'true')))
            task_length[counter-1] = prefs.getStringList('task_length')[counter-1];


          else if (((prefs.getStringList('required_core')[counter-1] != null) &&
              (prefs.getString('save_app') == 'true')))
            required_core[counter-1] = prefs.getStringList('required_core')[counter-1];


          else if (((prefs.getStringList('vm_utilization_on_edge')[counter-1] != null) &&
              (prefs.getString('save_app') == 'true')))
            vm_utilization_on_edge[counter-1] =
                prefs.getStringList('vm_utilization_on_edge')[counter-1];


          else if (((prefs.getStringList('vm_utilization_on_cloud')[counter-1] != null) &&
              (prefs.getString('save_app') == 'true')))
            vm_utilization_on_cloud[counter-1] =
                prefs.getStringList('vm_utilization_on_cloud')[counter-1];


          else if (((prefs.getStringList('vm_utilization_on_mobile')[counter-1] != null) &&
              (prefs.getString('save_app') == 'true')))
            vm_utilization_on_mobile[counter-1] =
                prefs.getStringList('vm_utilization_on_mobile')[counter-1];


      }
      //////////////////////////



    });

  }

  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            children: <Widget>[
              RaisedButton(
                child: Text("display"),
                onPressed: (){
                  _getBatteryLevel();
                },
              ),
              Text(_batteryLevel),
              //display(),
            ],
          ),

        ),
      ),
    );
  }
  display(){
    final builder = XmlBuilder();
    builder.processing('xml', 'version="1.0"');
    builder.element('applications', nest: () {
      for(int c=0;c<counter;c++) {
        builder.element('application', nest: () {
          builder.attribute('name', application_name[c]);
          builder.element('usage_percentage', nest: usage_percentage[c]);
          builder.element('prob_cloud_selection', nest: prob_cloud_selection[c]);
          builder.element('poisson_interarrival', nest: poisson_interarrival[c]);
          builder.element('delay_sensitivity', nest: delay_sensitivity[c]);
          builder.element('active_period', nest: active_period[c]);
          builder.element('idle_period', nest: idle_period[c]);
          builder.element('data_upload', nest: data_upload[c]);
          builder.element('data_download', nest: data_download[c]);
          builder.element('task_length', nest: task_length[c]);
          builder.element('required_core', nest: required_core[c]);
          builder.element('vm_utilization_on_edge', nest: vm_utilization_on_edge[c]);
          builder.element('vm_utilization_on_cloud', nest: vm_utilization_on_cloud[c]);
          builder.element('vm_utilization_on_mobile', nest: vm_utilization_on_mobile[c]);
          // builder.text('Growing a Language');
        });
      }
    });
    final bookshelfXml = builder.buildDocument();
    final String xmlDoc = (bookshelfXml.toXmlString(pretty: true, indent: '\t'));
    return xmlDoc;
  }

}
