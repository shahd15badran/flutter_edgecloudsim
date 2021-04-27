package com.shahd.flutter_edgecloudsim;
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
import java.util.ArrayList;

public class GetFileFromServer {
    ArrayList<String> filesnames = new ArrayList<String>();
    static String concatenate="";
    String file = "";

    public GetFileFromServer(String file_to_send,boolean t) {
        Thread thread = new Thread(() -> {
            try {
                this.file = file_to_send;
                System.out.println("generatedddddddd");
                Start(file ,t);
                System.out.println("doneeeeeee");
            } catch (Exception e) {
                e.printStackTrace();
            }
        });
        thread.start();
    }

    public void Start(String file,boolean t) throws Exception {
        System.out.println("doneeeeeee");
        String dirPath = "C:\\Users\\asus\\Desktop\\EdgeCloudSim-master\\EdgeCloudSim-master\\sim_results";
        String server = "192.168.1.19";
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
            //fis.close();
            //dos.close();
            if(t) {
                System.out.println("reachhhhhhhhhhh");
                BufferedInputStream bis = new BufferedInputStream(s.getInputStream());
                DataInputStream dis = new DataInputStream(bis);

                int filesCount = dis.readInt();
                ArrayList<File> files = new ArrayList<File>(filesCount);
                for (int i = 0; i < filesCount; i++) {
                    File f = new File(dis.readUTF());
                    files.add(f);
                }

                for(int i = 0; i < filesCount; i++)
                {
                    concatenate += dis.readUTF() + "\n";
                    long fileLength = dis.readLong();
                    String fileName = dis.readUTF();
                    files.set(i, new File(dirPath + "\\" + fileName));
                    FileOutputStream fos = new FileOutputStream(files.get(i));
                    BufferedOutputStream bos = new BufferedOutputStream(fos);
                    for(int j = 0; j < fileLength; j++)
                        bos.write(bis.read());
                    bos.close();
                }

                dis.close();

            }

        } catch (IOException e) {
            // TODO Auto-generated catch block
            e.printStackTrace();

        }

    }
    public static String getfilesnames(){
        if(concatenate != null)
            return concatenate;
        else
            return "There's a problem ";
    }
}
    