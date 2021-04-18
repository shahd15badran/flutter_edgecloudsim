import 'package:shared_preferences/shared_preferences.dart';
import 'package:flutter/material.dart';
import 'package:xml/xml.dart';

class DefaultConfig extends StatefulWidget {
  @override
  _State createState() => _State();
}

class _State extends State<DefaultConfig> {
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
    display(){
      final builder = XmlBuilder();
      builder.processing('xml', 'version="1.0"');
      builder.element('edge_devices', nest: () {
        builder.element('datacenter', nest: () {
          builder.attribute('arch', 'x86');
          builder.attribute('os', 'Linux');
          builder.attribute('vmm', 'Xen');
        });
      });
      final bookshelfXml = builder.buildDocument();

      return Text(bookshelfXml.toXmlString(pretty: true, indent: '\t'));
    }
    return Scaffold(
      body: Center(
        child: display(),
      ),
    );
  }
}
