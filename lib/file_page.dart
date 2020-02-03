import 'dart:io';

import 'package:file_picker/file_picker.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:open_file/open_file.dart';
import 'package:path_provider/path_provider.dart';

class FilePage extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return FileState();
  }
}

Future<String> get _localPath async {
  final directory = await getApplicationDocumentsDirectory();

  return directory.path;
}

class FileState extends State<FilePage> {

  String _fileName;
  String _path;
  Map<String, String> _paths;
  String _extension= "";
  bool _loadingPath = false;
  bool _multiPick = false;
  bool _hasValidMime = false;
  FileType _pickingType = FileType.ANY;

  String file;

  getFile() async {
   // var permissionNames = await Permission.requestPermissions([PermissionName.Calendar, PermissionName.Camera]);
   // permissionNames.
    file = await FilePicker.getFilePath(type: FileType.ANY );
      setState(() async{
        _fileName =file;
        OpenFile.open(_fileName);

      /* final directory = await getApplicationDocumentsDirectory();
        final _path = directory.path;
        File('$_path./hello.txt');*/


      });

  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: new AppBar(
        title: const Text('HHHHHHHHHHKKKK'),
      ),
      body: Container(
        child: Column(
          children: <Widget>[
            InkWell(
              onTap: (){
                setState(() {
                  getFile();
                });

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
                   _fileName == null ? "peep peep" : _fileName,
                 style: TextStyle(color: Colors.white),
               ),

             )
          ],
        ),
      ),
    );
  }
}

