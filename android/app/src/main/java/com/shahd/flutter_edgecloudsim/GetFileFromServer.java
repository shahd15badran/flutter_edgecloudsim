package com.shahd.flutter_edgecloudsim;

import android.os.Environment;

import java.io.BufferedInputStream;
import java.io.BufferedOutputStream;
import java.io.ByteArrayInputStream;
import java.io.DataInputStream;
import java.io.DataOutputStream;
import java.io.File;
import java.io.FileOutputStream;
import java.io.IOException;
import java.io.InputStream;
import java.net.Socket;
import java.nio.file.Files;
import java.nio.file.Paths;
import java.util.ArrayList;
import java.util.Scanner;

public class GetFileFromServer {
    static String concatenate = "";
    String file = "";
    static boolean done = false;

    public GetFileFromServer(String file_to_send) {
        Thread thread = new Thread(() -> {
            try {
                this.file = file_to_send;
                System.out.println("generatedddddddd");
                Start(file);
            } catch (Exception e) {
                e.printStackTrace();
            }
        });
        thread.start();
    }

    public void Start(String file) throws Exception {
        String server = "192.168.0.105";
        int port = 1988;
        try {

            Socket s = new Socket(server, port);
            DataOutputStream dos = new DataOutputStream(s.getOutputStream());
            InputStream fileStream = new ByteArrayInputStream(file.getBytes());
            DataInputStream fis = new DataInputStream(fileStream);
            byte[] buffer = new byte[4096];
            int read;
            while ((read = fis.read(buffer)) > 0) {
                dos.write(buffer, 0, read);
            }

            BufferedInputStream bis = new BufferedInputStream(s.getInputStream());
            DataInputStream dis = new DataInputStream(bis);
            ArrayList<String> ff = new ArrayList<String>();
            int filesCount = dis.readInt();
            System.out.println("FILES_COUNT = " + filesCount);////////////////////////
            File[] files = new File[filesCount];


            for (int i = 0; i < filesCount; i++) {   //concatenate += dis.readUTF() + "\n";
                long fileLength = dis.readLong();
                String fileName = dis.readUTF();
                File the_path = new File(Environment.getExternalStorageDirectory() + "/Documents");
                files[i] = new File(the_path + "/" + fileName);

                FileOutputStream fos = new FileOutputStream(files[i]);/////
                BufferedOutputStream bos = new BufferedOutputStream(fos);
                for (int j = 0; j < fileLength; j++)
                    bos.write(bis.read());
                bos.close();
            }
            dis.close();

            done = true;

        } catch (IOException e) {
            // TODO Auto-generated catch block
            e.printStackTrace();
        }
    }

    public static String getfilesnames() {
        if (concatenate != null) {
            System.out.println("concatenate isss: " + concatenate);
            return concatenate;
        } else
            return "There's a problem ";
    }
}
    