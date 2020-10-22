import 'dart:async';
import 'dart:io';

import 'package:bloc/bloc.dart';
import 'package:dartz/dartz.dart';
import 'package:file_picker/file_picker.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:injectable/injectable.dart';
import 'package:rename_lanhu/infrasture/util/sp_keys.dart';
import 'package:rxdart/rxdart.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:time/time.dart';
import 'package:stringx/stringx.dart';

part 'rename_folder_event.dart';
part 'rename_folder_state.dart';
part 'rename_folder_bloc.freezed.dart';

@injectable
class RenameFolderBloc extends Bloc<RenameFolderEvent, RenameFolderState> {
  RenameFolderBloc(this.sharedPreferences) : super(_Initial()) {
    _directoryStreams = {};
    [SOURCE_DIRECTORY, DESTINATION_DIRECTORY].forEach((spKey) {
      _directoryStreams[spKey] = initDirectoryStream(spKey);
    });
  }

  final SharedPreferences sharedPreferences;

  Map<String, BehaviorSubject<String>> _directoryStreams;

  Stream directoryStream(String spKey) => _directoryStreams[spKey];

  BehaviorSubject<String> initDirectoryStream(String spKey) {
    var stream = BehaviorSubject<String>();
    // 500ms之内的最后值，并且与最近的值不同才存入本地
    stream
        .where((String directory) => directory != null)
        .debounceTime(500.milliseconds)
        .distinct()
        .listen((String directory) {
      add(RenameFolderEvent.saveDirectory(spKey, directory));
    });
    return stream;
  }

  @override
  Stream<RenameFolderState> mapEventToState(
    RenameFolderEvent event,
  ) async* {
    yield* event.map(getDirectory: (event) async* {
      yield RenameFolderState.directoryStorage(
          event.spKey, sharedPreferences.getString(event.spKey));
    }, saveDirectory: (event) async* {
      sharedPreferences.setString(event.spKey, event.directory);
      yield RenameFolderState.noMatter();
    }, directoryChange: (event) async* {
      _directoryStreams[event.spKey]?.add(event.directory);
      yield RenameFolderState.noMatter();
    }, selectDirectory: (event) async* {
      String directory = await FilePicker.platform.getDirectoryPath();
      if (directory.notNullAndEmpty()) {
        yield RenameFolderState.selectDirectorySuccess(event.spKey, directory);
      } else {
        yield RenameFolderState.selectDirectoryFail(event.spKey);
      }
    }, rename: (_Rename value) async* {
      yield validateDirectory(
              true, '来源', _directoryStreams[SOURCE_DIRECTORY].value)
          .orElse(() => validateDirectory(
              false, '目标', _directoryStreams[DESTINATION_DIRECTORY].value))
          .getOrElse(() => RenameFolderState.renameSuccess());
    });
  }

  Option<RenameFolderState> validateDirectory(
      bool source, String prefix, String path) {
    FileSystemEntityType fileSystemEntityType = FileSystemEntity.typeSync(path);
    if (fileSystemEntityType == FileSystemEntityType.notFound) {
      return some(RenameFolderState.renameFail(source, '${prefix}文件夹不存在'));
    }
    if (fileSystemEntityType != FileSystemEntityType.directory) {
      return some(RenameFolderState.renameFail(
        source,
        '请选择${prefix}文件夹',
      ));
    }
    return none();
  }

  @override
  Future<void> close() {
    _directoryStreams?.forEach((key, value) {
      value?.close();
    });
    return super.close();
  }
}
