import 'package:shared_preferences/shared_preferences.dart';
import 'package:flutter/material.dart';
import 'package:xml/xml.dart';

class EdgeXML extends StatefulWidget {
  @override
  _State createState() => _State();
}

class _State extends State<EdgeXML> {
  @override
  String costPerBw="0.1";
  String costPerSec="3.0";
  String costPerMem="0.05";
  String costPerStorage="0.1";

  String x_pos ="1";
  String y_pos ="1";
  String wlan_id="0";
  String attractiveness="0";

  String core="8";
  String mips="4000";
  String ram="8000";
  String storage="200000";

  String core_vm1="2";
  String mips_vm1="1000";
  String ram_vm1="2000";
  String storage_vm1="50000";

  String core_vm2="2";
  String mips_vm2="1000";
  String ram_vm2="2000";
  String storage_vm2="50000";


  void initState (){
    getData();
  }
  getData() async{
    SharedPreferences prefs = await SharedPreferences.getInstance();
    setState((){
      if(prefs.getString('costPerBw')!=null)  costPerBw=prefs.getString('costPerBw');
      if(prefs.getString('costPerSec')!=null)   costPerSec=prefs.getString('costPerSec');
      if(prefs.getString('costPerMem')!=null)  costPerMem=prefs.getString('costPerMem');
      if(prefs.getString('costPerStorage')!=null) costPerStorage=prefs.getString('costPerStorage');

      if(prefs.getString('x_pos')!=null)   x_pos=prefs.getString('x_pos');
      if(prefs.getString('y_pos')!=null)   y_pos=prefs.getString('y_pos');
      if(prefs.getString('wlan_id')!=null)  wlan_id=prefs.getString('wlan_id');
      if(prefs.getString('attractiveness')!=null)   attractiveness=prefs.getString('attractiveness');

      if(prefs.getString('core')!=null)  core=prefs.getString('core');
      if(prefs.getString('mips')!=null) mips=prefs.getString('mips');
      if(prefs.getString('ram')!=null)   ram=prefs.getString('ram');
      if(prefs.getString('storage')!=null)   storage=prefs.getString('storage');

      if(prefs.getString('core_vm1')!=null)  core_vm1=prefs.getString('core_vm1');
      if(prefs.getString('mips_vm1')!=null) mips_vm1=prefs.getString('mips_vm1');
      if(prefs.getString('ram_vm1')!=null)   ram_vm1=prefs.getString('ram_vm1');
      if(prefs.getString('storage_vm1')!=null)   storage_vm1=prefs.getString('storage_vm1');

      if(prefs.getString('core_vm2')!=null)  core_vm2=prefs.getString('core_vm2');
      if(prefs.getString('mips_vm2')!=null) mips_vm2=prefs.getString('mips_vm2');
      if(prefs.getString('ram_vm2')!=null)   ram_vm2=prefs.getString('ram_vm2');
      if(prefs.getString('storage_vm2')!=null)   storage_vm2=prefs.getString('storage_vm2');
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

          builder.element('costPerBw', nest: costPerBw);
          builder.element('costPerSec', nest: costPerSec);
          builder.element('costPerMem', nest: costPerMem);
          builder.element('costPerStorage', nest: costPerStorage);
          
          builder.element('location', nest: (){
            builder.element('x_pos', nest: x_pos);
            builder.element('y_pos', nest: y_pos);
            builder.element('wlan_id', nest: wlan_id);
            builder.element('attractiveness', nest: attractiveness);
          });
          builder.element('hosts', nest: (){
            builder.element('host', nest: (){
              builder.element('core', nest: core);
              builder.element('mips', nest: mips);
              builder.element('ram', nest: ram);
              builder.element('storage', nest: storage);
              builder.element('VMs', nest: (){
                builder.element('VM', nest: (){
                  builder.attribute('vmm', 'Xen');
                  builder.element('core_vm1', nest: core_vm1);
                  builder.element('mips_vm1', nest: mips_vm1);
                  builder.element('ram_vm1', nest: ram_vm1);
                  builder.element('storage_vm1', nest: storage_vm1);

                });
                builder.element('VM', nest: (){
                  builder.attribute('vmm', 'Xen');
                  builder.element('core_vm2', nest: core_vm2);
                  builder.element('mips_vm2', nest: mips_vm2);
                  builder.element('ram_vm2', nest: ram_vm2);
                  builder.element('storage_vm2', nest: storage_vm2);

                });
              });

            });
          });
          // builder.text('Growing a Language');
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
