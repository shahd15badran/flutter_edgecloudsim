package com.shahd.flutter_edgecloudsim;


import java.io.ByteArrayInputStream;
import java.io.DataInputStream;
import java.io.DataOutputStream;
import java.io.FileOutputStream;
import java.io.InputStream;
import java.net.Socket;

public class SendFileToServer {
    static String SimMsg = "";
    String file = "";
    public SendFileToServer(String file_to_send, boolean f) {
        Thread thread = new Thread(() -> {
            try  {
                this.file = file_to_send;
                System.out.println("createdddddddddd");//
                Start(file,f);
            } catch (Exception e) {
                e.printStackTrace();
            }
        });
        thread.start();
    }
    public void Start(String file, boolean f) throws Exception {
        String server = "192.168.0.185";
        int port = 1988;
        try{
            Socket s = new Socket(server, port);
            //send files
            DataOutputStream dos = new DataOutputStream(s.getOutputStream());
            InputStream fileStream = new ByteArrayInputStream(file.getBytes());
            DataInputStream fis = new DataInputStream(fileStream);
            byte[] buffer = new byte[4096];
            int read;
            while ((read = fis.read(buffer)) > 0) {
                dos.write(buffer, 0, read);

            }

            //recieve
            if(f){
                DataInputStream disMsg = new DataInputStream(s.getInputStream());
                StringBuffer inputLine = new StringBuffer();
                String tmp;
                while ((tmp = disMsg.readLine()) != null) {
                    inputLine.append(tmp);
                    //System.out.println(tmp);
                }
                SimMsg = inputLine.toString();
                System.out.println("sim"+ SimMsg);
                disMsg.close();
            }
            fis.close();
            dos.close();
            //fileStream.close();

        } catch (Exception e) {
            e.printStackTrace();
        }
    }
    public static String getSimMsg(){
        if(SimMsg != null)
            return SimMsg;
        else
            return "There's a problem with connecting to server. Please try again later.";
    }
}


