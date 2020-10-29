import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:rename_lanhu/application/directory_select/cubit/directory_select_cubit.dart';
import 'package:rename_lanhu/presentation/rename_file/widget/file_item_small_widget.dart';
import 'package:rename_lanhu/presentation/rename_file/widget/file_item_widget.dart';

/// 文件列表：① 一行一个：文件类型对应的图片+名称+（大小+种类+日期） ② 5个一行：上面是文件类型对应的图片+下面是文件名称
/// 一句话：对照Mac的Finder开发就行了，完美还原
class FileListWidget extends StatefulWidget {
  @override
  _FileListWidgetState createState() => _FileListWidgetState();
}

class _FileListWidgetState extends State<FileListWidget> {
  @override
  Widget build(BuildContext context) {
    return StreamBuilder<List<FileSystemEntity>>(
      stream: context.bloc<DirectorySelectCubit>().fileStream,
      builder: (context, snapshot) {
        return Scrollbar(
          child: ListView.builder(
            itemBuilder: (context, index) {
              return FileItemWidget(
                fileEntity: snapshot.data[index],
              );
            },
            itemCount: snapshot.data?.length ?? 0,
          ),
        );
      },
    );
  }
}
