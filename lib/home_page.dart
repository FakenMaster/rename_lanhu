import 'dart:io';

import 'package:file_picker/file_picker.dart';
import 'package:flushbar/flushbar.dart';
import 'package:flutter/material.dart';
import 'package:filepicker_windows/filepicker_windows.dart'
    as filepicker_windows;
import 'package:modal_progress_hud/modal_progress_hud.dart';
import 'package:rename_lanhu/folder_choose_widget.dart';
import 'package:rxdart/rxdart.dart';
import 'package:stringx/stringx.dart';
import 'package:time/time.dart';
import 'package:path/path.dart' as package_path;

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
  PublishSubject<bool> loading;

  @override
  void initState() {
    super.initState();
    sourcePath = BehaviorSubject();
    destinationPath = BehaviorSubject();
    loading = PublishSubject();

    renameSubject = BehaviorSubject.seeded(false);
    Rx.combineLatest2<String, String, bool>(sourcePath, destinationPath,
            (a, b) => a.notNullAndEmpty() && b.notNullAndEmpty())
        .listen(renameSubject.add);
  }

  @override
  void dispose() {
    loading.close();
    sourcePath.close();
    destinationPath.close();
    renameSubject.close();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return StreamBuilder<bool>(
        stream: loading,
        builder: (context, snapshot) {
          return ModalProgressHUD(
            inAsyncCall: snapshot.data == true,
            dismissible: false,
            opacity: 0.5,
            child: Scaffold(
              appBar: AppBar(
                title: Text(widget.title),
              ),
              body: Stack(
                children: [
                  Center(
                    child: Column(
                      mainAxisSize: MainAxisSize.min,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        FolderChooseWidget(
                          title: '来源路径：',
                          onChange: sourcePath.add,
                        ),
                        SizedBox(
                          height: 40,
                        ),
                        FolderChooseWidget(
                          title: '目标路径：',
                          onChange: destinationPath.add,
                        ),
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
                                          if (checkValidDirectory(
                                                  '来源', sourcePath.value) &&
                                              checkValidDirectory('目标',
                                                  destinationPath.value)) {
                                            /// 重命名、分配到目标文件夹
                                            showDialog(
                                                context: context,
                                                builder: (_) => AlertDialog(
                                                      title: Text('确定开始转换吗?'),
                                                      actions: [
                                                        FlatButton(
                                                          onPressed: () =>
                                                              Navigator.pop(
                                                                  context),
                                                          child: Text('取消'),
                                                        ),
                                                        FlatButton(
                                                          onPressed: () {
                                                            Navigator.pop(
                                                                context);
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
                ],
              ),
            ),
          );
        });
  }

  bool checkValidDirectory(String prefix, String path) {
    FileSystemEntityType fileSystemEntityType = FileSystemEntity.typeSync(path);

    if (fileSystemEntityType == FileSystemEntityType.notFound) {
      Flushbar(
        message: '${prefix}文件夹不存在',
        duration: 3.seconds,
      ).show(this.context);
      return false;
    }
    if (fileSystemEntityType != FileSystemEntityType.directory) {
      Flushbar(
        message: '请选择${prefix}文件夹',
        duration: 3.seconds,
      ).show(this.context);
      return false;
    }
    return true;
  }

  Future<String> filePicker() async {
    FilePickerResult result = await FilePicker.platform.pickFiles();
    if (result != null) {
      return result.files.single.path;
    }
    return null;
  }

  renameBlueLakeFiles() async {
    loading.add(true);
    Directory sourceDirectory = Directory(sourcePath.value);
    await for (FileSystemEntity entity in sourceDirectory.list()) {
      String path = entity.path;
      if (!FileSystemEntity.isFileSync(entity.path)) {
        return;
      }

      String extension = package_path.extension(path);
      String nameWithoutExtension = package_path.basenameWithoutExtension(path);
      String fileName = nameWithoutExtension;
      String folderName;
      if (nameWithoutExtension.endsWith('@2x')) {
        folderName = '2.0x';
        fileName = nameWithoutExtension.substring(
            0, nameWithoutExtension.lastIndexOf('@2x'));
      } else if (nameWithoutExtension.endsWith('@3x')) {
        folderName = '3.0x';
        fileName = nameWithoutExtension.substring(
            0, nameWithoutExtension.lastIndexOf('@3x'));
      }

      String separator = package_path.separator;
      String destinationFilePath = destinationPath.value +
          '$separator' +
          (folderName != null ? folderName + "$separator" : '') +
          fileName +
          extension;

      //创建新文件
      File file = File(destinationFilePath);
      if (file.existsSync()) {
        file.deleteSync();
      }
      file.createSync(recursive: true);

      //复制内容到新文件
      File(path).copySync(destinationFilePath);
    }
    loading.add(false);
    Flushbar(
      message: '转换成功',
      duration: 3.seconds,
    ).show(context);
  }

  Future<String> filePickerWindows() async {
    filepicker_windows.OpenFilePicker openFilePicker =
        filepicker_windows.OpenFilePicker();
    File file = openFilePicker.getFile();
    return file?.path;
  }
}
