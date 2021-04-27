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
                    new SendFileToServer("2" +str,false);
                    result.success(str);
                }
                else  if (call.method.equals("getEdgeDeviceXML")){
                    String arguments= call.arguments();
                    Document doc = convertStringToDocument( arguments );
                    String str = convertDocumentToString(doc);
                    new SendFileToServer("1" +str,false);
                    result.success(str);
                }
                else if(call.method.equals("getDefaultConfigFile")){
                   String arguments = call.arguments();
                    new SendFileToServer("3" +arguments,false);
                    result.success(arguments);
                }
                else if(call.method.equals("Start Sim")){
                    new SendFileToServer("@",true);
                    result.success(SendFileToServer.getSimMsg());
                }
                else if(call.method.equals("get log file")){
                    new GetFileFromServer("$", true);
                    result.success("resultssssssssss"+GetFileFromServer.getfilesnames());
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