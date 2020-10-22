import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:injectable/injectable.dart';
import 'package:shared_preferences/shared_preferences.dart';

part 'rename_folder_event.dart';
part 'rename_folder_state.dart';
part 'rename_folder_bloc.freezed.dart';

@injectable
class RenameFolderBloc extends Bloc<RenameFolderEvent, RenameFolderState> {
  SharedPreferences sharedPreferences;
  RenameFolderBloc(this.sharedPreferences) : super(_Initial());

  @override
  Stream<RenameFolderState> mapEventToState(
    RenameFolderEvent event,
  ) async* {
    // TODO: implement mapEventToState
  }
}
