import 'dart:async';

import 'package:flutter/services.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:flutter/material.dart';
import 'package:xml/xml.dart';

class EdgeXML extends StatefulWidget {
  @override
  _State createState() => _State();
}
int counter=1;
int deleteApp;
/////////////
class _State extends State<EdgeXML>with TickerProviderStateMixin  {
  int _state = 0;
  List<String>costPerBw=['0.1','0.1','0.1','0.1','0.1','0.1','0.1','0.1','0.1','0.1','0.1','0.1','0.1','0.1'];
  List<String>costPerSec=['3.0','3.0','3.0','3.0','3.0','3.0','3.0','3.0','3.0','3.0','3.0','3.0','3.0','3.0'];
  List<String>costPerMem=['0.05','0.05','0.05','0.05''0.05','0.05','0.05','0.05','0.05','0.05','0.05','0.05','0.05','0.05'];
  List<String>costPerStorage=['0.1','0.1','0.1','0.1','0.1','0.1','0.1','0.1','0.1','0.1','0.1','0.1','0.1','0.1'];
  List<String>x_pos=['1','2','3','4','5','6','7','8','9','10','11','12','13','14'];
  List<String>y_pos=['1','2','3','4','5','6','7','8','9','10','11','12','13','14'];
  List<String>wlan_id=['0','1','2','3','4','5','6','7','8','9','10','11','12','13'];
  List<String>attractiveness=['0','0','1','1','1','1','2','2','2','2','2','2','2','2'];
  List<String>core=['8','8','8','8''8','8''8','8''8','8''8','8''8','8'];
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

  var xml_controller=TextEditingController();

