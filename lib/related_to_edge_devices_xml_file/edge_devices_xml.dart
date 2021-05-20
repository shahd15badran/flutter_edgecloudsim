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
  List<String>costPerBw;
  List<String>costPerSec;
  List<String>costPerMem;
  List<String>costPerStorage;
  List<String>x_pos;
  List<String>y_pos;
  List<String>wlan_id;
  List<String>attractiveness;
  List<String>core;
  List<String>mips;
  List<String>ram;
  List<String>storage;
  List<String>core1;
  List<String>mips1;
  List<String>ram1;
  List<String>storage1;
  List<String>core2;
  List<String>mips2;
  List<String>ram2;
  List<String>storage2;

  var xml_controller=TextEditingController();

  static const Platform =const MethodChannel("com.flutter.epic/epic");

  String _batteryLevel2='';
  Future<void> _getBatteryLevel2() async {
    String batteryLevel2;
    try {
      SharedPreferences prefs = await SharedPreferences.getInstance();
      String user_id = prefs.getString('user_id');
      prefs.setString('ManuallygetEdgeDeviceXML', _batteryLevel2);
      //final String result = await Platform.invokeMethod('getEdgeDeviceXML', [user_id,_batteryLevel2]);
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
    costPerBw=prefs.getStringList('costPerBw');
    costPerSec=prefs.getStringList('costPerSec');
    costPerMem=prefs.getStringList('costPerMem');
    costPerStorage=prefs.get('costPerStorage');
    x_pos=prefs.get('x_pos');
    y_pos=prefs.getStringList('y_pos'); print("HHH");
    wlan_id=prefs.getStringList('wlan_id');
    attractiveness=prefs.get('attractiveness');

    core=prefs.getStringList('core');
    mips=prefs.getStringList('mips');
    ram=prefs.getStringList('ram');
    storage=prefs.getStringList('storage');
    core1=prefs.getStringList('core1');
    mips1=prefs.getStringList('mips1');
    ram1=prefs.getStringList('ram1');
    storage1=prefs.getStringList('storage1');
    core2=prefs.getStringList('core2');
    mips2=prefs.getStringList('mips2');
    ram2=prefs.getStringList('ram2');
    storage2=prefs.getStringList('storage2');

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
