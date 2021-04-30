import 'dart:io';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_file_manager/flutter_file_manager.dart';
import 'package:path_provider_ex/path_provider_ex.dart';

//import package files

void main() => runApp(MyApp());
class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return  MaterialApp(
      home: MyFileList(), //call MyFile List
    );
  }
}

//apply this class on home: attribute at MaterialApp()
class MyFileList extends StatefulWidget{
  @override
  State<StatefulWidget> createState() {
    return _MyFileList();
  }
}

class _MyFileList extends State<MyFileList>{
  var files;

  void getFiles() async { //async function to get list of files

    List<StorageInfo> storageInfo = await PathProviderEx.getStorageInfo();
    var root = storageInfo[0].rootDir + "/Documents"; //storageInfo[1] for SD card, geting the root directory
    var fm = FileManager(root: Directory(root));

    files = await fm.filesTree(extensions: ["log"]);

    setState(() {
    }); //update the UI
  }

  @override
  void initState() {
    getFiles(); //call getFiles() function on initial state.
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
            title:Text("Log files"),
            backgroundColor: Colors.blue
        ),
        body:files == null? Text("Searching Files"):
        ListView.builder(  //if file/folder list is grabbed, then show here
          itemCount: files?.length ?? 0,
          itemBuilder: (context, index) {
            return Card(
                child:ListTile(
                  title: Text(files[index].path.split('/').last),
                  leading: Icon(Icons.file_present),
                  //trailing: Icon(Icons.delete, color: Colors.redAccent,),
                )
            );
          },
        )
    );
  }
}