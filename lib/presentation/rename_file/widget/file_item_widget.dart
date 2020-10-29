import 'dart:io';

import 'package:flutter/material.dart';
import 'package:path/path.dart' as path;

class FileItemWidget extends StatelessWidget {
  const FileItemWidget({Key key, this.fileEntity}) : super(key: key);

  final FileSystemEntity fileEntity;

  @override
  Widget build(BuildContext context) {
    return Card(
      child: ListTile(
        onTap: () {},
        title: Text('${path.basename(fileEntity.path)}'),
      ),
    );
  }
}
