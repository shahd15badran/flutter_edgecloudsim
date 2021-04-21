package com.shahd.flutter_edgecloudsim;
import androidx.annotation.NonNull;
import io.flutter.embedding.android.FlutterActivity;
import io.flutter.embedding.engine.FlutterEngine;
import io.flutter.plugin.common.MethodChannel;
import io.flutter.plugin.common.MethodCall;

import java.util.Properties;

import java.io.StringReader;
import java.io.StringWriter;

import javax.xml.parsers.DocumentBuilder;
import javax.xml.parsers.DocumentBuilderFactory;
import javax.xml.transform.OutputKeys;
import javax.xml.transform.Transformer;
import javax.xml.transform.TransformerException;
import javax.xml.transform.TransformerFactory;
import javax.xml.transform.dom.DOMSource;
import javax.xml.transform.stream.StreamResult;

import org.w3c.dom.Document;
import org.xml.sax.InputSource;


import java.util.ArrayList;


public class MainActivity extends FlutterActivity {
    private static final String CHANNEL="com.flutter.epic/epic";
    @Override

    public void configureFlutterEngine(@NonNull FlutterEngine flutterEngine){
        super.configureFlutterEngine(flutterEngine);        //GeneratedPluginRegistrant.registerWith(flutterEngine);

        new MethodChannel(getFlutterEngine().getDartExecutor(),CHANNEL).setMethodCallHandler(new MethodChannel.MethodCallHandler() {
            @Override

            public void onMethodCall(@NonNull MethodCall call, @NonNull MethodChannel.Result result) {
                if (call.method.equals("getAppXML")){
                    String arguments= call.arguments();
                    Document doc = convertStringToDocument( arguments );
                    String str = convertDocumentToString(doc);
                    new SendFileToServer("2" +str);
                    result.success(str);
                }
                else  if (call.method.equals("getEdgeDeviceXML")){
                    String arguments= call.arguments();
                    Document doc = convertStringToDocument( arguments );
                    String str = convertDocumentToString(doc);
                    new SendFileToServer("1" +str);
                    result.success(str);
                }
                else if(call.method.equals("getDefaultConfigFile")){
                    ArrayList<String> arguments = new ArrayList<String>();
                    arguments = call.arguments();

                    //Instantiating the properties file
                    Properties props = new Properties();
                    props.put("simulation_time", arguments.get(0));
                    props.put("warm_up_period", arguments.get(1));
                    props.put("vm_load_check_interval", arguments.get(2));
                    props.put("location_check_interval", arguments.get(3));
                    props.put("file_log_enabled", arguments.get(4));
                    props.put("deep_file_log_enabled", arguments.get(5));
                    props.put("min_number_of_mobile_devices", arguments.get(6));
                    props.put("max_number_of_mobile_devices", arguments.get(7));
                    props.put("mobile_device_counter_size", arguments.get(8));
                    props.put("wan_propagation_delay", arguments.get(9));
                    props.put("lan_internal_delay", arguments.get(10));
                    props.put("wlan_bandwidth", arguments.get(11));
                    props.put("wan_bandwidth", arguments.get(12));
                    props.put("gsm_bandwidth", arguments.get(13));
                    props.put("number_of_host_on_cloud_datacenter", arguments.get(14));
                    props.put("number_of_vm_on_cloud_host", arguments.get(15));
                    props.put("core_for_cloud_vm", arguments.get(16));
                    props.put("mips_for_cloud_vm", arguments.get(17));
                    props.put("ram_for_cloud_vm", arguments.get(18));
                    props.put("storage_for_cloud_vm", arguments.get(19));
                    props.put("core_for_mobile_vm", arguments.get(20));
                    props.put("mips_for_mobile_vm", arguments.get(21));
                    props.put("ram_for_mobile_vm", arguments.get(22));
                    props.put("storage_for_mobile_vm", arguments.get(23));
                    props.put("orchestrator_policies", arguments.get(24));
                    props.put("simulation_scenarios", arguments.get(25));
                    props.put("attractiveness_L1_mean_waiting_time", arguments.get(26));
                    props.put("attractiveness_L2_mean_waiting_time", arguments.get(27));
                    props.put("attractiveness_L3_mean_waiting_time", arguments.get(28));

                    //arguments.clear();

                    for (Object key: props.keySet()) {
                        System.out.println(key + ": " + props.getProperty(key.toString()));
                    }
                    //arguments.add(props.getProperty("simulation_scenarios"));
                    result.success("Hi from java"+arguments);

                }
            }
        });

    }
    private static Document convertStringToDocument(String xmlStr) {
        DocumentBuilderFactory factory = DocumentBuilderFactory.newInstance();
        DocumentBuilder builder;
        try
        {
            builder = factory.newDocumentBuilder();
            Document doc = builder.parse( new InputSource( new StringReader( xmlStr ) ) );
            return doc;
        } catch (Exception e) {
            e.printStackTrace();
        }
        return null;
    }

    private static String convertDocumentToString(Document doc) {
        TransformerFactory tf = TransformerFactory.newInstance();
        Transformer transformer;
        try {
            transformer = tf.newTransformer();
            // below code to remove XML declaration
            // transformer.setOutputProperty(OutputKeys.OMIT_XML_DECLARATION, "yes");
            StringWriter writer = new StringWriter();
            transformer.transform(new DOMSource(doc), new StreamResult(writer));
            String output = writer.getBuffer().toString();
            return output;
        } catch (TransformerException e) {
            e.printStackTrace();
        }

        return null;
    }

}