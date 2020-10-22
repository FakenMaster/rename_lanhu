part of 'rename_folder_bloc.dart';

@freezed
abstract class RenameFolderEvent with _$RenameFolderEvent {
  const factory RenameFolderEvent.started() = _Started;
}