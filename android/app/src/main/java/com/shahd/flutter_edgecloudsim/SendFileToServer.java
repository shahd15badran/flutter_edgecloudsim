package com.shahd.flutter_edgecloudsim;


import java.io.ByteArrayInputStream;
import java.io.DataInputStream;
import java.io.DataOutputStream;
import java.io.InputStream;
import java.net.Socket;

public class SendFileToServer {
    String file = " ";
    public SendFileToServer(String file_to_send) {
        Thread thread = new Thread(() -> {
            try  {
                this.file = file_to_send;
                System.out.println("createdddddddddd");
                Start(file);
            } catch (Exception e) {
                e.printStackTrace();
            }
        });

        thread.start();
    }
    public void Start(String file) throws Exception {
        String server = "192.168.0.103";
        int port = 1988;
        try{
            Socket s = new Socket(server, port);
            DataOutputStream dos = new DataOutputStream(s.getOutputStream());
            InputStream fileStream = new ByteArrayInputStream(file.getBytes());
            DataInputStream fis = new DataInputStream(fileStream);
            byte[] buffer = new byte[4096];
            int read;
            while ((read = fis.read(buffer)) > 0) {
                dos.write(buffer, 0, read);
            }
            fis.close();
            dos.close();
        } catch (Exception e) {
            e.printStackTrace();
        }
    }
}