  static const Platform =const MethodChannel("com.flutter.epic/epic");
  String _batteryLevel = '';
  Future<void> _getBatteryLevel() async {
    String batteryLevel;
    try {
      final String result = await Platform.invokeMethod('getEdgeDeviceXML',display());
      batteryLevel = ' $result  ';
    } on PlatformException catch (e) {
      print(e);
    }

    setState(() {
      _batteryLevel = batteryLevel;
    });
  }
  String _batteryLevel2='';
  Future<void> _getBatteryLevel2() async {
    String batteryLevel2;
    try {
      final String result = await Platform.invokeMethod('getEdgeDeviceXML', _batteryLevel2);
      batteryLevel2 = ' $result  ';
    } on PlatformException catch (e) {
      print(e);
    }

    setState(() {
      _batteryLevel2 = batteryLevel2;
    });
  }
  @override
  void initState (){
    getData();
    xml_controller.text= display();
  }
  getData() async{
    SharedPreferences prefs = await SharedPreferences.getInstance();
    setState((){
///////////////////////////////////////////////////////if(prefs.getInt('delete_app')!=null) {
      if(prefs.getInt('counter')!=null) {
        counter = prefs.getInt('counter');
      }
      else counter=1;
      print("OOOOOOO"+counter.toString());
      if(counter>0){
        if (((prefs.getStringList('costPerBw') != null) &&
            (prefs.getString('save_app') == 'true')))
          costPerBw[counter - 1] = prefs.getStringList('costPerBw')[counter - 1];

        else if (prefs.getStringList('costPerBw') == null)
          costPerBw[counter - 1] = costPerBw[counter - 1];

        if (((prefs.getStringList('costPerSec') != null) &&
            (prefs.getString('save_app') == 'true')))
          costPerSec[counter - 1] = prefs.getStringList('costPerSec')[counter - 1];

        else if (prefs.getStringList('costPerSec') == null)
          costPerSec[counter - 1] = costPerSec[counter - 1];

        if (((prefs.getStringList('costPerMem') != null) &&
            (prefs.getString('save_app') == 'true')))
          costPerMem[counter - 1] = prefs.getStringList('costPerMem')[counter - 1];

        else if (prefs.getStringList('costPerMem') == null)
          costPerMem[counter - 1] = costPerMem[counter - 1];

        if (((prefs.getStringList('costPerStorage') != null) &&
            (prefs.getString('save_app') == 'true')))
          costPerStorage[counter - 1] = prefs.getStringList('costPerStorage')[counter - 1];

        else if (prefs.getStringList('costPerStorage') == null)
          costPerStorage[counter - 1] = costPerStorage[counter - 1];

        if (((prefs.getStringList('x_pos') != null) &&
            (prefs.getString('save_app') == 'true')))
          x_pos[counter - 1] = prefs.getStringList('x_pos')[counter - 1];

        else if (prefs.getStringList('x_pos') == null)
          x_pos[counter - 1] = x_pos[counter - 1];

        if (((prefs.getStringList('y_pos') != null) &&
            (prefs.getString('save_app') == 'true')))
          y_pos[counter - 1] = prefs.getStringList('y_pos')[counter - 1];

        else if (prefs.getStringList('y_pos') == null)
          y_pos[counter - 1] = y_pos[counter - 1];

        if (((prefs.getStringList('wlan_id') != null) &&
            (prefs.getString('save_app') == 'true')))
          wlan_id[counter - 1] = prefs.getStringList('wlan_id')[counter - 1];

        else if (prefs.getStringList('wlan_id') == null)
          wlan_id[counter - 1] = wlan_id[counter - 1];

        if (((prefs.getStringList('attractiveness') != null) &&
            (prefs.getString('save_app') == 'true')))
          attractiveness[counter - 1] = prefs.getStringList('attractiveness')[counter - 1];

        else if (prefs.getStringList('attractiveness') == null)
          attractiveness[counter - 1] = attractiveness[counter - 1];

        if (((prefs.getStringList('core') != null) &&
            (prefs.getString('save_app') == 'true')))
          core[counter - 1] = prefs.getStringList('core')[counter - 1];

        else if (prefs.getStringList('core') == null)
          core[counter - 1] = core[counter - 1];

        if (((prefs.getStringList('mips') != null) &&
            (prefs.getString('save_app') == 'true')))
          mips[counter - 1] = prefs.getStringList('mips')[counter - 1];

        else if (prefs.getStringList('mips') == null)
          mips[counter - 1] = mips[counter - 1];

        if (((prefs.getStringList('ram') != null) &&
            (prefs.getString('save_app') == 'true')))
          ram[counter - 1] = prefs.getStringList('ram')[counter - 1];

        else if (prefs.getStringList('ram') == null)
          ram[counter - 1] = ram[counter - 1];

        if (((prefs.getStringList('storage') != null) &&
            (prefs.getString('save_app') == 'true')))
          storage[counter - 1] = prefs.getStringList('storage')[counter - 1];

        else if (prefs.getStringList('storage') == null)
          storage[counter - 1] = storage[counter - 1];
////////////// /////////////////////////////////////////////////////////
        if (((prefs.getStringList('core1') != null) &&
            (prefs.getString('save_app') == 'true')))
          core1[counter - 1] = prefs.getStringList('core1')[counter - 1];

        else if (prefs.getStringList('core1') == null)
          core1[counter - 1] = core1[counter - 1];

        if (((prefs.getStringList('mips1') != null) &&
            (prefs.getString('save_app') == 'true')))
          mips1[counter - 1] = prefs.getStringList('mips1')[counter - 1];

        else if (prefs.getStringList('mips1') == null)
          mips1[counter - 1] = mips1[counter - 1];

        if (((prefs.getStringList('ram1') != null) &&
            (prefs.getString('save_app') == 'true')))
          ram1[counter - 1] = prefs.getStringList('ram1')[counter - 1];

        else if (prefs.getStringList('ram1') == null)
          ram1[counter - 1] = ram1[counter - 1];

        if (((prefs.getStringList('storage1') != null) &&
            (prefs.getString('save_app') == 'true')))
          storage1[counter - 1] = prefs.getStringList('storage1')[counter - 1];

        else if (prefs.getStringList('storage1') == null)
          storage1[counter - 1] = storage1[counter - 1];
/////////////////////////////////////////////////
        if (((prefs.getStringList('core2') != null) &&
            (prefs.getString('save_app') == 'true')))
          core2[counter - 1] = prefs.getStringList('core2')[counter - 1];

        else if (prefs.getStringList('core2') == null)
          core2[counter - 1] = core2[counter - 1];

        if (((prefs.getStringList('mips2') != null) &&
            (prefs.getString('save_app') == 'true')))
          mips2[counter - 1] = prefs.getStringList('mips2')[counter - 1];

        else if (prefs.getStringList('mips2') == null)
          mips2[counter - 1] = mips2[counter - 1];

        if (((prefs.getStringList('ram2') != null) &&
            (prefs.getString('save_app') == 'true')))
          ram2[counter - 1] = prefs.getStringList('ram2')[counter - 1];

        else if (prefs.getStringList('ram2') == null)
          ram2[counter - 1] = ram2[counter - 1];

        if (((prefs.getStringList('storage2') != null) &&
            (prefs.getString('save_app') == 'true')))
          storage2[counter - 1] = prefs.getStringList('storage2')[counter - 1];

        else if (prefs.getStringList('storage2') == null)
          storage2[counter - 1] = storage2[counter - 1];


      }
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
                child: FlatButton(
                  height: 20,
                  minWidth: 20,
                  color: Colors.white,
                  onPressed: () async {
                    Navigator.of(context).pushReplacementNamed('login');
                  },
                  child:Row(
                    children:<Widget>[
                      Icon(Icons.logout,color: Colors.black,size: 20),
                    ],
                  ),
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
      return new Text('submit',
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
  display(){
    final builder = XmlBuilder();
    builder.processing('xml', 'version="1.0"');
    builder.element('edge_devices', nest: () {
      for(int c=0;c<8;c++) {
        builder.element('datacenter', nest: () {
          builder.attribute('arch', 'x86');
          builder.attribute('os', 'Linux');
          builder.attribute('vmm', 'Xen');

          builder.element('costPerBw', nest: costPerBw[c]);
          builder.element('costPerSec', nest: costPerSec[c]);
          builder.element('costPerMem', nest: costPerMem[c]);
          builder.element('costPerStorage', nest: costPerStorage[c]);

          builder.element('location', nest: () {
            builder.element('x_pos', nest: x_pos[c]);
            builder.element('y_pos', nest: y_pos[c]);
            builder.element('wlan_id', nest: wlan_id[c]);
            builder.element('attractiveness', nest: attractiveness[c]);
          });
          builder.element('hosts', nest: () {
            builder.element('host', nest: () {
              builder.element('core', nest: core[c]);
              builder.element('mips', nest: mips[c]);
              builder.element('ram', nest: ram[c]);
              builder.element('storage', nest: storage[c]);
              builder.element('VMs', nest: () {
                builder.element('VM', nest: () {
                  builder.attribute('vmm', 'Xen');
                  builder.element('core', nest: core1[c]);
                  builder.element('mips', nest: mips1[c]);
                  builder.element('ram', nest: ram1[c]);
                  builder.element('storage', nest: storage1[c]);
                });
                builder.element('VM', nest: () {
                  builder.attribute('vmm', 'Xen');
                  builder.element('core', nest: core2[c]);
                  builder.element('mips', nest: mips2[c]);
                  builder.element('ram', nest: ram2[c]);
                  builder.element('storage', nest: storage2[c]);
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
}
