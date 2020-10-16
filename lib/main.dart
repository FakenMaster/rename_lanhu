import 'dart:io';

import 'package:file_picker/file_picker.dart';
import 'package:filepicker_windows/filepicker_windows.dart';
import 'package:flutter/material.dart';
import 'package:filepicker_windows/filepicker_windows.dart'
    as filepicker_windows;
import 'package:stringx/stringx.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      home: DefaultTextStyle(
          style: TextStyle(
            fontSize: 30,
          ),
          child: MyHomePage(title: 'Flutter Demo Home Page')),
    );
  }
}

class MyHomePage extends StatefulWidget {
  MyHomePage({Key key, this.title}) : super(key: key);

  final String title;

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  String sourcePath;
  String destinationPath;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: Center(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            RaisedButton(
              onPressed: () async {
                String path = await filePicker();
                if (path.isNullOrEmpty()) return;
                setState(() {
                  sourcePath = path;
                });
              },
              child: Text(
                '来源路径：${sourcePath ?? ''}',
                style: DefaultTextStyle.of(context).style,
              ),
            ),
            SizedBox(
              height: 40,
            ),
            RaisedButton(
              onPressed: () async {
                String path = await filePicker();
                if (path.isNullOrEmpty()) return;
                setState(() {
                  destinationPath = path;
                });
              },
              child: Text('目标路径：${destinationPath ?? ''}',
                  style: DefaultTextStyle.of(context).style),
            ),
          ],
        ),
      ),
    );
  }

  Future<String> filePicker() async {
    FilePickerResult result = await FilePicker.platform.pickFiles();
    if (result != null) {
      return result.files.single.path;
    }
    return null;
  }

  Future<String> filePickerWindows() async {
    OpenFilePicker openFilePicker = filepicker_windows.OpenFilePicker();
    File file = openFilePicker.getFile();
    return file?.path;
  }
}
