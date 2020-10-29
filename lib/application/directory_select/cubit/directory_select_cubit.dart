import 'dart:io';

import 'package:bloc/bloc.dart';
import 'package:dartz/dartz.dart';
import 'package:file_picker/file_picker.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:injectable/injectable.dart';
import 'package:rxdart/subjects.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:stringx/stringx.dart';
import 'package:rename_lanhu/infrasture/util/util.dart';

part 'directory_select_state.dart';
part 'directory_select_cubit.freezed.dart';

@injectable
class DirectorySelectCubit extends Cubit<DirectorySelectState> {
  DirectorySelectCubit(this.sharedPreferences)
      : fileStream = BehaviorSubject.seeded(null),
        super(DirectorySelectState.initial(''));

  final SharedPreferences sharedPreferences;
  final BehaviorSubject<List<FileSystemEntity>> fileStream;

  void getDirectory(String spKey) {
    emit(
      some(sharedPreferences.getString(spKey))
          .filter((a) => a.isDirectory)
          .fold(
        () {
          fileStream.add(null);
          return DirectorySelectState.fail(spKey);
        },
        (directory) {
          //如何动态加呢？否则这样得等所有文件迭代完才显示
          List<FileSystemEntity> files = [];
          fileStream.add(files);
          Directory(directory).list().listen((file) {
            files = [...files, file];
            fileStream.add(files);
          }, onDone: () {});
          return DirectorySelectState.success(spKey, directory);
        },
      ),
    );
  }

  void selectDirectory(String spKey) async {
    String directory = await FilePicker.platform.getDirectoryPath();
    if (directory.notNullAndEmpty()) {
      await sharedPreferences.setString(spKey, directory);
    }
    getDirectory(spKey);
  }

  @override
  Future<void> close() {
    fileStream?.close();
    return super.close();
  }
}
