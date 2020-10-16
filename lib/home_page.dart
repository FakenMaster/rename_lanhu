import 'dart:io';

import 'package:awesome_dialog/awesome_dialog.dart';
import 'package:file_picker/file_picker.dart';
import 'package:filepicker_windows/filepicker_windows.dart';
import 'package:flushbar/flushbar.dart';
import 'package:flutter/material.dart';
import 'package:filepicker_windows/filepicker_windows.dart'
    as filepicker_windows;
import 'package:giffy_dialog/giffy_dialog.dart';
import 'package:rxdart/rxdart.dart';
import 'package:stringx/stringx.dart';
import 'package:file_chooser/file_chooser.dart';
import 'package:time/time.dart';

class HomePage extends StatefulWidget {
  HomePage({Key key, this.title}) : super(key: key);

  final String title;

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  BehaviorSubject<String> sourcePath;
  BehaviorSubject<String> destinationPath;
  BehaviorSubject<bool> renameSubject;

  TextEditingController sourcePathController;
  TextEditingController destinationPathController;

  @override
  void initState() {
    super.initState();
    sourcePath = BehaviorSubject();
    destinationPath = BehaviorSubject();

    sourcePathController = TextEditingController()
      ..addListener(() {
        sourcePath.add(sourcePathController.text);
      });
    destinationPathController = TextEditingController()
      ..addListener(() {
        destinationPath.add(destinationPathController.text);
      });

    renameSubject = BehaviorSubject.seeded(false);
    Rx.combineLatest2<String, String, bool>(sourcePath, destinationPath,
            (a, b) => a.notNullAndEmpty() && b.notNullAndEmpty())
        .listen(renameSubject.add);
  }

  @override
  void dispose() {
    sourcePath.close();
    destinationPath.close();
    renameSubject.close();
    sourcePathController.dispose();
    destinationPathController.dispose();
    super.dispose();
  }

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
            StreamBuilder<String>(
                stream: sourcePath,
                builder: (context, snapshot) {
                  return Row(
                    children: [
                      Text(
                        '来源路径：',
                        style: DefaultTextStyle.of(context).style,
                      ),
                      SizedBox(
                        width: 10,
                      ),
                      Flexible(
                        child: TextField(
                          controller: sourcePathController,
                        ),
                      ),
                      SizedBox(
                        width: 10,
                      ),
                      RaisedButton.icon(
                        onPressed: () async {
                          String path = await filePicker();
                          if (path.notNullAndEmpty()) {
                            sourcePathController.text = path;
                            sourcePath.add(path);
                          }
                        },
                        icon: Icon(Icons.more_horiz),
                        label: Text('选择文件夹'),
                      )
                    ],
                  );
                }),
            SizedBox(
              height: 40,
            ),
            StreamBuilder<String>(
                stream: destinationPath,
                builder: (context, snapshot) {
                  return Row(
                    children: [
                      Text(
                        '目标路径：',
                        style: DefaultTextStyle.of(context).style,
                      ),
                      SizedBox(
                        width: 10,
                      ),
                      Flexible(
                        child: TextField(
                          controller: destinationPathController,
                        ),
                      ),
                      SizedBox(
                        width: 10,
                      ),
                      RaisedButton.icon(
                        onPressed: () async {
                          String path = await filePicker();
                          if (path.notNullAndEmpty()) {
                            destinationPathController.text = path;
                            destinationPath.add(path);
                          }
                        },
                        icon: Icon(Icons.more_horiz),
                        label: Text('选择文件夹'),
                      )
                    ],
                  );
                }),
            SizedBox(
              height: 40,
            ),
            StreamBuilder<bool>(
                stream: renameSubject,
                builder: (context, snapshot) {
                  return Center(
                    child: RaisedButton(
                      onPressed: snapshot.data == true
                          ? () {
                              if (checkValidDirectory('来源', sourcePath.value) &&
                                  checkValidDirectory(
                                      '目标', destinationPath.value)) {
                                /// 重命名、分配到目标文件夹
                                showDialog(
                                    context: context,
                                    builder: (_) => AlertDialog(
                                          title: Text('确定开始转换吗?'),
                                          actions: [
                                            FlatButton(
                                              onPressed: () =>
                                                  Navigator.pop(context),
                                              child: Text('取消'),
                                            ),
                                            FlatButton(
                                              onPressed: () {
                                                Navigator.pop(context);
                                                renameBlueLakeFiles();
                                              },
                                              child: Text('确定'),
                                            ),
                                          ],
                                        ));
                              }
                            }
                          : null,
                      child: Text('重命名、分配到相应文件夹'),
                    ),
                  );
                }),
          ],
        ),
      ),
    );
  }

  bool checkValidDirectory(String prefix, String path) {
    FileSystemEntityType fileSystemEntityType = FileSystemEntity.typeSync(path);

    if (fileSystemEntityType == FileSystemEntityType.notFound) {
      Flushbar(
        message: '${prefix}文件夹不存在',
        duration: 3.seconds,
      ).show(context);
      return false;
    }
    if (fileSystemEntityType != FileSystemEntityType.directory) {
      Flushbar(
        message: '请选择${prefix}文件夹',
        duration: 3.seconds,
      ).show(context);
      return false;
    }
    return true;
  }

  Future<String> filePicker() async {
    FilePickerResult result = await FilePicker.platform.pickFiles();
    if (result != null) {
      return result.files.single.path;
    }
    // showOpenPanel();
    return null;
  }

  renameBlueLakeFiles() async {}

  Future<String> filePickerWindows() async {
    OpenFilePicker openFilePicker = filepicker_windows.OpenFilePicker();
    File file = openFilePicker.getFile();
    return file?.path;
  }
}
