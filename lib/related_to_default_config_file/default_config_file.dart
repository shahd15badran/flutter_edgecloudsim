import 'dart:async';

import 'package:flutter/services.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:flutter/material.dart';
import 'package:xml/xml.dart';

class DefaultConfig extends StatefulWidget {
  @override
  _State createState() => _State();
}

class _State extends State<DefaultConfig>with TickerProviderStateMixin {
  int _state = 0;
  static const Platform =const MethodChannel("com.flutter.epic/epic");
  String _batteryLevel = 'Unknown battery level.';

  String _batteryLevel2='';
  Future<void> _getBatteryLevel2() async {
    String batteryLevel2;
    try {
      SharedPreferences prefs = await SharedPreferences.getInstance();
      String user_id = prefs.getString('user_id');print(user_id);
      prefs.setString('ManuallygetDefaultConfigFile', _batteryLevel2);
      //final String result = await Platform.invokeMethod('getDefaultConfigFile', [user_id,_batteryLevel2]);
      //batteryLevel2 = ' $result  ';
    } on PlatformException catch (e) {
      print(e);
    }

    setState(() {
      _batteryLevel2 = batteryLevel2;
    });
  }


  @override
 String concatenate ='';
  var xml_controller=TextEditingController();


  void initState (){
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
  display()async{
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
    SharedPreferences prefs = await SharedPreferences.getInstance();

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
    arr[25] = prefs.getString('simulation_scenarios');
    arr[26] = prefs.getString('attractiveness_L1_mean_waiting_time');
    arr[27] = prefs.getString('attractiveness_L2_mean_waiting_time');
    arr[28] = prefs.getString('attractiveness_L3_mean_waiting_time');

    for(int l=0;l<data.length;l++) {
      concatenate += "\n"+data[l]+"="+arr[l];
    }
    return concatenate;
  }
}

