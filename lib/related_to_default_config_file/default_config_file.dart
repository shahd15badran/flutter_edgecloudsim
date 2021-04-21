import 'package:flutter/services.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:flutter/material.dart';
import 'package:xml/xml.dart';

class DefaultConfig extends StatefulWidget {
  @override
  _State createState() => _State();
}

class _State extends State<DefaultConfig> {
  static const Platform =const MethodChannel("com.flutter.epic/epic");
  String _batteryLevel = 'Unknown battery level.';
  Future<void> _getBatteryLevel() async {
    String batteryLevel;
    try {
      final String result = await Platform.invokeMethod('getDefaultConfigFile', display());
      batteryLevel = 'Battery level at $result  .';
    } on PlatformException catch (e) {
      print(e);
    }

    setState(() {
      _batteryLevel = batteryLevel;
    });
  }
  @override
  String simulation_time="30";
  String warm_up_period="3";
  String vm_load_check_interval="0.1";
  String location_check_interval="0.1";
  String file_log_enabled ="true";
  String deep_file_log_enabled ="false";

  String min_number_of_mobile_devices="100";
  String max_number_of_mobile_devices="1000";
  String mobile_device_counter_size="100";

  //////////////////////////
  String wan_propagation_delay="0.1";
  String lan_internal_delay="0.005";
  String wlan_bandwidth="200";
  String wan_bandwidth="15";
  String gsm_bandwidth="0";
  //////////////////////////
  String number_of_host_on_cloud_datacenter="1";
  String number_of_vm_on_cloud_host="4";
  String core_for_cloud_vm="4";
  String mips_for_cloud_vm="10000";
  String ram_for_cloud_vm="32000";
  String storage_for_cloud_vm="1000000";
  ///////////////////////////
  String core_for_mobile_vm="0";
  String mips_for_mobile_vm="0";
  String ram_for_mobile_vm="0";
  String storage_for_mobile_vm="0";

  String orchestrator_policies="NEXT_FIT";

  String simulation_scenarios1="SINGLE_TIER";
  String simulation_scenarios2="TWO_TIER";
  String simulation_scenarios3="TWO_TIER_WITH_EO";

  String attractiveness_L1_mean_waiting_time="500";
  String attractiveness_L2_mean_waiting_time="300";
  String attractiveness_L3_mean_waiting_time="120";


