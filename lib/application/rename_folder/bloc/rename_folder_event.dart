part of 'rename_folder_bloc.dart';

@freezed
abstract class RenameFolderEvent with _$RenameFolderEvent {
  const factory RenameFolderEvent.getDirectory(String spKey) = _GetDirectory;
  const factory RenameFolderEvent.directoryChange(
      String spKey, String directory) = _DirectoryChange;
  const factory RenameFolderEvent.saveDirectory(
      String spKey, String directory) = _SaveDirectory;
  const factory RenameFolderEvent.selectDirectory(String spKey) =
      _SelectDirectory;
  const factory RenameFolderEvent.rename() = _Rename;
}
