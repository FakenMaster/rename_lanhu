part of 'directory_select_cubit.dart';

@freezed
abstract class DirectorySelectState with _$DirectorySelectState {
  const factory DirectorySelectState.initial(@nullable String directory) =
      _Initial;
  const factory DirectorySelectState.fail(String spKey) = _Fail;
  const factory DirectorySelectState.success(
      String spKey, @nullable String directory) = _Directory;
}
