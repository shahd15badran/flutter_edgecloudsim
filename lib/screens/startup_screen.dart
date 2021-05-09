import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_edgecloudsim/services/auth.dart';
import 'package:flutter_edgecloudsim/widgets/NavDrawer.dart';
import 'package:shared_preferences/shared_preferences.dart';

class StartupScreen extends StatefulWidget {
  @override
  _StartupScreenState createState() => _StartupScreenState();
}

class _StartupScreenState extends State<StartupScreen> {
  AuthBase authBase = AuthBase();

  void initState (){
    getData();
  }
  getData() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    //applications
    List <String> application_name=['AUGMENTED','HEALTH_APP','HEAVY_COMP_APP','INFOTAINMENT_APP'];
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

    //edgeDevices
    List<String>costPerBw=['0.1','0.1','0.1','0.1','0.1','0.1','0.1','0.1','0.1','0.1','0.1','0.1','0.1','0.1'];
    List<String>costPerSec=['3.0','3.0','3.0','3.0','3.0','3.0','3.0','3.0','3.0','3.0','3.0','3.0','3.0','3.0'];
    List<String>costPerMem=['0.05','0.05','0.05','0.05','0.05','0.05','0.05','0.05','0.05','0.05','0.05','0.05','0.05','0.05'];
    List<String>costPerStorage=['0.1','0.1','0.1','0.1','0.1','0.1','0.1','0.1','0.1','0.1','0.1','0.1','0.1','0.1'];
    List<String>x_pos=['1','2','3','4','5','6','7','8','9','10','11','12','13','14'];
    List<String>y_pos=['1','2','3','4','5','6','7','8','9','10','11','12','13','14'];
    List<String>wlan_id=['0','1','2','3','4','5','6','7','8','9','10','11','12','13'];
    List<String>attractiveness=['0','0','1','1','1','1','2','2','2','2','2','2','2','2'];
    List<String>core=['8','8','8','8','8','8','8','8','8','8','8','8','8','8'];
    List<String>mips=['4000','4000','4000','4000','4000','4000','4000','4000','4000','4000','4000','4000','4000','4000'];
    List<String>ram=['8000','8000','8000','8000','8000','8000','8000','8000','8000','8000','8000','8000','8000','8000'];
    List<String>storage=['200000','200000','200000','200000','200000','200000','200000','200000','200000','200000','200000','200000','200000','200000'];
    List<String>core1=['2','2','2','2','2','2','2','2','2','2','2','2','2','2'];
    List<String>mips1=['1000','1000','1000','1000','1000','1000','1000','1000','1000','1000','1000','1000','1000','1000'];
    List<String>ram1=['2000','2000','2000','2000','2000','2000','2000','2000','2000','2000','2000','2000','2000','2000'];
    List<String>storage1=['50000','50000','50000','50000','50000','50000','50000','50000','50000','50000','50000','50000','50000','50000'];
    List<String>core2=['2','2','2','2','2','2','2','2','2','2','2','2','2','2'];
    List<String>mips2=['1000','1000','1000','1000','1000','1000','1000','1000','1000','1000','1000','1000','1000','1000'];
    List<String>ram2=['2000','2000','2000','2000','2000','2000','2000','2000','2000','2000','2000','2000','2000','2000'];
    List<String>storage2=['50000','50000','50000','50000','50000','50000','50000','50000','50000','50000','50000','50000','50000','50000'];

    //configs

