package com.shahd.flutter_edgecloudsim;
import android.os.Bundle;

import androidx.annotation.NonNull;
import io.flutter.embedding.android.FlutterActivity;
import io.flutter.embedding.engine.FlutterEngine;
import io.flutter.plugin.common.MethodChannel;
import io.flutter.plugin.common.MethodCall;
//import io.flutter.plugins.GeneratedPluginRegistrant;

import java.lang.reflect.Array;
import java.util.List;
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
    /*
    @Override
    protected void onCreate(Bundle savedInstanceState) {
        super.onCreate(savedInstanceState);
        GeneratedPluginRegistrant.registerWith(this.getFlutterEngine());
    }
    */
    @Override
    public void configureFlutterEngine(@NonNull FlutterEngine flutterEngine){
        super.configureFlutterEngine(flutterEngine);        //GeneratedPluginRegistrant.registerWith(flutterEngine);

        new MethodChannel(getFlutterEngine().getDartExecutor(),CHANNEL).setMethodCallHandler(new MethodChannel.MethodCallHandler() {
            @Override

            public void onMethodCall(@NonNull MethodCall call, @NonNull MethodChannel.Result result) {
                if (call.method.equals("getAppXML")){
                    List arguments= call.arguments();
                    Document doc = convertStringToDocument((String) arguments.get(1));
                    String str = convertDocumentToString(doc);
                    String key = (String) arguments.get(0);
                    new SendFileToServer("2"+key +str,false);
                    result.success(str);
                }
                else  if (call.method.equals("getEdgeDeviceXML")){
                    List arguments= call.arguments();
                    Document doc = convertStringToDocument( (String) arguments.get(1));
                    String str = convertDocumentToString(doc);
                    String key = (String) arguments.get(0);
                    new SendFileToServer("1"+key +str,false);
                    result.success(str);
                }
                else if(call.method.equals("getDefaultConfigFile")){
                    List arguments = call.arguments();
                    String key = (String) arguments.get(0);
                    String str = arguments.get(1).toString();
                    new SendFileToServer("3"+key +str,false);
                    result.success(str);
                }
                else if(call.method.equals("updateGeneric")){
                    List arguments = call.arguments();
                    String key = (String) arguments.get(0);
                    String str = arguments.get(1).toString();
                    new SendFileToServer("4"+key +str,false);
                    result.success(str);
                }
                else if(call.method.equals("Start Sim")){
                    String key = call.arguments();
                    new SendFileToServer("@"+key,true);
                    result.success(SendFileToServer.getSimMsg());
                }
                else if (call.method.equals("getMsg")){
                    result.success(SendFileToServer.getSimMsg());
                }
                else if(call.method.equals("get log file")){
                    String key = call.arguments();
                    new GetFileFromServer("*"+key );
                    result.success("logss"+GetFileFromServer.getfilesnames());//
                }
                else if(call.method.equals("pdfs_failed")) {
                    String key = call.arguments();
                    new GetFileFromServer("f"+key);
                    result.success("done");//
                }
                else if(call.method.equals("pdfs_network")){
                    String key = call.arguments();
                    new GetFileFromServer("n"+key);
                    result.success("done");//
                }
                else if(call.method.equals("pdfs_process")){
                    String key = call.arguments();
                    new GetFileFromServer("p"+key);
                    result.success("done");//
                }
                else if(call.method.equals("pdfs_service")){
                    String key = call.arguments();
                    new GetFileFromServer("s"+key);
                    result.success("done");//
                }
                else if(call.method.equals("pdfs_vm")){
                    String key = call.arguments();
                    new GetFileFromServer("v"+key);
                    result.success("done");//
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