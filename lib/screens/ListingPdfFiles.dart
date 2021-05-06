import 'dart:io';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_file_manager/flutter_file_manager.dart';
import 'package:flutter_full_pdf_viewer/full_pdf_viewer_scaffold.dart';
import 'package:path_provider_ex/path_provider_ex.dart';
import 'package:share/share.dart';
//import package files

void main() => runApp(MyApp());
class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return  MaterialApp(
      home: MyPDFList('hey'), //call MyPDF List file
    );
  }
}

//apply this class on home: attribute at MaterialApp()
class MyPDFList extends StatefulWidget{
  String folder = '';
  MyPDFList(String folder){
    this.folder = folder;
  }
  @override
  State<StatefulWidget> createState() {
    return _MyPDFList(folder); //create state
  }
}

class _MyPDFList extends State<MyPDFList>{
  var files;
  String specFolder = '';

  _MyPDFList(String folder){
    this.specFolder = folder;
  }

  void getFiles() async { //asyn function to get list of files
    List<StorageInfo> storageInfo = await PathProviderEx.getStorageInfo();
    var root = storageInfo[0].rootDir+"/Documents/Pdfs/" + specFolder; //storageInfo[1] for SD card, geting the root directory
    print(root);
    var fm = FileManager(root: Directory(root)); //
    files = await fm.filesTree(
        //excludedPaths: ["/storage/emulated/0/Android"],
        extensions: ["pdf"] //optional, to filter files, list only pdf files
    );
    setState(() {}); //update the UI
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
            title:Row(
              children: [
                Text("Generated PDF files"),
                RaisedButton(
                  child: Text("Share"),
                 /* onPressed: () async {
                    print('no files found');
                    FilePickerResult result = await FilePicker.platform.pickFiles(
                      allowMultiple: true,
                      allowedExtensions: ['jpg', 'pdf'],
                      type: FileType.custom,
                    );
                    if (result != null) {
                      List files = result.paths.map((f) => File(f).path).toList();
                      Share.shareFiles(files, text: "Multiple Files");
                    }
                    else{
                      print('no files found');
                    }
                  },*/
                ),
              ],
            ),
            backgroundColor:Color(0xFF5896CB),
        ),
        body:files == null? Padding(
          padding: const EdgeInsets.all(10.0),
          child: Text("Searching Files",style: TextStyle(
            fontSize: 30,
            color:  Color(0xFF727578),
            fontWeight: FontWeight.w800,
          ),),
        ):
        ListView.builder(  //if file/folder list is grabbed, then show here
          itemCount: files?.length ?? 0,
          itemBuilder: (context, index) {
            return Card(
                child:ListTile(
                  title: Text(files[index].path.split('/').last),
                  leading: Icon(Icons.picture_as_pdf),
                  trailing: Icon(Icons.arrow_forward, color: Color(0xFF5896CB),),
                  onTap: (){
                    Navigator.push(context, MaterialPageRoute(builder: (context){
                      return ViewPDF(pathPDF:files[index].path.toString());
                      //open viewPDF page on click
                    }));
                  },
                )
            );
          },
        )
    );
  }
}

class ViewPDF extends StatelessWidget {
  String pathPDF = "";
  ViewPDF({this.pathPDF});

  @override
  Widget build(BuildContext context) {
    return PDFViewerScaffold( //view PDF
        appBar: AppBar(
          title: Text("Graph"),
          backgroundColor: Color(0x8AAA5555),
        ),
        path: pathPDF
    );
  }
}