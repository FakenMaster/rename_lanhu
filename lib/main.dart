import 'package:file_picker/file_picker.dart';
import 'package:file_picker_cross/file_picker_cross.dart';
import 'package:flutter/material.dart';

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
      home: MyHomePage(title: 'Flutter Demo Home Page'),
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
      body: Column(
        children: [
          RaisedButton(
            onPressed: () async {
              sourcePath = await filePickerCross();
              setState(() {});
            },
            child: Text('来源路径：${sourcePath ?? ''}'),
          ),
          RaisedButton(
            onPressed: () async {
              destinationPath = await filePickerCross();
              setState(() {});
            },
            child: Text('目标路径：${destinationPath ?? ''}'),
          ),
        ],
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

  Future<String> filePickerCross() async {
    FilePickerCross result = await FilePickerCross.importFromStorage();
    if (result != null) {
      return result.path;
    }
    return null;
  }
}
