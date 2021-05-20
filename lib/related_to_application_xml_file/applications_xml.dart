
import 'dart:async';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:flutter/material.dart';
import 'package:xml/xml.dart';
import 'package:flutter/services.dart';

class AppXML extends StatefulWidget {
  @override
  _State createState() => _State();
}

int counter=1;
int deleteApp;
class _State extends State<AppXML>with TickerProviderStateMixin  {
  int _state = 0;
  List <String> application_name;
  List <String> usage_percentage;
  List <String> prob_cloud_selection;
  List <String> poisson_interarrival;
  List <String> delay_sensitivity;
  List <String> active_period;

  List <String> idle_period;
  List <String> data_upload;
  List <String> data_download;
  List <String> task_length;
  List <String> required_core;
  List <String> vm_utilization_on_edge;
  List <String> vm_utilization_on_cloud;
  List <String> vm_utilization_on_mobile;
  ///////////////////////
  var xml_controller=TextEditingController();

  //final application_xml_controller=TextEditingController(text:display());

  static const Platform =const MethodChannel("com.flutter.epic/epic");

  String _batteryLevel2='';
  Future<void> _getBatteryLevel2() async {
    String batteryLevel2;
    try {
      SharedPreferences prefs = await SharedPreferences.getInstance();
      String user_id = prefs.getString('user_id'); print(user_id);
      prefs.setString('ManuallygetAppXML', _batteryLevel2);
      //final String result = await Platform.invokeMethod('getAppXML', [user_id,_batteryLevel2]);
      //batteryLevel2 = ' $result  ';
    } on PlatformException catch (e) {
      print(e);
    }

    setState(() {
      _batteryLevel2 = batteryLevel2;
    });
  }
  @override
  void initState (){
    //getData();
    String x;
    display().then((val) {
      x = val;
      xml_controller.text= x;
    });
  }


  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        iconTheme: IconThemeData(
          color:Colors.black,
        ),
        backgroundColor: Colors.white,
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
              ),
            ),
          ],
        ),
      ),

      body: Center(
        child: SingleChildScrollView(
          child: Container(
            child: Column(
              children: <Widget>[
                Padding(
                  padding: const EdgeInsets.only(
                  ),
                  child:Container(
                    height: 495,
                    child: SingleChildScrollView(
                      child: TextField(
                        maxLines: null,
                          controller: xml_controller,
                          decoration: InputDecoration(
                            //contentPadding: new EdgeInsets.symmetric(vertical: 200.0,horizontal: 10.0),
                            contentPadding: EdgeInsets.all(1.0),
                            fillColor: Colors.white,
                            filled:true,
                            enabledBorder: OutlineInputBorder(
                                borderSide: BorderSide(color: Colors.black45,width: 1.0)
                            ),
                          ),
                      ),
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(
                      bottom: 2
                  ),
                  child: Row(
                    children: [
                      Padding(
                        padding: const EdgeInsets.only(
                          top: 10,
                          left: 150,
                        ),
                        child: SizedBox(
                          height: 30,
                          width: 90,
                          child: new MaterialButton(
                            color: Colors.yellow,
                            child: setUpButtonChild(),
                            onPressed: ()async{
                              setState(() {
                                if (_state == 0) {
                                  animateButton();
                                  _batteryLevel2=xml_controller.text;
                                  _getBatteryLevel2();
                                }
                              });
                            },
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
  Widget setUpButtonChild() {
    if (_state == 0) {
      return new Text('Save',
        style: const TextStyle(
          color: Colors.black,
          fontSize: 16.0,
        ),
      );
    } else if (_state == 1) {
      return CircularProgressIndicator(
        valueColor: AlwaysStoppedAnimation<Color>(Colors.black),
      );
    } else {
      return Icon(Icons.check, color: Colors.black);
    }
  }

  void animateButton() {
    setState(() {
      _state = 1;
    });

    Timer(Duration(milliseconds: 1000), () {
      setState(() {
        _state = 2;
      });
      // Navigator.of(context).pushNamed('MyFileList');
    });
  }

  display() async{

    SharedPreferences prefs = await SharedPreferences.getInstance();

    application_name= prefs.getStringList('application_name');
    usage_percentage=prefs.getStringList('usage_percentage');
    prob_cloud_selection=prefs.getStringList('prob_cloud_selection');
    poisson_interarrival=prefs.getStringList('poisson_interarrival');
    delay_sensitivity =prefs.getStringList('delay_sensitivity');
    active_period =prefs.getStringList('active_period');
    idle_period = prefs.getStringList('idle_period');
    data_upload =prefs.getStringList('data_upload');
    data_download=prefs.getStringList ('data_download');
    task_length= prefs.getStringList('task_length');
    required_core=prefs.getStringList ('required_core');
    vm_utilization_on_edge= prefs.getStringList('vm_utilization_on_edge');
    vm_utilization_on_cloud=prefs.getStringList ('vm_utilization_on_cloud');
    vm_utilization_on_mobile=prefs.getStringList ('vm_utilization_on_mobile');
    print('getting lists done');

    print("jj");
    final builder = XmlBuilder();
    builder.processing('xml', 'version="1.0"');
    builder.element('applications', nest: () {
      for(int c=0;c<4;c++) {
       // print('cccccccccccc'+c.toString());
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
    //print(xmlDoc);
    return xmlDoc;
  }

}
