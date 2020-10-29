import 'dart:io';
import 'package:stringx/stringx.dart';

extension StringX on String {
  bool get isDirectory {
    if (this.isNullOrEmpty()) {
      return false;
    }
    FileSystemEntityType fileSystemEntityType = FileSystemEntity.typeSync(this);
    if (fileSystemEntityType == FileSystemEntityType.notFound) {
      return false;
    }
    if (fileSystemEntityType != FileSystemEntityType.directory) {
      return false;
    }
    return true;
  }

  bool get isFile {
    if (this.isNullOrEmpty()) {
      return false;
    }
    FileSystemEntityType fileSystemEntityType = FileSystemEntity.typeSync(this);
    if (fileSystemEntityType == FileSystemEntityType.notFound) {
      return false;
    }
    if (fileSystemEntityType != FileSystemEntityType.file) {
      return false;
    }
    return true;
  }
}
