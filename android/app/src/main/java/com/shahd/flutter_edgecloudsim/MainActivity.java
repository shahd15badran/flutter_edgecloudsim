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

                    ArrayList<String> defaultConfigNames = new ArrayList<String>();
                    defaultConfigNames.add("simulation_time");
                    defaultConfigNames.add("warm_up_period");
                    defaultConfigNames.add("vm_load_check_interval");
                    defaultConfigNames.add("location_check_interval");
                    defaultConfigNames.add("file_log_enabled");
                    defaultConfigNames.add("deep_file_log_enabled");
                    defaultConfigNames.add("min_number_of_mobile_devices");
                    defaultConfigNames.add("max_number_of_mobile_devices");
                    defaultConfigNames.add("mobile_device_counter_size");
                    defaultConfigNames.add("wan_propagation_delay");
                    defaultConfigNames.add("lan_internal_delay");
                    defaultConfigNames.add("wlan_bandwidth");
                    defaultConfigNames.add("wan_bandwidth");
                    defaultConfigNames.add("gsm_bandwidth");
                    defaultConfigNames.add("number_of_host_on_cloud_datacenter");
                    defaultConfigNames.add("number_of_vm_on_cloud_host");
                    defaultConfigNames.add("core_for_cloud_vm");
                    defaultConfigNames.add("mips_for_cloud_vm");
                    defaultConfigNames.add("ram_for_cloud_vm");
                    defaultConfigNames.add("storage_for_cloud_vm");
                    defaultConfigNames.add("core_for_mobile_vm");
                    defaultConfigNames.add("mips_for_mobile_vm");
                    defaultConfigNames.add("ram_for_mobile_vm");
                    defaultConfigNames.add("storage_for_mobile_vm");
                    defaultConfigNames.add("orchestrator_policies");
                    defaultConfigNames.add("simulation_scenarios");
                    defaultConfigNames.add("attractiveness_L1_mean_waiting_time");
                    defaultConfigNames.add("attractiveness_L2_mean_waiting_time");
                    defaultConfigNames.add("attractiveness_L3_mean_waiting_time");

                    String stringFile = "";
                    for(int i=0; i<29; i++){
                        stringFile += defaultConfigNames.get(i) + "=" + arguments.get(i) +"\n";
                    }
                    //arguments.clear();
                    //arguments.add(props.getProperty("simulation_scenarios"));

                    new SendFileToServer("3" +stringFile);
                    result.success(stringFile);
                }
                else if(call.method.equals("Start Sim")){
                    new SendFileToServer("@");
                    result.success(SendFileToServer.getSimMsg());
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