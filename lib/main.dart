import 'package:flutter/material.dart';
import 'package:permission/permission.dart';

import 'file_page.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {

 // Permission.openSettings;
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: FilePage(),
    );
  }
}

