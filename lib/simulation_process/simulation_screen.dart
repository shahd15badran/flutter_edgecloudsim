import 'dart:async';
import 'dart:ffi';
import 'dart:io';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_edgecloudsim/services/auth.dart';
import 'package:flutter_edgecloudsim/widgets/NavDrawer.dart';
import 'package:flutter_edgecloudsim/widgets/original_button.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:xml/xml.dart';

class SimulationScreen extends StatefulWidget {
  @override
  _SimulationScreenState createState() => _SimulationScreenState();
}

class _SimulationScreenState extends State<SimulationScreen> with TickerProviderStateMixin{
  int _state = 0;
  bool _hasbeenpressed=false;
  final Msg_controller=TextEditingController(text:"");
  int _stateM = 0;
  bool _isLogButtonDisabled;
  bool _isPdfButtonDisabled;
  //bool _finishedSimulation;
  static const Platform = const MethodChannel("com.flutter.epic/epic");
  var simRes = '';
  Future<String> _getBatteryLevel() async {
    try {
      return await Platform.invokeMethod("Start Sim");
    } on PlatformException catch (e) {
      print(e);
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

  Future<void> _sendPlotGeneric() async {
    prefs = await SharedPreferences.getInstance();
    try {
      final String result = await Platform.invokeMethod('updateGeneric',display_plotGeneric());
    } on PlatformException catch (e) {
      print(e);
    }
  }

  //FlutterLocalNotificationsPlugin flutterLocalNotificationsPlugin;
  @override
  void initState(){
    _sendAppXML();
    _sendEdgeXML();
    _sendConfigPROP();
    _disableButtons(); //results buttons
    super.initState();
  }

  void _disableButtons() {
    setState(() {
      _isLogButtonDisabled = false;//TODO return them to true
      _isPdfButtonDisabled = false;
    });
  }

  AuthBase authBase = AuthBase();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: NavDrawer(),
      appBar: AppBar(
        iconTheme: IconThemeData(
          color:Color(0xA3131212),
        ),
        backgroundColor: Colors.white,
      ),
      body:  SingleChildScrollView(
        child: Column(
          children: <Widget>[
            Stack(
              children: <Widget>[
                Container(
                  height: MediaQuery.of(context).size.height * 0.5,
                  margin: EdgeInsets.all(10.0),
                  decoration: BoxDecoration(
                    color:Color(0xFF77A5CD),
                  ),
                ),
                Center(
                  child: Column(
                    children: <Widget>[
                      Padding(
                        padding: const EdgeInsets.only(top: 50,bottom: 30),
                        child: SizedBox(
                            width: 350,
                            child:Text('Your configuration files have been sent, you can click the button below to continue the process..',
                              style: TextStyle(
                                fontSize: 16,
                                color: Colors.white,
                                fontWeight: FontWeight.w600,
                              ),)
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 20),
                        child: SizedBox(
                          width: 360,
                          child: OriginalButton(
                            text: 'Start Simulation',
                            color: Colors.white,
                            textColor: Color(0xFF345979),
                            onPressed: () {
                              _getBatteryLevel();
                              /*
                              var res = _getBatteryLevel();
                              res.then( (value) {
                                print('in then part!');
                                setState(() {
                                  _stateM = 2;
                                });
                              });*/
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
                            left: 20,
                            top: 30
                        ),
                          child: SingleChildScrollView(
                            child: TextField(
                              maxLines: null,
                              enabled: false,
                              controller: Msg_controller,
                              decoration: InputDecoration(
                                fillColor: Color(0xFFE7DADA),
                                filled: true,
                                border: InputBorder.none,
                                hintText: "         Click on the check icon when it appears!",
                              ),
                            ),
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
                    top: 10,
                    bottom: 50,
                  ),
                  child: SizedBox(
                    width: 350,
                    child:Text('When simulation details appears, you can download the generated log files, or further apply matlab functions on them to see clearer results! ',
                      style: TextStyle(
                        fontSize: 16,
                        color:Color(0xFF77A5CD),
                        fontWeight: FontWeight.w600,
                      ), ),
                  ),
                ),

                Padding(
                  padding: const EdgeInsets.only(
                  ),
                  child: SizedBox(
                    width: 250,
                    child: new MaterialButton(
                      child: setUpButtonChild('Download Log Files'),
                      onPressed: _isLogButtonDisabled? null:() async{
                        final folderName = "Logs";
                        final path = Directory("storage/emulated/0/Documents/$folderName");
                        if ((await path.exists())) {
                          print("exist");
                        } else {
                          print("not exist");
                          path.create();
                        }
                        _getlogs();
                        setState(() {
                          if (_state == 0) {
                            animateButton();
                          }
                        });
                      },
                      elevation: 4.0,
                      minWidth:250.0,
                      height: 55.0,
                      color:_hasbeenpressed?Colors.green: Color(0xFF345979),
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
                    child: MaterialButton(
                      child: setUpButton('Apply Matlab Functions'),
                      //text: 'Apply Matlab Functions',
                      onPressed: _isPdfButtonDisabled? null:() async {
                        _sendPlotGeneric();
                        Navigator.of(context).pushNamed('matlab screen');
                      },
                      elevation: 4.0,
                      minWidth:250.0,
                      height: 55.0,
                      color: Color(0xFF345979),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(15),
                      ),
                    ),
                  ),
                ),

              ],
            ),
          ],
        ),
      ),
    );
  }

  Widget setUpButton(String name){ //Pdfs Button
    return new Text(
      name,
      style: const TextStyle(
        color: Colors.white,
        fontSize: 16.0,
      ),
    );
  }

  Widget setUpButtonChild(String name) { //Logs Button
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
    } else  {
      setState(() {
        _hasbeenpressed = true;
      });
      return new Text(name,
        style: const TextStyle(
          color: Colors.white,
          fontSize: 16.0,
        ),
      );
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
        "",
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
      return InkWell(
        splashColor: Color(0xFF18801A), // splash color
        onTap: ()async {
          try {
            final String result = await Platform.invokeMethod("getMsg");
            simRes = ' $result';
            Msg_controller.text=simRes;
            setState(() {
              _isLogButtonDisabled = false;
              _isPdfButtonDisabled = false;
            });
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

  display_applications(){
    final builder = XmlBuilder();
    builder.processing('xml', 'version="1.0"');
    builder.element('applications', nest: () {
      for(int c=0;c<4;c++) {
        //print('counter'+c.toString());
        builder.element('application', nest: () {
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

  display_plotGeneric(){
    String all = '';
    all+= 'function [] = plotGenericResult(rowOfset, columnOfset, yLabel, appType, calculatePercentage)\n';
    all+= 'folderPath = "C:/Users/hp/eclipse-workspace/EdgeCloudSim-master/EdgeCloudSim-master/sim_results";\n';
    all+= 'numOfSimulations = 1;\n';
    all+= 'startOfMobileDeviceLoop ='+ prefs.getString('min_number_of_mobile_devices')+';\n';
    all+= 'stepOfMobileDeviceLoop =' + prefs.getString('mobile_device_counter_size')+';\n';
    all+= 'endOfMobileDeviceLoop ='+ prefs.getString('max_number_of_mobile_devices')+';\n';
    all+= 'xTickLabelCoefficient = 1;\n';
    all+= "scenarioType = {'SINGLE_TIER','TWO_TIER','TWO_TIER_WITH_EO'};\n";
    all+= "legends = {'1-tier','2-tier','2-tier with EO'};\n";
    all+= 'numOfMobileDevices = (endOfMobileDeviceLoop - startOfMobileDeviceLoop)/stepOfMobileDeviceLoop + 1;\n';
    all+= 'pos=[10 3 12 12];\n';
    all+= 'all_results = zeros(numOfSimulations, size(scenarioType,2), numOfMobileDevices);\n';
    all+= 'min_results = zeros(size(scenarioType,2), numOfMobileDevices);\n';
    all+= 'max_results = zeros(size(scenarioType,2), numOfMobileDevices);\n';
    all+= 'for s=1:numOfSimulations\n';
    all+= 'for i=1:size(scenarioType,2)\n';
    all+= 'for j=1:numOfMobileDevices\n';
    all+= 'try\n';
    all+= 'mobileDeviceNumber = startOfMobileDeviceLoop + stepOfMobileDeviceLoop * (j-1);\n';
    all+= "filePath = strcat(folderPath,'/ite',int2str(s),'/SIMRESULT_',char(scenarioType(i)),'_NEXT_FIT_',int2str(mobileDeviceNumber),'DEVICES_',appType,'_GENERIC.log');\n";
    all+= "readData = dlmread(filePath,';',rowOfset,0);\n";
    all+= 'value = readData(1,columnOfset);\n';
    all+= "if(strcmp(calculatePercentage,'percentage_for_all'))\n";
    all+= "readData = dlmread(filePath,';',1,0);\n";
    all+= 'totalTask = readData(1,1)+readData(1,2);\n';
    all+= 'value = (100 * value) / totalTask;\n';
    all+= "elseif(strcmp(calculatePercentage,'percentage_for_completed'))\n";
    all+= "readData = dlmread(filePath,';',1,0);\n";
    all+= "totalTask = readData(1,1);\n";
    all+= "value = (100 * value) / totalTask;\n";
    all+= "elseif(strcmp(calculatePercentage,'percentage_for_failed'))\n";
    all+= "readData = dlmread(filePath,';',1,0);\n";
    all+= "totalTask = readData(1,2);\n";
    all+= " value = (100 * value) / totalTask;\n";
    all+= "end\n";
    all+= "all_results(s,i,j) = value;\n";
    all+= "catch err\n";
    all+= "error(err)\n";
    all+= "end\n"; all+= "end\n"; all+= "end\n"; all+= "end\n";
    all+= "if(numOfSimulations == 1)\n";
    all+= "results = all_results;\n";
    all+= "else\n";
    all+= "results = mean(all_results); %still 3d matrix but 1xMxN format\n";
    all+= "end\n";
    all+= "results = squeeze(results); %remove singleton dimensions\n";
    all+= "for i=1:size(scenarioType,2)\n";
    all+= "for j=1:numOfMobileDevices\n";
    all+= "x=all_results(:,i,j);                    % Create Data\n";
    all+= "SEM = std(x)/sqrt(length(x));            % Standard Error\n";
    all+= "ts = tinv([0.05  0.95],length(x)-1);   % T-Score\n";
    all+= "CI = mean(x) + ts*SEM;                   % Confidence Intervals\n";
    all+= "if(CI(1) < 0)\n";
    all+= "CI(1) = 0;\n";
    all+= "end\n";
    all+= "if(CI(2) < 0)\n";
    all+= "CI(2) = 0;\n";
    all+= "end\n";
    all+= "min_results(i,j) = results(i,j) - CI(1);\n";
    all+= "max_results(i,j) = CI(2) - results(i,j);\n";
    all+= "end\n"; all+= "end\n";
    all+= "types = zeros(1,numOfMobileDevices);\n";
    all+= "for i=1:numOfMobileDevices\n";
    all+= "types(i)=startOfMobileDeviceLoop+((i-1)*stepOfMobileDeviceLoop);\n";
    all+= "end\n";
    all+= "hFig = figure;\n";
    all+= "set(hFig, 'Units','centimeters');\n";
    all+= "set(hFig, 'Position',pos);\n";
    all+= "set(0,'DefaultAxesFontName','Times New Roman');\n";
    all+= "set(0,'DefaultTextFontName','Times New Roman');\n";
    all+= "set(0,'DefaultAxesFontSize',10);\n";
    all+= "set(0,'DefaultTextFontSize',12);\n";
    all+= "C = [0.55 0 0;0 0.15 0.6;0 0.23 0;0.6 0 0.6;0.08 0.08 0.08;0 0.8 0.8;0.8 0.4 0;0.8 0.8 0];\n";
    all+= "if(1 == 1)\n";
    all+= "for i=1:1:numOfMobileDevices\n";
    all+= "xIndex=startOfMobileDeviceLoop+((i-1)*stepOfMobileDeviceLoop);" +"\n" +
        "markers = {':k*',':ko',':ks',':kv',':kp',':kd',':kx',':kh'};"+"\n" +
        "for j=1:size(scenarioType,2)"+"\n" +
        "plot(xIndex, results(j,i),char(markers(j)),'MarkerFaceColor',[0.55 0 0],'color',[0.55 0 0]);"+"\n" +
        "hold on;"+"\n" +
        "end"+"\n" +
        "end"+"\n" +
        "for j=1:size(scenarioType,2)"+"\n" +
        "if(0 == 1)"+"\n" +
        "errorbar(types, results(j,:), min_results(j,:),max_results(j,:),':k','color',[0.55 0 0],'LineWidth',1.5);"+"\n" +
        "else"+"\n" +
        "plot(types, results(j,:),':k','color',[0.55 0 0],'LineWidth',1.5);"+"\n" +
        "end"+"\n" +
        "hold on;"+"\n" +
        "end\n";

    all+= "set(gca,'color','none');"+"\n" +
        "else"+"\n" +
        "markers = {'-k*','-ko','-ks','-kv','-kp','-kd','-kx','-kh'};"+"\n" +
        "for j=1:size(scenarioType,2)"+"\n" +
        "if(0 == 1)"+"\n" +
        "errorbar(types, results(j,:),min_results(j,:),max_results(j,:),char(markers(j)),'MarkerFaceColor','w','LineWidth',1.2);"+"\n" +
        "else"+"\n" +
        "plot(types, results(j,:),char(markers(j)),'MarkerFaceColor','w','LineWidth',1.2);"+"\n" +
        "end"+"\n" +
        "hold on;"+"\n" +
        "end"+"\n" +
        "end"+"\n" +
        "lgnd = legend(legends,'Location','NorthWest');"+"\n" +
        "if(1 == 1)"+"\n" +
        "set(lgnd,'color','none');"+"\n" +
        "end"+"\n" +
        "hold off;"+"\n" +
        "axis square"+"\n" +
        "xlabel('Number of Mobile Devices');"+"\n" +
        "set(gca,'XTick', (startOfMobileDeviceLoop*xTickLabelCoefficient):(stepOfMobileDeviceLoop*xTickLabelCoefficient):endOfMobileDeviceLoop);"+"\n" +
        "set(gca,'XTickLabel', (startOfMobileDeviceLoop*xTickLabelCoefficient):(stepOfMobileDeviceLoop*xTickLabelCoefficient):endOfMobileDeviceLoop);"+"\n" +
        "ylabel(yLabel);"+"\n" +
        "set(gca,'XLim',[startOfMobileDeviceLoop-5 endOfMobileDeviceLoop+5]);"+"\n" +
        "set(get(gca,'Xlabel'),'FontSize',12)"+"\n" +
        "set(get(gca,'Ylabel'),'FontSize',12)"+"\n" +
        "set(lgnd,'FontSize',11)"+"\n" +
        "if(1 == 1)"+"\n" +
        "set(hFig, 'PaperUnits', 'centimeters');"+"\n" +
        "set(hFig, 'PaperPositionMode', 'manual');"+"\n" +
        "set(hFig, 'PaperPosition',[0 0 pos(3) pos(4)]);"+"\n" +
        "set(gcf, 'PaperSize', [pos(3) pos(4)]); %Keep the same paper size"+"\n" +
        "filename = strcat(folderPath,'/',int2str(rowOfset),'_',int2str(columnOfset),'_',appType);"+"\n" +
        "saveas(gcf, filename, 'pdf');"+"\n" +
        "end"+"\n" +
        "end";

    return all;
  }

}