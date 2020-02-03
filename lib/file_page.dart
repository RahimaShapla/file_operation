import 'package:file_picker/file_picker.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:open_file/open_file.dart';

class FilePage extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return FileState();
  }
}

class FileState extends State<FilePage> {

  String _fileName = "";
  String _path;
  Map<String, String> _paths;
  String _extension= "";
  bool _loadingPath = false;
  bool _multiPick = false;
  bool _hasValidMime = false;
  FileType _pickingType = FileType.ANY;

  String file;

  getFile() async {
    file = await FilePicker.getFilePath(type: FileType.ANY );

      setState((){
        _fileName =file;
        OpenFile.open(_fileName);
      });

  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: new AppBar(
        title: const Text('Pick Any File!!'),
      ),
      body: Container(
        child: Column(
          children: <Widget>[
            InkWell(
              onTap: (){
                getFile();
              },
              child: Container(
                height: 50,
                width: 200,
                alignment: Alignment.center,
                color: Colors.teal,
                child: Text(
                  "click me"
                ),
              ),
            ),
             Container(
               height: 200,
               width: 400,
               color: Colors.blue,
               child: Text(
                   _fileName == null ? "peep peep" : _fileName
               ),

             )
          ],
        ),
      ),
    );
  }
}