  void initState (){
    getData();
  }
  getData() async{
    SharedPreferences prefs = await SharedPreferences.getInstance();
    setState((){
      if(prefs.getString('simulation_time')!=null)  simulation_time=prefs.getString('simulation_time');
      if(prefs.getString('warm_up_period')!=null)   warm_up_period=prefs.getString('warm_up_period');
      if(prefs.getString('vm_load_check_interval')!=null)  vm_load_check_interval=prefs.getString('vm_load_check_interval');
      if(prefs.getString('location_check_interval')!=null) location_check_interval=prefs.getString('location_check_interval');
      if(prefs.getString('file_log_enabled')!=null)   file_log_enabled=prefs.getString('file_log_enabled');
      if(prefs.getString('deep_file_log_enabled')!=null)   deep_file_log_enabled=prefs.getString('deep_file_log_enabled');

      if(prefs.getString('min_number_of_mobile_devices')!=null)  min_number_of_mobile_devices=prefs.getString('min_number_of_mobile_devices');
      if(prefs.getString('max_number_of_mobile_devices')!=null)   max_number_of_mobile_devices=prefs.getString('max_number_of_mobile_devices');
      if(prefs.getString('mobile_device_counter_size')!=null)  mobile_device_counter_size=prefs.getString('mobile_device_counter_size');
      ////////////////
      if(prefs.getString('wan_propagation_delay')!=null) wan_propagation_delay=prefs.getString('wan_propagation_delay');
      if(prefs.getString('lan_internal_delay')!=null)   lan_internal_delay=prefs.getString('lan_internal_delay');
      if(prefs.getString('wlan_bandwidth')!=null)   wlan_bandwidth=prefs.getString('wlan_bandwidth');
      if(prefs.getString('wan_bandwidth')!=null)  wan_bandwidth=prefs.getString('wan_bandwidth');
      if(prefs.getString('gsm_bandwidth')!=null) gsm_bandwidth=prefs.getString('gsm_bandwidth');
      /////////////////
      if(prefs.getString('number_of_host_on_cloud_datacenter')!=null)   number_of_host_on_cloud_datacenter=prefs.getString('number_of_host_on_cloud_datacenter');
      if(prefs.getString('number_of_vm_on_cloud_host')!=null)   number_of_vm_on_cloud_host=prefs.getString('number_of_vm_on_cloud_host');
      if(prefs.getString('core_for_cloud_vm')!=null)  core_for_cloud_vm=prefs.getString('core_for_cloud_vm');
      if(prefs.getString('mips_for_cloud_vm')!=null) mips_for_cloud_vm=prefs.getString('mips_for_cloud_vm');
      if(prefs.getString('ram_for_cloud_vm')!=null)   ram_for_cloud_vm=prefs.getString('ram_for_cloud_vm');
      if(prefs.getString('storage_for_cloud_vm')!=null)   storage_for_cloud_vm=prefs.getString('storage_for_cloud_vm');
      ////////////////
      if(prefs.getString('core_for_mobile_vm')!=null)   core_for_mobile_vm=prefs.getString('core_for_mobile_vm');
      if(prefs.getString('mips_for_mobile_vm')!=null)   mips_for_mobile_vm=prefs.getString('mips_for_mobile_vm');
      if(prefs.getString('ram_for_mobile_vm')!=null)  ram_for_mobile_vm=prefs.getString('ram_for_mobile_vm');
      if(prefs.getString('storage_for_mobile_vm')!=null) storage_for_mobile_vm=prefs.getString('storage_for_mobile_vm');

      if(prefs.getString('orchestrator_policies')!=null)   orchestrator_policies=prefs.getString('orchestrator_policies');
      if(prefs.getString('simulation_scenarios1')!=null)   simulation_scenarios1=prefs.getString('simulation_scenarios1');
      if(prefs.getString('simulation_scenarios2')!=null)  simulation_scenarios2=prefs.getString('simulation_scenarios2');
      if(prefs.getString('simulation_scenarios3')!=null) simulation_scenarios3=prefs.getString('simulation_scenarios3');

      if(prefs.getString('attractiveness_L1_mean_waiting_time')!=null)   attractiveness_L1_mean_waiting_time=prefs.getString('attractiveness_L1_mean_waiting_time');
      if(prefs.getString('attractiveness_L2_mean_waiting_time')!=null)   attractiveness_L2_mean_waiting_time=prefs.getString('attractiveness_L2_mean_waiting_time');
      if(prefs.getString('attractiveness_L3_mean_waiting_time')!=null)  attractiveness_L3_mean_waiting_time=prefs.getString('attractiveness_L3_mean_waiting_time');
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
    //31 items
    var arr = new List(35);
    arr[0] = simulation_time;
    arr[1] = warm_up_period;
    arr[2] = vm_load_check_interval;
    arr[3] = location_check_interval;
    arr[4] = file_log_enabled;
    arr[5] = deep_file_log_enabled;
    arr[6] = min_number_of_mobile_devices;
    arr[7] = max_number_of_mobile_devices;
    arr[8] = mobile_device_counter_size;
    arr[9] = wan_propagation_delay;
    arr[10] = lan_internal_delay;
    arr[11] = wlan_bandwidth;
    arr[12] = wan_bandwidth;
    arr[13] = gsm_bandwidth;
    arr[14] = number_of_host_on_cloud_datacenter;
    arr[15] = number_of_vm_on_cloud_host;
    arr[16] = core_for_cloud_vm;
    arr[17] = mips_for_cloud_vm;
    arr[18] = ram_for_cloud_vm;
    arr[19] = storage_for_cloud_vm;
    arr[20] = core_for_mobile_vm;
    arr[21] = mips_for_mobile_vm;
    arr[22] = ram_for_mobile_vm;
    arr[23] = storage_for_mobile_vm;
    arr[24] = orchestrator_policies;
    arr[25] = simulation_scenarios1+','+simulation_scenarios2+','+simulation_scenarios3;
    arr[26] = attractiveness_L1_mean_waiting_time;
    arr[27] = attractiveness_L2_mean_waiting_time;
    arr[28] = attractiveness_L3_mean_waiting_time;
    arr[29] ="#default config file";
    arr[30] ="#all the host on cloud runs on a single datacenter";
    arr[31] ="#mobile devices has no processing unit in this scenario";
    arr[32]="#use ',' for multiple values";
    arr[33]="#use ',' for multiple values";
    arr[34]="#mean waiting time in seconds";

    return arr;
  }
}

