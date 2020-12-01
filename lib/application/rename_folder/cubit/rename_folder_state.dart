part of 'rename_folder_cubit.dart';

@freezed
abstract class RenameFolderState with _$RenameFolderState {
  const factory RenameFolderState.initial() = _Initial;
  const factory RenameFolderState.directoryStorage(
      String spKey, @nullable String directory) = _DirectoryStorage;
  const factory RenameFolderState.selectDirectorySuccess(
      String spKey, @nullable String directory) = _SelectDirectorySuccess;
  const factory RenameFolderState.valid() = _Valid;
  const factory RenameFolderState.renameFail(String failMessage) = _RenameFail;
  const factory RenameFolderState.renameSuccess() = _RenameSuccess;
  const factory RenameFolderState.renameProcessing() = _RenameProcessing;
}
