import 'dart:async';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_edgecloudsim/services/auth.dart';
import 'package:flutter_edgecloudsim/widgets/original_button.dart';
import 'package:flutter_local_notifications/flutter_local_notifications.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:xml/xml.dart';

class SimulationScreen extends StatefulWidget {
  @override
  _SimulationScreenState createState() => _SimulationScreenState();
}

class _SimulationScreenState extends State<SimulationScreen> with TickerProviderStateMixin{
  int _state = 0;
  final Msg_controller=TextEditingController(text:"");
  int _stateM = 0;
  static const Platform = const MethodChannel("com.flutter.epic/epic");
  var simRes = '';
  Future<String> _getBatteryLevel() async {
    try {
      final String result = await Platform.invokeMethod("Start Sim");

    } on PlatformException catch (e) {
      print(e);
    } finally {
      setState(() {
      });
    }
  }
  String _logs = '';
  Future<void> _getlogs() async {
    String batteryLevel;
    try {
      final String result = await Platform.invokeMethod('get log file');
      batteryLevel = ' $result  ';
    } on PlatformException catch (e) {
      print(e);
    }
    setState(() {
      _logs = batteryLevel;
    });
  }

  SharedPreferences prefs;
  Future<void> _sendAppXML() async {
    prefs = await SharedPreferences.getInstance();
    try {
      final String result = await Platform.invokeMethod('getAppXML',display_applications());
    } on PlatformException catch (e) {
      print(e);
    }
  }

  Future<void> _sendConfigPROP() async {
    prefs = await SharedPreferences.getInstance();
    try {
      final String result = await Platform.invokeMethod('getDefaultConfigFile',display_Configs());
    } on PlatformException catch (e) {
      print(e);
    }
  }

  Future<void> _sendEdgeXML() async {
    prefs = await SharedPreferences.getInstance();
    try {
      final String result = await Platform.invokeMethod('getEdgeDeviceXML',display_Edges());
    } on PlatformException catch (e) {
      print(e);
    }
  }
  //FlutterLocalNotificationsPlugin flutterLocalNotificationsPlugin;
  @override
  void initState(){
    getData();
    _sendAppXML();
    _sendEdgeXML();
    _sendConfigPROP();
    super.initState();
    //await prefs.init();

    //send configuration files to server

  }

