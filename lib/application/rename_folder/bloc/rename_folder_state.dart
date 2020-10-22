part of 'rename_folder_bloc.dart';

@freezed
abstract class RenameFolderState with _$RenameFolderState {
  const factory RenameFolderState.initial() = _Initial;
  const factory RenameFolderState.directoryStorage(
      String spKey, String directory) = _DirectoryStorage;
  const factory RenameFolderState.noMatter() = _NoMatter;
  const factory RenameFolderState.selectDirectorySuccess(
      String spKey, String directory) = _SelectDirectorySuccess;
  const factory RenameFolderState.selectDirectoryFail(String spKey) =
      _SelectDirectoryFail;

  const factory RenameFolderState.renameFail(bool sourceFail, String faileMessage) = _RenameFail;
  const factory RenameFolderState.renameSuccess() = _RenameSuccess;
}