    setState((){
      prefs.setString('simulation_time',"30");
      prefs.setString('warm_up_period',"3");
      prefs.setString('vm_load_check_interval',"0.1");
      prefs.setString('location_check_interval',"0.1");
      prefs.setString('file_log_enabled',"true");
      prefs.setString('deep_file_log_enabled',"false");

      prefs.setString('min_number_of_mobile_devices',"100");
      prefs.setString('max_number_of_mobile_devices',"1000");
      prefs.setString('mobile_device_counter_size',"100");

      prefs.setString('wan_propagation_delay',"0.1");
      prefs.setString('lan_internal_delay',"0.005");
      prefs.setString('wlan_bandwidth',"200");
      prefs.setString('wan_bandwidth',"15");
      prefs.setString('gsm_bandwidth',"0");

      prefs.setString('number_of_host_on_cloud_datacenter',"1");
      prefs.setString('number_of_vm_on_cloud_host',"4");
      prefs.setString('core_for_cloud_vm',"4");
      prefs.setString('mips_for_cloud_vm',"10000");
      prefs.setString('ram_for_cloud_vm',"32000");
      prefs.setString('storage_for_cloud_vm',"1000000");

      prefs.setString('core_for_mobile_vm',"0");
      prefs.setString('mips_for_mobile_vm',"0");
      prefs.setString('ram_for_mobile_vm',"0");
      prefs.setString('storage_for_mobile_vm',"0");

      prefs.setString('orchestrator_policies',"NEXT_FIT");
      prefs.setString('simulation_scenarios',"SINGLE_TIER,TWO_TIER,TWO_TIER_WITH_EO");

      prefs.setString('attractiveness_L1_mean_waiting_time',"500");
      prefs.setString('attractiveness_L2_mean_waiting_time',"300");
      prefs.setString('attractiveness_L3_mean_waiting_time',"120");

      prefs.setStringList('costPerBw', costPerBw);
      prefs.setStringList('costPerSec', costPerSec);
      prefs.setStringList('costPerMem', costPerMem);
      prefs.setStringList('costPerStorage', costPerStorage);
      prefs.setStringList('x_pos', x_pos);
      prefs.setStringList('y_pos', y_pos);
      prefs.setStringList('wlan_id', wlan_id);
      prefs.setStringList('attractiveness', attractiveness);
      prefs.setStringList('core', core);
      prefs.setStringList('mips', mips);
      prefs.setStringList('ram', ram);
      prefs.setStringList('storage', storage);
      prefs.setStringList('core1', core1);
      prefs.setStringList('mips1', mips1);
      prefs.setStringList('ram1', ram1);
      prefs.setStringList('storage1', storage1);
      prefs.setStringList('core2', core2);
      prefs.setStringList('mips2', mips2);
      prefs.setStringList('ram2', ram2);
      prefs.setStringList('storage2', storage2);

      prefs.setStringList('application_name', application_name);
      prefs.setStringList('usage_percentage', usage_percentage);
      prefs.setStringList('prob_cloud_selection', prob_cloud_selection);
      prefs.setStringList('poisson_interarrival', poisson_interarrival);
      prefs.setStringList('delay_sensitivity', delay_sensitivity);
      prefs.setStringList('active_period', active_period);
      prefs.setStringList('idle_period', idle_period);
      prefs.setStringList('data_upload', data_upload);
      prefs.setStringList('data_download', data_download);
      prefs.setStringList('task_length', task_length);
      prefs.setStringList('required_core', required_core);
      prefs.setStringList('vm_utilization_on_edge', vm_utilization_on_edge);
      prefs.setStringList('vm_utilization_on_cloud', vm_utilization_on_cloud);
      prefs.setStringList('vm_utilization_on_mobile', vm_utilization_on_mobile);


    });
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      drawer: NavDrawer(),
      appBar: AppBar(
        iconTheme: IconThemeData(
          color:Color(0xA3131212),
        ),
        backgroundColor: Colors.white,
      ),
      body: SingleChildScrollView(
        child: Column(
          children: <Widget>[
            Stack(
              children: <Widget>[
                Container(
                  height: MediaQuery.of(context).size.height * 0.54,
                  margin: EdgeInsets.all(10.0),
                  decoration: BoxDecoration(
                    color: Color(0xFF77A5CD),
                  ),
                ),
                Center(
                  child: Column(
                    children: <Widget>[
                      SizedBox(height: 30),
                      Hero(
                        tag: 'logoAnimation',
                        child: Image.asset('assets/images/ECS logo1.jpg',
                          height: 220,
                          width: double.infinity,

                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(
                            left: 50,
                            right: 50
                        ),
                        child: Text('EdgeCloudSim is another fork from CloudSim, mainly focused on Edge computing, '
                            'this tool covers different aspects of modeling, including network modeling '
                            ', computational modeling, and Fog specific modeling (mobility, offloading,'
                            ' orchestration).',
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 18,
                          ),
                          textAlign: TextAlign.center,
                        ),
                      ),

                    ],
                  ),
                ),
              ],
            ),
            Column(
              children: [
                Padding(
                  padding: const EdgeInsets.only(
                      right: 120,
                     // bottom: 10,
                  ),
                  child: Text('Edit Simulator..',
                    style: TextStyle(
                      color:Colors.blueGrey,
                      fontSize: 27,
                      height: 3,
                      fontWeight: FontWeight.w500,
                    ),
                    textDirection: TextDirection.ltr,
                  ),
                ),
              ],
            ),
            Padding(
              padding: const EdgeInsets.only(
                left: 50
              ),
              child: Row(
                children: [
                  SizedBox(
                    height: 60,
                    width: 300,
                    child: RaisedButton(
                      color: Color(0xFF5896CB),
                      onPressed: (){
                        Navigator.of(context).pushNamed('graphical');

                      },
                      child: Padding(
                        padding: const EdgeInsets.only(
                            left: 10
                        ),
                        child: Row(
                          children: [
                            Icon(Icons.account_tree,color: Colors.white,size: 30),
                            Padding(
                              padding: const EdgeInsets.only(left: 30),
                              child: Text('Graphically' ,
                                style: TextStyle(
                                    color: Colors.white,
                                    fontSize: 20
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                  SizedBox(
                    height: 30,

                    child: Padding(
                      padding: const EdgeInsets.only(

                      ),
                      child: IconButton(

                        icon: Icon(Icons.help_center_outlined,color:  Colors.black45,size: 20),
                        tooltip:'Modify configuration parameters' ,
                      ),
                    ),
                  ),
                ],
              ),
            ),
            //all is for the button
            Text(''),
            Padding(
              padding: const EdgeInsets.only(
                left: 50
              ),
              child: Row(
                children: [
                  SizedBox(
                    height: 60,
                    width: 300,
                    child: RaisedButton(
                      color: Color(0xFF5896CB),
                      onPressed: (){
                        Navigator.of(context).pushNamed('manually');
                      },
                      child: Padding(
                        padding: const EdgeInsets.only(left: 20),
                        child: Row(
                          children: [
                            Icon(Icons.wysiwyg_sharp,color: Colors.white,size: 30),
                            Padding(
                              padding: const EdgeInsets.only(left: 10),
                              child: Text('Advanced Mode' ,
                                style: TextStyle(
                                    color: Colors.white,
                                    fontSize: 20
                                ) ,),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                  SizedBox(
                    height: 30,

                    child: Padding(
                      padding: const EdgeInsets.only(

                      ),
                      child: IconButton(

                        icon: Icon(Icons.help_center_outlined,color:  Colors.black45,size: 20),
                        tooltip:'Edit the configuration files manually' ,
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}