  AuthBase authBase = AuthBase();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        iconTheme: IconThemeData(
          color: Colors.black,
        ),
        backgroundColor: Colors.white,
        title: Row(
          children: [
            Padding(padding: const EdgeInsets.only(
              // left: 30,
            ),
              child: Text('Run Simulator', style: TextStyle(
                fontSize: 18,
                color: Colors.black,
                fontWeight: FontWeight.w600,
              ),),
            ),
            Padding(
              padding: const EdgeInsets.only(
                left: 110,
              ),
              child: Padding(
                padding: const EdgeInsets.only(
                    left: 40
                ),
                child: FlatButton(
                  height: 20,
                  minWidth: 20,
                  color: Colors.white,
                  onPressed: () async {
                    await authBase.logout();
                    Navigator.of(context).pushReplacementNamed('login');
                  },
                  child: Row(
                    children: <Widget>[
                      Icon(Icons.logout, color: Colors.black, size: 20),
                    ],
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
      body: Container(
        color: Colors.white,
        child: Padding(
          padding: const EdgeInsets.only(
            top: 80,
            bottom: 10,
          ),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: <Widget>[

              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 20),
                child: SizedBox(
                  width: 250,
                  child: OriginalButton(
                    text: 'Start Simulation',
                    color: Colors.blue,
                    textColor: Colors.white,
                    onPressed: () {
                      _getBatteryLevel();

                      setState(() {
                        if (_stateM == 0) {
                          animateButtonM();
                        }
                      });
                    },
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(
                  top:20
                ),
                child: SizedBox(
                  width: 250,
                  child: setUpMsgChild()
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(
                  right: 20,
                  left: 20
                ),
                child:Container(
                  color: Colors.white,
                  height: 200,
                  width: double.infinity,
                  child: SingleChildScrollView(
                    child: TextField(
                      maxLines: null,
                      enabled: false,
                      controller: Msg_controller,
                      decoration: InputDecoration(
                        fillColor: Colors.white,
                        filled: true,
                        border: InputBorder.none,
                        hintText: "         Click on the check icon when it appears!",
                      ),
                    ),
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(
                ),
                child: SizedBox(
                  width: 250,
                  child: new MaterialButton(
                    child: setUpButtonChild('Download Log Files'),
                    onPressed: () async{
                      _getlogs();
                      setState(() {
                        if (_state == 0) {
                          animateButton();
                        }
                      });
                      //Navigator.of(context).pushNamed('MyFileList');
                    },
                    elevation: 4.0,
                    minWidth:250.0,
                    height: 55.0,
                    color: Colors.black,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(15),
                    ),
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(
                  top: 10,
                  bottom: 150,
                ),
                child: SizedBox(
                  width: 250,
                  child: OriginalButton(
                    text: 'Apply Matlab Functions',
                    color: Colors.black,
                    textColor: Colors.white,
                    onPressed: () async {
                      Navigator.of(context).pushNamed('matlab screen');
                    },
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
  Widget setUpButtonChild(String name) {
    if (_state == 0) {
      return new Text(
        name,
        style: const TextStyle(
          color: Colors.white,
          fontSize: 16.0,
        ),
      );
    } else if (_state == 1) {
      return CircularProgressIndicator(
        valueColor: AlwaysStoppedAnimation<Color>(Colors.white),
      );
    } else {
      return Icon(Icons.check, color: Colors.white);
    }
  }

  void animateButton() {
    setState(() {
      _state = 1;
    });

    Timer(Duration(milliseconds: 2000), () {
      setState(() {
        _state = 2;
      });
      Navigator.of(context).pushNamed('MyFileList');
    });
  }
  Widget setUpMsgChild() {
    if (_stateM == 0) {
      return new Text(
        "Not yet",
        style: const TextStyle(
          color: Colors.white,
          fontSize: 16.0,
        ),
      );
    } else if (_stateM == 1) {
      return LinearProgressIndicator(
        valueColor: AlwaysStoppedAnimation<Color>(Colors.blueGrey),
      );
    } else {
      //print("hhhhhhhhhhhhhhhh" + simRes);
      return InkWell(
        splashColor: Colors.blue, // splash color
        onTap: ()async {
          try {
            final String result = await Platform.invokeMethod("getMsg");
            simRes = ' $result';
            print('on tap ' + simRes);
            Msg_controller.text=simRes;
          } on PlatformException catch (e) {
            print(e);
          }
        }, // button pressed
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Icon(Icons.check_circle_outline),
          ],
        ),
      );
    }
  }

  void animateButtonM() {
    setState(() {
      _stateM = 1;
    });

    Timer(Duration(milliseconds: 20000), () {
      setState(() {
        _stateM = 2;
      });
    });
  }

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


  getData() async {
    //prefs = await SharedPreferences.getInstance();
    //print('in simulation_screen: application name: ');
    //print(prefs.getStringList('application_name')[0]);
  }

  display_applications(){
    final builder = XmlBuilder();
    builder.processing('xml', 'version="1.0"');
    builder.element('applications', nest: () {
      for(int c=0;c<4;c++) {
        print('cccccccccccc'+c.toString());
        builder.element('application', nest: () {
          print('INSIDE simulation_screen: application name: ');
          print(prefs.getStringList('application_name')[0]);
          builder.attribute('name', prefs.getStringList('application_name')[c]);
          builder.element('usage_percentage', nest: prefs.getStringList('usage_percentage')[c]);
          builder.element('prob_cloud_selection', nest: prefs.getStringList('prob_cloud_selection')[c]);
          builder.element('poisson_interarrival', nest: prefs.getStringList('poisson_interarrival')[c]);
          builder.element('delay_sensitivity', nest: prefs.getStringList('delay_sensitivity')[c]);
          builder.element('active_period', nest: prefs.getStringList('active_period')[c]);
          builder.element('idle_period', nest: prefs.getStringList('idle_period')[c]);
          builder.element('data_upload', nest: prefs.getStringList('data_upload')[c]);
          builder.element('data_download', nest: prefs.getStringList('data_download')[c]);
          builder.element('task_length', nest: prefs.getStringList('task_length')[c]);
          builder.element('required_core', nest: prefs.getStringList('required_core')[c]);
          builder.element('vm_utilization_on_edge', nest: prefs.getStringList('vm_utilization_on_edge')[c]);
          builder.element('vm_utilization_on_cloud', nest: prefs.getStringList('vm_utilization_on_cloud')[c]);
          builder.element('vm_utilization_on_mobile', nest: prefs.getStringList('vm_utilization_on_mobile')[c]);
          // builder.text('Growing a Language');
        });
      }
    });
    final bookshelfXml = builder.buildDocument();
    final String xmlDoc = (bookshelfXml.toXmlString(pretty: true, indent: '\t'));
    print(xmlDoc);
    return xmlDoc;
  }

  display_Edges(){
    final builder = XmlBuilder();
    builder.processing('xml', 'version="1.0"');
    builder.element('edge_devices', nest: () {
      for(int c=0;c<8;c++) {
        builder.element('datacenter', nest: () {
          builder.attribute('arch', 'x86');
          builder.attribute('os', 'Linux');
          builder.attribute('vmm', 'Xen');

          builder.element('costPerBw', nest: prefs.getStringList('costPerBw')[c]);
          builder.element('costPerSec', nest: prefs.getStringList('costPerSec')[c]);
          builder.element('costPerMem', nest: prefs.getStringList('costPerMem')[c]);
          builder.element('costPerStorage', nest: prefs.getStringList('costPerStorage')[c]);

          builder.element('location', nest: () {
            builder.element('x_pos', nest: prefs.getStringList('x_pos')[c]);
            builder.element('y_pos', nest: prefs.getStringList('y_pos')[c]);
            builder.element('wlan_id', nest: prefs.getStringList('wlan_id')[c]);
            builder.element('attractiveness', nest:prefs.getStringList('attractiveness')[c]);
          });
          builder.element('hosts', nest: () {
            builder.element('host', nest: () {
              builder.element('core', nest: prefs.getStringList('core')[c]);
              builder.element('mips', nest: prefs.getStringList('mips')[c]);
              builder.element('ram', nest: prefs.getStringList('ram')[c]);
              builder.element('storage', nest: prefs.getStringList('storage')[c]);
              builder.element('VMs', nest: () {
                builder.element('VM', nest: () {
                  builder.attribute('vmm', 'Xen');
                  builder.element('core', nest: prefs.getStringList('core1')[c]);
                  builder.element('mips', nest: prefs.getStringList('mips1')[c]);
                  builder.element('ram', nest: prefs.getStringList('ram1')[c]);
                  builder.element('storage', nest: prefs.getStringList('storage1')[c]);
                });
                builder.element('VM', nest: () {
                  builder.attribute('vmm', 'Xen');
                  builder.element('core', nest: prefs.getStringList('core2')[c]);
                  builder.element('mips', nest: prefs.getStringList('mips2')[c]);
                  builder.element('ram', nest: prefs.getStringList('ram2')[c]);
                  builder.element('storage', nest: prefs.getStringList('storage2')[c]);
                });
              });
            });
          });
          // builder.text('Growing a Language');
        });
      }
    });
    final bookshelfXml = builder.buildDocument();
    final String xmlDoc = (bookshelfXml.toXmlString(pretty: true, indent: '\t'));
    return xmlDoc;
  }

  display_Configs(){
    String concatenate = '';
    List <String> data=['simulation_time','warm_up_period','vm_load_check_interval',
      'location_check_interval','file_log_enabled','deep_file_log_enabled',
          'min_number_of_mobile_devices','max_number_of_mobile_devices','mobile_device_counter_size',
      'wan_propagation_delay','lan_internal_delay','wlan_bandwidth','wan_bandwidth','gsm_bandwidth',
      'number_of_host_on_cloud_datacenter','number_of_vm_on_cloud_host','core_for_cloud_vm',
      'mips_for_cloud_vm','ram_for_cloud_vm','storage_for_cloud_vm','core_for_mobile_vm',
      'mips_for_mobile_vm','ram_for_mobile_vm','storage_for_mobile_vm','orchestrator_policies',
      'simulation_scenarios','attractiveness_L1_mean_waiting_time','attractiveness_L2_mean_waiting_time',
      'attractiveness_L3_mean_waiting_time'];
    //31 items

    var arr = new List(35);
    arr[0] = prefs.getString('simulation_time');
    arr[1] = prefs.getString('warm_up_period');
    arr[2] = prefs.getString('vm_load_check_interval');
    arr[3] = prefs.getString('location_check_interval');
    arr[4] = prefs.getString('file_log_enabled');
    arr[5] = prefs.getString('deep_file_log_enabled');

    arr[6] = prefs.getString('min_number_of_mobile_devices');
    arr[7] = prefs.getString('max_number_of_mobile_devices');
    arr[8] = prefs.getString('mobile_device_counter_size');

    arr[9] = prefs.getString('wan_propagation_delay');
    arr[10] = prefs.getString('lan_internal_delay');
    arr[11] = prefs.getString('wlan_bandwidth');
    arr[12] = prefs.getString('wan_bandwidth');
    arr[13] = prefs.getString('gsm_bandwidth');

    arr[14] = prefs.getString('number_of_host_on_cloud_datacenter');
    arr[15] = prefs.getString('number_of_vm_on_cloud_host');
    arr[16] = prefs.getString('core_for_cloud_vm');
    arr[17] = prefs.getString('mips_for_cloud_vm');
    arr[18] = prefs.getString('ram_for_cloud_vm');
    arr[19] = prefs.getString('storage_for_cloud_vm');

    arr[20] = prefs.getString('core_for_mobile_vm');
    arr[21] = prefs.getString('mips_for_mobile_vm');
    arr[22] = prefs.getString('ram_for_mobile_vm');
    arr[23] = prefs.getString('storage_for_mobile_vm');

    arr[24] = prefs.getString('orchestrator_policies');
    arr[25] = prefs.getString('simulation_scenarios1')+','+prefs.getString('simulation_scenarios2')+','+prefs.getString('simulation_scenarios3');
    arr[26] = prefs.getString('attractiveness_L1_mean_waiting_time');
    arr[27] = prefs.getString('attractiveness_L2_mean_waiting_time');
    arr[28] = prefs.getString('attractiveness_L3_mean_waiting_time');
    //arr[29] ="#default config file";
    // arr[30] ="#all the host on cloud runs on a single datacenter";
    //arr[31] ="#mobile devices has no processing unit in this scenario";
    //arr[32]="#use ',' for multiple values";
    // arr[33]="#use ',' for multiple values";
    // arr[34]="#mean waiting time in seconds";
    for(int l=0;l<data.length;l++) {
      concatenate += "\n"+data[l]+"="+arr[l];
    }
    return concatenate;
  }
}