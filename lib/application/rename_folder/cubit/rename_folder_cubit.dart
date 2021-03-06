import 'dart:async';
import 'dart:io';

import 'package:bloc/bloc.dart';
import 'package:dartz/dartz.dart';
import 'package:file_picker/file_picker.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:injectable/injectable.dart';
import 'package:rename_lanhu/infrasture/util/src/sp_keys.dart';
import 'package:rxdart/rxdart.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:time/time.dart';
import 'package:stringx/stringx.dart';
import 'package:path/path.dart' as package_path;

part 'rename_folder_state.dart';
part 'rename_folder_cubit.freezed.dart';

@injectable
class RenameFolderCubit extends Cubit<RenameFolderState> {
  RenameFolderCubit(this.sharedPreferences) : super(_Initial()) {
    _directoryStreams = {};
    [StorageKeys.SOURCE_DIRECTORY, StorageKeys.DESTINATION_DIRECTORY].forEach((spKey) {
      _directoryStreams[spKey] = initDirectoryStream(spKey);
    });
    _renameSubject = BehaviorSubject.seeded(false);
    Rx.combineLatest<String, bool>(
            _directoryStreams.values,
            (values) => values.fold(
                true,
                (previousValue, element) =>
                    previousValue && element.notNullAndEmpty()))
        .listen(_renameSubject.add);
  }

  final SharedPreferences sharedPreferences;

  Map<String, BehaviorSubject<String>> _directoryStreams;
  BehaviorSubject<bool> _renameSubject;

  Stream directoryStream(String spKey) => _directoryStreams[spKey];
  Stream get renameStream => _renameSubject;

  BehaviorSubject<String> initDirectoryStream(String spKey) {
    var stream = BehaviorSubject<String>();
    // 500ms之内的最后值，并且与最近的值不同才存入本地
    stream
        .where((String directory) => directory != null)
        .debounceTime(500.milliseconds)
        .distinct()
        .listen((String directory) {
      saveDirectory(spKey, directory);
    });
    return stream;
  }

  void saveDirectory(String spKey, String directory) {
    sharedPreferences.setString(spKey, directory);
  }

  void getDirectory(String spKey) {
    emit(RenameFolderState.directoryStorage(
        spKey, sharedPreferences.getString(spKey)));
  }

  void directoryChange(String spKey, String directory) {
    _directoryStreams[spKey]?.add(directory);
  }

  void selectDirectory(String spKey) async {
    String directory = await FilePicker.platform.getDirectoryPath();
    if (directory.notNullAndEmpty()) {
      emit(RenameFolderState.selectDirectorySuccess(spKey, directory));
    }
  }

  void rename() {
    emit(RenameFolderState.renameProcessing());
    renameBlueLakeFiles();
  }

  void validate(){
    emit(validateDirectory('来源', _directoryStreams[StorageKeys.SOURCE_DIRECTORY].value)
          .orElse(() => validateDirectory(
              '目标', _directoryStreams[StorageKeys.DESTINATION_DIRECTORY].value))
          .getOrElse(() => RenameFolderState.valid()));
  }


  Option<RenameFolderState> validateDirectory(String prefix, String path) {
    FileSystemEntityType fileSystemEntityType = FileSystemEntity.typeSync(path);
    if (fileSystemEntityType == FileSystemEntityType.notFound) {
      return some(RenameFolderState.renameFail('${prefix}文件夹不存在'));
    }
    if (fileSystemEntityType != FileSystemEntityType.directory) {
      return some(RenameFolderState.renameFail(
        '请选择${prefix}文件夹',
      ));
    }
    return none();
  }

  renameBlueLakeFiles() async {
    try {
      Directory sourceDirectory =
          Directory(_directoryStreams[StorageKeys.SOURCE_DIRECTORY].value);
      await for (FileSystemEntity entity in sourceDirectory.list()) {
        String path = entity.path;
        if (!FileSystemEntity.isFileSync(entity.path)) {
          continue;
        }

        String extension = package_path.extension(path);
        String nameWithoutExtension =
            package_path.basenameWithoutExtension(path);
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
        String destinationFilePath =
            _directoryStreams[StorageKeys.DESTINATION_DIRECTORY].value +
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
    } catch (e) {
      emit(RenameFolderState.renameFail('转换失败:$e'));
    }
    emit(RenameFolderState.renameSuccess());
  }

  @override
  Future<void> close() {
    _renameSubject.close();
    _directoryStreams?.forEach((key, value) {
      value?.close();
    });
    return super.close();
  }
}
