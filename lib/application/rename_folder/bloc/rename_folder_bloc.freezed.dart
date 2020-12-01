// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies

part of 'rename_folder_bloc.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

/// @nodoc
class _$RenameFolderEventTearOff {
  const _$RenameFolderEventTearOff();

// ignore: unused_element
  _GetDirectory getDirectory(String spKey) {
    return _GetDirectory(
      spKey,
    );
  }

// ignore: unused_element
  _DirectoryChange directoryChange(String spKey, String directory) {
    return _DirectoryChange(
      spKey,
      directory,
    );
  }

// ignore: unused_element
  _SaveDirectory saveDirectory(String spKey, String directory) {
    return _SaveDirectory(
      spKey,
      directory,
    );
  }

// ignore: unused_element
  _SelectDirectory selectDirectory(String spKey) {
    return _SelectDirectory(
      spKey,
    );
  }

// ignore: unused_element
  _ValidateDirectory validateDirectory() {
    return const _ValidateDirectory();
  }

// ignore: unused_element
  _Rename rename() {
    return const _Rename();
  }
}

/// @nodoc
// ignore: unused_element
const $RenameFolderEvent = _$RenameFolderEventTearOff();

/// @nodoc
mixin _$RenameFolderEvent {
  @optionalTypeArgs
  TResult when<TResult extends Object>({
    @required TResult getDirectory(String spKey),
    @required TResult directoryChange(String spKey, String directory),
    @required TResult saveDirectory(String spKey, String directory),
    @required TResult selectDirectory(String spKey),
    @required TResult validateDirectory(),
    @required TResult rename(),
  });
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object>({
    TResult getDirectory(String spKey),
    TResult directoryChange(String spKey, String directory),
    TResult saveDirectory(String spKey, String directory),
    TResult selectDirectory(String spKey),
    TResult validateDirectory(),
    TResult rename(),
    @required TResult orElse(),
  });
  @optionalTypeArgs
  TResult map<TResult extends Object>({
    @required TResult getDirectory(_GetDirectory value),
    @required TResult directoryChange(_DirectoryChange value),
    @required TResult saveDirectory(_SaveDirectory value),
    @required TResult selectDirectory(_SelectDirectory value),
    @required TResult validateDirectory(_ValidateDirectory value),
    @required TResult rename(_Rename value),
  });
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object>({
    TResult getDirectory(_GetDirectory value),
    TResult directoryChange(_DirectoryChange value),
    TResult saveDirectory(_SaveDirectory value),
    TResult selectDirectory(_SelectDirectory value),
    TResult validateDirectory(_ValidateDirectory value),
    TResult rename(_Rename value),
    @required TResult orElse(),
  });
}

/// @nodoc
abstract class $RenameFolderEventCopyWith<$Res> {
  factory $RenameFolderEventCopyWith(
          RenameFolderEvent value, $Res Function(RenameFolderEvent) then) =
      _$RenameFolderEventCopyWithImpl<$Res>;
}

/// @nodoc
class _$RenameFolderEventCopyWithImpl<$Res>
    implements $RenameFolderEventCopyWith<$Res> {
  _$RenameFolderEventCopyWithImpl(this._value, this._then);

  final RenameFolderEvent _value;
  // ignore: unused_field
  final $Res Function(RenameFolderEvent) _then;
}

/// @nodoc
abstract class _$GetDirectoryCopyWith<$Res> {
  factory _$GetDirectoryCopyWith(
          _GetDirectory value, $Res Function(_GetDirectory) then) =
      __$GetDirectoryCopyWithImpl<$Res>;
  $Res call({String spKey});
}

/// @nodoc
class __$GetDirectoryCopyWithImpl<$Res>
    extends _$RenameFolderEventCopyWithImpl<$Res>
    implements _$GetDirectoryCopyWith<$Res> {
  __$GetDirectoryCopyWithImpl(
      _GetDirectory _value, $Res Function(_GetDirectory) _then)
      : super(_value, (v) => _then(v as _GetDirectory));

  @override
  _GetDirectory get _value => super._value as _GetDirectory;

  @override
  $Res call({
    Object spKey = freezed,
  }) {
    return _then(_GetDirectory(
      spKey == freezed ? _value.spKey : spKey as String,
    ));
  }
}

/// @nodoc
class _$_GetDirectory implements _GetDirectory {
  const _$_GetDirectory(this.spKey) : assert(spKey != null);

  @override
  final String spKey;

  @override
  String toString() {
    return 'RenameFolderEvent.getDirectory(spKey: $spKey)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other is _GetDirectory &&
            (identical(other.spKey, spKey) ||
                const DeepCollectionEquality().equals(other.spKey, spKey)));
  }

  @override
  int get hashCode =>
      runtimeType.hashCode ^ const DeepCollectionEquality().hash(spKey);

  @override
  _$GetDirectoryCopyWith<_GetDirectory> get copyWith =>
      __$GetDirectoryCopyWithImpl<_GetDirectory>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object>({
    @required TResult getDirectory(String spKey),
    @required TResult directoryChange(String spKey, String directory),
    @required TResult saveDirectory(String spKey, String directory),
    @required TResult selectDirectory(String spKey),
    @required TResult validateDirectory(),
    @required TResult rename(),
  }) {
    assert(getDirectory != null);
    assert(directoryChange != null);
    assert(saveDirectory != null);
    assert(selectDirectory != null);
    assert(validateDirectory != null);
    assert(rename != null);
    return getDirectory(spKey);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object>({
    TResult getDirectory(String spKey),
    TResult directoryChange(String spKey, String directory),
    TResult saveDirectory(String spKey, String directory),
    TResult selectDirectory(String spKey),
    TResult validateDirectory(),
    TResult rename(),
    @required TResult orElse(),
  }) {
    assert(orElse != null);
    if (getDirectory != null) {
      return getDirectory(spKey);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object>({
    @required TResult getDirectory(_GetDirectory value),
    @required TResult directoryChange(_DirectoryChange value),
    @required TResult saveDirectory(_SaveDirectory value),
    @required TResult selectDirectory(_SelectDirectory value),
    @required TResult validateDirectory(_ValidateDirectory value),
    @required TResult rename(_Rename value),
  }) {
    assert(getDirectory != null);
    assert(directoryChange != null);
    assert(saveDirectory != null);
    assert(selectDirectory != null);
    assert(validateDirectory != null);
    assert(rename != null);
    return getDirectory(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object>({
    TResult getDirectory(_GetDirectory value),
    TResult directoryChange(_DirectoryChange value),
    TResult saveDirectory(_SaveDirectory value),
    TResult selectDirectory(_SelectDirectory value),
    TResult validateDirectory(_ValidateDirectory value),
    TResult rename(_Rename value),
    @required TResult orElse(),
  }) {
    assert(orElse != null);
    if (getDirectory != null) {
      return getDirectory(this);
    }
    return orElse();
  }
}

abstract class _GetDirectory implements RenameFolderEvent {
  const factory _GetDirectory(String spKey) = _$_GetDirectory;

  String get spKey;
  _$GetDirectoryCopyWith<_GetDirectory> get copyWith;
}

/// @nodoc
abstract class _$DirectoryChangeCopyWith<$Res> {
  factory _$DirectoryChangeCopyWith(
          _DirectoryChange value, $Res Function(_DirectoryChange) then) =
      __$DirectoryChangeCopyWithImpl<$Res>;
  $Res call({String spKey, String directory});
}

/// @nodoc
class __$DirectoryChangeCopyWithImpl<$Res>
    extends _$RenameFolderEventCopyWithImpl<$Res>
    implements _$DirectoryChangeCopyWith<$Res> {
  __$DirectoryChangeCopyWithImpl(
      _DirectoryChange _value, $Res Function(_DirectoryChange) _then)
      : super(_value, (v) => _then(v as _DirectoryChange));

  @override
  _DirectoryChange get _value => super._value as _DirectoryChange;

  @override
  $Res call({
    Object spKey = freezed,
    Object directory = freezed,
  }) {
    return _then(_DirectoryChange(
      spKey == freezed ? _value.spKey : spKey as String,
      directory == freezed ? _value.directory : directory as String,
    ));
  }
}

/// @nodoc
class _$_DirectoryChange implements _DirectoryChange {
  const _$_DirectoryChange(this.spKey, this.directory)
      : assert(spKey != null),
        assert(directory != null);

  @override
  final String spKey;
  @override
  final String directory;

  @override
  String toString() {
    return 'RenameFolderEvent.directoryChange(spKey: $spKey, directory: $directory)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other is _DirectoryChange &&
            (identical(other.spKey, spKey) ||
                const DeepCollectionEquality().equals(other.spKey, spKey)) &&
            (identical(other.directory, directory) ||
                const DeepCollectionEquality()
                    .equals(other.directory, directory)));
  }

  @override
  int get hashCode =>
      runtimeType.hashCode ^
      const DeepCollectionEquality().hash(spKey) ^
      const DeepCollectionEquality().hash(directory);

  @override
  _$DirectoryChangeCopyWith<_DirectoryChange> get copyWith =>
      __$DirectoryChangeCopyWithImpl<_DirectoryChange>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object>({
    @required TResult getDirectory(String spKey),
    @required TResult directoryChange(String spKey, String directory),
    @required TResult saveDirectory(String spKey, String directory),
    @required TResult selectDirectory(String spKey),
    @required TResult validateDirectory(),
    @required TResult rename(),
  }) {
    assert(getDirectory != null);
    assert(directoryChange != null);
    assert(saveDirectory != null);
    assert(selectDirectory != null);
    assert(validateDirectory != null);
    assert(rename != null);
    return directoryChange(spKey, directory);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object>({
    TResult getDirectory(String spKey),
    TResult directoryChange(String spKey, String directory),
    TResult saveDirectory(String spKey, String directory),
    TResult selectDirectory(String spKey),
    TResult validateDirectory(),
    TResult rename(),
    @required TResult orElse(),
  }) {
    assert(orElse != null);
    if (directoryChange != null) {
      return directoryChange(spKey, directory);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object>({
    @required TResult getDirectory(_GetDirectory value),
    @required TResult directoryChange(_DirectoryChange value),
    @required TResult saveDirectory(_SaveDirectory value),
    @required TResult selectDirectory(_SelectDirectory value),
    @required TResult validateDirectory(_ValidateDirectory value),
    @required TResult rename(_Rename value),
  }) {
    assert(getDirectory != null);
    assert(directoryChange != null);
    assert(saveDirectory != null);
    assert(selectDirectory != null);
    assert(validateDirectory != null);
    assert(rename != null);
    return directoryChange(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object>({
    TResult getDirectory(_GetDirectory value),
    TResult directoryChange(_DirectoryChange value),
    TResult saveDirectory(_SaveDirectory value),
    TResult selectDirectory(_SelectDirectory value),
    TResult validateDirectory(_ValidateDirectory value),
    TResult rename(_Rename value),
    @required TResult orElse(),
  }) {
    assert(orElse != null);
    if (directoryChange != null) {
      return directoryChange(this);
    }
    return orElse();
  }
}

abstract class _DirectoryChange implements RenameFolderEvent {
  const factory _DirectoryChange(String spKey, String directory) =
      _$_DirectoryChange;

  String get spKey;
  String get directory;
  _$DirectoryChangeCopyWith<_DirectoryChange> get copyWith;
}

/// @nodoc
abstract class _$SaveDirectoryCopyWith<$Res> {
  factory _$SaveDirectoryCopyWith(
          _SaveDirectory value, $Res Function(_SaveDirectory) then) =
      __$SaveDirectoryCopyWithImpl<$Res>;
  $Res call({String spKey, String directory});
}

/// @nodoc
class __$SaveDirectoryCopyWithImpl<$Res>
    extends _$RenameFolderEventCopyWithImpl<$Res>
    implements _$SaveDirectoryCopyWith<$Res> {
  __$SaveDirectoryCopyWithImpl(
      _SaveDirectory _value, $Res Function(_SaveDirectory) _then)
      : super(_value, (v) => _then(v as _SaveDirectory));

  @override
  _SaveDirectory get _value => super._value as _SaveDirectory;

  @override
  $Res call({
    Object spKey = freezed,
    Object directory = freezed,
  }) {
    return _then(_SaveDirectory(
      spKey == freezed ? _value.spKey : spKey as String,
      directory == freezed ? _value.directory : directory as String,
    ));
  }
}

/// @nodoc
class _$_SaveDirectory implements _SaveDirectory {
  const _$_SaveDirectory(this.spKey, this.directory)
      : assert(spKey != null),
        assert(directory != null);

  @override
  final String spKey;
  @override
  final String directory;

  @override
  String toString() {
    return 'RenameFolderEvent.saveDirectory(spKey: $spKey, directory: $directory)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other is _SaveDirectory &&
            (identical(other.spKey, spKey) ||
                const DeepCollectionEquality().equals(other.spKey, spKey)) &&
            (identical(other.directory, directory) ||
                const DeepCollectionEquality()
                    .equals(other.directory, directory)));
  }

  @override
  int get hashCode =>
      runtimeType.hashCode ^
      const DeepCollectionEquality().hash(spKey) ^
      const DeepCollectionEquality().hash(directory);

  @override
  _$SaveDirectoryCopyWith<_SaveDirectory> get copyWith =>
      __$SaveDirectoryCopyWithImpl<_SaveDirectory>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object>({
    @required TResult getDirectory(String spKey),
    @required TResult directoryChange(String spKey, String directory),
    @required TResult saveDirectory(String spKey, String directory),
    @required TResult selectDirectory(String spKey),
    @required TResult validateDirectory(),
    @required TResult rename(),
  }) {
    assert(getDirectory != null);
    assert(directoryChange != null);
    assert(saveDirectory != null);
    assert(selectDirectory != null);
    assert(validateDirectory != null);
    assert(rename != null);
    return saveDirectory(spKey, directory);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object>({
    TResult getDirectory(String spKey),
    TResult directoryChange(String spKey, String directory),
    TResult saveDirectory(String spKey, String directory),
    TResult selectDirectory(String spKey),
    TResult validateDirectory(),
    TResult rename(),
    @required TResult orElse(),
  }) {
    assert(orElse != null);
    if (saveDirectory != null) {
      return saveDirectory(spKey, directory);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object>({
    @required TResult getDirectory(_GetDirectory value),
    @required TResult directoryChange(_DirectoryChange value),
    @required TResult saveDirectory(_SaveDirectory value),
    @required TResult selectDirectory(_SelectDirectory value),
    @required TResult validateDirectory(_ValidateDirectory value),
    @required TResult rename(_Rename value),
  }) {
    assert(getDirectory != null);
    assert(directoryChange != null);
    assert(saveDirectory != null);
    assert(selectDirectory != null);
    assert(validateDirectory != null);
    assert(rename != null);
    return saveDirectory(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object>({
    TResult getDirectory(_GetDirectory value),
    TResult directoryChange(_DirectoryChange value),
    TResult saveDirectory(_SaveDirectory value),
    TResult selectDirectory(_SelectDirectory value),
    TResult validateDirectory(_ValidateDirectory value),
    TResult rename(_Rename value),
    @required TResult orElse(),
  }) {
    assert(orElse != null);
    if (saveDirectory != null) {
      return saveDirectory(this);
    }
    return orElse();
  }
}

abstract class _SaveDirectory implements RenameFolderEvent {
  const factory _SaveDirectory(String spKey, String directory) =
      _$_SaveDirectory;

  String get spKey;
  String get directory;
  _$SaveDirectoryCopyWith<_SaveDirectory> get copyWith;
}

/// @nodoc
abstract class _$SelectDirectoryCopyWith<$Res> {
  factory _$SelectDirectoryCopyWith(
          _SelectDirectory value, $Res Function(_SelectDirectory) then) =
      __$SelectDirectoryCopyWithImpl<$Res>;
  $Res call({String spKey});
}

/// @nodoc
class __$SelectDirectoryCopyWithImpl<$Res>
    extends _$RenameFolderEventCopyWithImpl<$Res>
    implements _$SelectDirectoryCopyWith<$Res> {
  __$SelectDirectoryCopyWithImpl(
      _SelectDirectory _value, $Res Function(_SelectDirectory) _then)
      : super(_value, (v) => _then(v as _SelectDirectory));

  @override
  _SelectDirectory get _value => super._value as _SelectDirectory;

  @override
  $Res call({
    Object spKey = freezed,
  }) {
    return _then(_SelectDirectory(
      spKey == freezed ? _value.spKey : spKey as String,
    ));
  }
}

/// @nodoc
class _$_SelectDirectory implements _SelectDirectory {
  const _$_SelectDirectory(this.spKey) : assert(spKey != null);

  @override
  final String spKey;

  @override
  String toString() {
    return 'RenameFolderEvent.selectDirectory(spKey: $spKey)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other is _SelectDirectory &&
            (identical(other.spKey, spKey) ||
                const DeepCollectionEquality().equals(other.spKey, spKey)));
  }

  @override
  int get hashCode =>
      runtimeType.hashCode ^ const DeepCollectionEquality().hash(spKey);

  @override
  _$SelectDirectoryCopyWith<_SelectDirectory> get copyWith =>
      __$SelectDirectoryCopyWithImpl<_SelectDirectory>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object>({
    @required TResult getDirectory(String spKey),
    @required TResult directoryChange(String spKey, String directory),
    @required TResult saveDirectory(String spKey, String directory),
    @required TResult selectDirectory(String spKey),
    @required TResult validateDirectory(),
    @required TResult rename(),
  }) {
    assert(getDirectory != null);
    assert(directoryChange != null);
    assert(saveDirectory != null);
    assert(selectDirectory != null);
    assert(validateDirectory != null);
    assert(rename != null);
    return selectDirectory(spKey);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object>({
    TResult getDirectory(String spKey),
    TResult directoryChange(String spKey, String directory),
    TResult saveDirectory(String spKey, String directory),
    TResult selectDirectory(String spKey),
    TResult validateDirectory(),
    TResult rename(),
    @required TResult orElse(),
  }) {
    assert(orElse != null);
    if (selectDirectory != null) {
      return selectDirectory(spKey);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object>({
    @required TResult getDirectory(_GetDirectory value),
    @required TResult directoryChange(_DirectoryChange value),
    @required TResult saveDirectory(_SaveDirectory value),
    @required TResult selectDirectory(_SelectDirectory value),
    @required TResult validateDirectory(_ValidateDirectory value),
    @required TResult rename(_Rename value),
  }) {
    assert(getDirectory != null);
    assert(directoryChange != null);
    assert(saveDirectory != null);
    assert(selectDirectory != null);
    assert(validateDirectory != null);
    assert(rename != null);
    return selectDirectory(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object>({
    TResult getDirectory(_GetDirectory value),
    TResult directoryChange(_DirectoryChange value),
    TResult saveDirectory(_SaveDirectory value),
    TResult selectDirectory(_SelectDirectory value),
    TResult validateDirectory(_ValidateDirectory value),
    TResult rename(_Rename value),
    @required TResult orElse(),
  }) {
    assert(orElse != null);
    if (selectDirectory != null) {
      return selectDirectory(this);
    }
    return orElse();
  }
}

abstract class _SelectDirectory implements RenameFolderEvent {
  const factory _SelectDirectory(String spKey) = _$_SelectDirectory;

  String get spKey;
  _$SelectDirectoryCopyWith<_SelectDirectory> get copyWith;
}

/// @nodoc
abstract class _$ValidateDirectoryCopyWith<$Res> {
  factory _$ValidateDirectoryCopyWith(
          _ValidateDirectory value, $Res Function(_ValidateDirectory) then) =
      __$ValidateDirectoryCopyWithImpl<$Res>;
}

/// @nodoc
class __$ValidateDirectoryCopyWithImpl<$Res>
    extends _$RenameFolderEventCopyWithImpl<$Res>
    implements _$ValidateDirectoryCopyWith<$Res> {
  __$ValidateDirectoryCopyWithImpl(
      _ValidateDirectory _value, $Res Function(_ValidateDirectory) _then)
      : super(_value, (v) => _then(v as _ValidateDirectory));

  @override
  _ValidateDirectory get _value => super._value as _ValidateDirectory;
}

/// @nodoc
class _$_ValidateDirectory implements _ValidateDirectory {
  const _$_ValidateDirectory();

  @override
  String toString() {
    return 'RenameFolderEvent.validateDirectory()';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) || (other is _ValidateDirectory);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object>({
    @required TResult getDirectory(String spKey),
    @required TResult directoryChange(String spKey, String directory),
    @required TResult saveDirectory(String spKey, String directory),
    @required TResult selectDirectory(String spKey),
    @required TResult validateDirectory(),
    @required TResult rename(),
  }) {
    assert(getDirectory != null);
    assert(directoryChange != null);
    assert(saveDirectory != null);
    assert(selectDirectory != null);
    assert(validateDirectory != null);
    assert(rename != null);
    return validateDirectory();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object>({
    TResult getDirectory(String spKey),
    TResult directoryChange(String spKey, String directory),
    TResult saveDirectory(String spKey, String directory),
    TResult selectDirectory(String spKey),
    TResult validateDirectory(),
    TResult rename(),
    @required TResult orElse(),
  }) {
    assert(orElse != null);
    if (validateDirectory != null) {
      return validateDirectory();
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object>({
    @required TResult getDirectory(_GetDirectory value),
    @required TResult directoryChange(_DirectoryChange value),
    @required TResult saveDirectory(_SaveDirectory value),
    @required TResult selectDirectory(_SelectDirectory value),
    @required TResult validateDirectory(_ValidateDirectory value),
    @required TResult rename(_Rename value),
  }) {
    assert(getDirectory != null);
    assert(directoryChange != null);
    assert(saveDirectory != null);
    assert(selectDirectory != null);
    assert(validateDirectory != null);
    assert(rename != null);
    return validateDirectory(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object>({
    TResult getDirectory(_GetDirectory value),
    TResult directoryChange(_DirectoryChange value),
    TResult saveDirectory(_SaveDirectory value),
    TResult selectDirectory(_SelectDirectory value),
    TResult validateDirectory(_ValidateDirectory value),
    TResult rename(_Rename value),
    @required TResult orElse(),
  }) {
    assert(orElse != null);
    if (validateDirectory != null) {
      return validateDirectory(this);
    }
    return orElse();
  }
}

abstract class _ValidateDirectory implements RenameFolderEvent {
  const factory _ValidateDirectory() = _$_ValidateDirectory;
}

/// @nodoc
abstract class _$RenameCopyWith<$Res> {
  factory _$RenameCopyWith(_Rename value, $Res Function(_Rename) then) =
      __$RenameCopyWithImpl<$Res>;
}

/// @nodoc
class __$RenameCopyWithImpl<$Res> extends _$RenameFolderEventCopyWithImpl<$Res>
    implements _$RenameCopyWith<$Res> {
  __$RenameCopyWithImpl(_Rename _value, $Res Function(_Rename) _then)
      : super(_value, (v) => _then(v as _Rename));

  @override
  _Rename get _value => super._value as _Rename;
}

/// @nodoc
class _$_Rename implements _Rename {
  const _$_Rename();

  @override
  String toString() {
    return 'RenameFolderEvent.rename()';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) || (other is _Rename);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object>({
    @required TResult getDirectory(String spKey),
    @required TResult directoryChange(String spKey, String directory),
    @required TResult saveDirectory(String spKey, String directory),
    @required TResult selectDirectory(String spKey),
    @required TResult validateDirectory(),
    @required TResult rename(),
  }) {
    assert(getDirectory != null);
    assert(directoryChange != null);
    assert(saveDirectory != null);
    assert(selectDirectory != null);
    assert(validateDirectory != null);
    assert(rename != null);
    return rename();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object>({
    TResult getDirectory(String spKey),
    TResult directoryChange(String spKey, String directory),
    TResult saveDirectory(String spKey, String directory),
    TResult selectDirectory(String spKey),
    TResult validateDirectory(),
    TResult rename(),
    @required TResult orElse(),
  }) {
    assert(orElse != null);
    if (rename != null) {
      return rename();
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object>({
    @required TResult getDirectory(_GetDirectory value),
    @required TResult directoryChange(_DirectoryChange value),
    @required TResult saveDirectory(_SaveDirectory value),
    @required TResult selectDirectory(_SelectDirectory value),
    @required TResult validateDirectory(_ValidateDirectory value),
    @required TResult rename(_Rename value),
  }) {
    assert(getDirectory != null);
    assert(directoryChange != null);
    assert(saveDirectory != null);
    assert(selectDirectory != null);
    assert(validateDirectory != null);
    assert(rename != null);
    return rename(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object>({
    TResult getDirectory(_GetDirectory value),
    TResult directoryChange(_DirectoryChange value),
    TResult saveDirectory(_SaveDirectory value),
    TResult selectDirectory(_SelectDirectory value),
    TResult validateDirectory(_ValidateDirectory value),
    TResult rename(_Rename value),
    @required TResult orElse(),
  }) {
    assert(orElse != null);
    if (rename != null) {
      return rename(this);
    }
    return orElse();
  }
}

abstract class _Rename implements RenameFolderEvent {
  const factory _Rename() = _$_Rename;
}

/// @nodoc
class _$RenameFolderStateTearOff {
  const _$RenameFolderStateTearOff();

// ignore: unused_element
  _Initial initial() {
    return const _Initial();
  }

// ignore: unused_element
  _DirectoryStorage directoryStorage(String spKey, String directory) {
    return _DirectoryStorage(
      spKey,
      directory,
    );
  }

// ignore: unused_element
  _NoMatter noMatter() {
    return const _NoMatter();
  }

// ignore: unused_element
  _SelectDirectorySuccess selectDirectorySuccess(
      String spKey, String directory) {
    return _SelectDirectorySuccess(
      spKey,
      directory,
    );
  }

// ignore: unused_element
  _SelectDirectoryFail selectDirectoryFail(String spKey) {
    return _SelectDirectoryFail(
      spKey,
    );
  }

// ignore: unused_element
  _Valid valid() {
    return const _Valid();
  }

// ignore: unused_element
  _RenameFail renameFail(String failMessage) {
    return _RenameFail(
      failMessage,
    );
  }

// ignore: unused_element
  _RenameSuccess renameSuccess() {
    return const _RenameSuccess();
  }

// ignore: unused_element
  _RenameProcessing renameProcessing() {
    return const _RenameProcessing();
  }
}

/// @nodoc
// ignore: unused_element
const $RenameFolderState = _$RenameFolderStateTearOff();

/// @nodoc
mixin _$RenameFolderState {
  @optionalTypeArgs
  TResult when<TResult extends Object>({
    @required TResult initial(),
    @required TResult directoryStorage(String spKey, String directory),
    @required TResult noMatter(),
    @required TResult selectDirectorySuccess(String spKey, String directory),
    @required TResult selectDirectoryFail(String spKey),
    @required TResult valid(),
    @required TResult renameFail(String failMessage),
    @required TResult renameSuccess(),
    @required TResult renameProcessing(),
  });
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object>({
    TResult initial(),
    TResult directoryStorage(String spKey, String directory),
    TResult noMatter(),
    TResult selectDirectorySuccess(String spKey, String directory),
    TResult selectDirectoryFail(String spKey),
    TResult valid(),
    TResult renameFail(String failMessage),
    TResult renameSuccess(),
    TResult renameProcessing(),
    @required TResult orElse(),
  });
  @optionalTypeArgs
  TResult map<TResult extends Object>({
    @required TResult initial(_Initial value),
    @required TResult directoryStorage(_DirectoryStorage value),
    @required TResult noMatter(_NoMatter value),
    @required TResult selectDirectorySuccess(_SelectDirectorySuccess value),
    @required TResult selectDirectoryFail(_SelectDirectoryFail value),
    @required TResult valid(_Valid value),
    @required TResult renameFail(_RenameFail value),
    @required TResult renameSuccess(_RenameSuccess value),
    @required TResult renameProcessing(_RenameProcessing value),
  });
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object>({
    TResult initial(_Initial value),
    TResult directoryStorage(_DirectoryStorage value),
    TResult noMatter(_NoMatter value),
    TResult selectDirectorySuccess(_SelectDirectorySuccess value),
    TResult selectDirectoryFail(_SelectDirectoryFail value),
    TResult valid(_Valid value),
    TResult renameFail(_RenameFail value),
    TResult renameSuccess(_RenameSuccess value),
    TResult renameProcessing(_RenameProcessing value),
    @required TResult orElse(),
  });
}

/// @nodoc
abstract class $RenameFolderStateCopyWith<$Res> {
  factory $RenameFolderStateCopyWith(
          RenameFolderState value, $Res Function(RenameFolderState) then) =
      _$RenameFolderStateCopyWithImpl<$Res>;
}

/// @nodoc
class _$RenameFolderStateCopyWithImpl<$Res>
    implements $RenameFolderStateCopyWith<$Res> {
  _$RenameFolderStateCopyWithImpl(this._value, this._then);

  final RenameFolderState _value;
  // ignore: unused_field
  final $Res Function(RenameFolderState) _then;
}

/// @nodoc
abstract class _$InitialCopyWith<$Res> {
  factory _$InitialCopyWith(_Initial value, $Res Function(_Initial) then) =
      __$InitialCopyWithImpl<$Res>;
}

/// @nodoc
class __$InitialCopyWithImpl<$Res> extends _$RenameFolderStateCopyWithImpl<$Res>
    implements _$InitialCopyWith<$Res> {
  __$InitialCopyWithImpl(_Initial _value, $Res Function(_Initial) _then)
      : super(_value, (v) => _then(v as _Initial));

  @override
  _Initial get _value => super._value as _Initial;
}

/// @nodoc
class _$_Initial implements _Initial {
  const _$_Initial();

  @override
  String toString() {
    return 'RenameFolderState.initial()';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) || (other is _Initial);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object>({
    @required TResult initial(),
    @required TResult directoryStorage(String spKey, String directory),
    @required TResult noMatter(),
    @required TResult selectDirectorySuccess(String spKey, String directory),
    @required TResult selectDirectoryFail(String spKey),
    @required TResult valid(),
    @required TResult renameFail(String failMessage),
    @required TResult renameSuccess(),
    @required TResult renameProcessing(),
  }) {
    assert(initial != null);
    assert(directoryStorage != null);
    assert(noMatter != null);
    assert(selectDirectorySuccess != null);
    assert(selectDirectoryFail != null);
    assert(valid != null);
    assert(renameFail != null);
    assert(renameSuccess != null);
    assert(renameProcessing != null);
    return initial();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object>({
    TResult initial(),
    TResult directoryStorage(String spKey, String directory),
    TResult noMatter(),
    TResult selectDirectorySuccess(String spKey, String directory),
    TResult selectDirectoryFail(String spKey),
    TResult valid(),
    TResult renameFail(String failMessage),
    TResult renameSuccess(),
    TResult renameProcessing(),
    @required TResult orElse(),
  }) {
    assert(orElse != null);
    if (initial != null) {
      return initial();
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object>({
    @required TResult initial(_Initial value),
    @required TResult directoryStorage(_DirectoryStorage value),
    @required TResult noMatter(_NoMatter value),
    @required TResult selectDirectorySuccess(_SelectDirectorySuccess value),
    @required TResult selectDirectoryFail(_SelectDirectoryFail value),
    @required TResult valid(_Valid value),
    @required TResult renameFail(_RenameFail value),
    @required TResult renameSuccess(_RenameSuccess value),
    @required TResult renameProcessing(_RenameProcessing value),
  }) {
    assert(initial != null);
    assert(directoryStorage != null);
    assert(noMatter != null);
    assert(selectDirectorySuccess != null);
    assert(selectDirectoryFail != null);
    assert(valid != null);
    assert(renameFail != null);
    assert(renameSuccess != null);
    assert(renameProcessing != null);
    return initial(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object>({
    TResult initial(_Initial value),
    TResult directoryStorage(_DirectoryStorage value),
    TResult noMatter(_NoMatter value),
    TResult selectDirectorySuccess(_SelectDirectorySuccess value),
    TResult selectDirectoryFail(_SelectDirectoryFail value),
    TResult valid(_Valid value),
    TResult renameFail(_RenameFail value),
    TResult renameSuccess(_RenameSuccess value),
    TResult renameProcessing(_RenameProcessing value),
    @required TResult orElse(),
  }) {
    assert(orElse != null);
    if (initial != null) {
      return initial(this);
    }
    return orElse();
  }
}

abstract class _Initial implements RenameFolderState {
  const factory _Initial() = _$_Initial;
}

/// @nodoc
abstract class _$DirectoryStorageCopyWith<$Res> {
  factory _$DirectoryStorageCopyWith(
          _DirectoryStorage value, $Res Function(_DirectoryStorage) then) =
      __$DirectoryStorageCopyWithImpl<$Res>;
  $Res call({String spKey, String directory});
}

/// @nodoc
class __$DirectoryStorageCopyWithImpl<$Res>
    extends _$RenameFolderStateCopyWithImpl<$Res>
    implements _$DirectoryStorageCopyWith<$Res> {
  __$DirectoryStorageCopyWithImpl(
      _DirectoryStorage _value, $Res Function(_DirectoryStorage) _then)
      : super(_value, (v) => _then(v as _DirectoryStorage));

  @override
  _DirectoryStorage get _value => super._value as _DirectoryStorage;

  @override
  $Res call({
    Object spKey = freezed,
    Object directory = freezed,
  }) {
    return _then(_DirectoryStorage(
      spKey == freezed ? _value.spKey : spKey as String,
      directory == freezed ? _value.directory : directory as String,
    ));
  }
}

/// @nodoc
class _$_DirectoryStorage implements _DirectoryStorage {
  const _$_DirectoryStorage(this.spKey, this.directory)
      : assert(spKey != null),
        assert(directory != null);

  @override
  final String spKey;
  @override
  final String directory;

  @override
  String toString() {
    return 'RenameFolderState.directoryStorage(spKey: $spKey, directory: $directory)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other is _DirectoryStorage &&
            (identical(other.spKey, spKey) ||
                const DeepCollectionEquality().equals(other.spKey, spKey)) &&
            (identical(other.directory, directory) ||
                const DeepCollectionEquality()
                    .equals(other.directory, directory)));
  }

  @override
  int get hashCode =>
      runtimeType.hashCode ^
      const DeepCollectionEquality().hash(spKey) ^
      const DeepCollectionEquality().hash(directory);

  @override
  _$DirectoryStorageCopyWith<_DirectoryStorage> get copyWith =>
      __$DirectoryStorageCopyWithImpl<_DirectoryStorage>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object>({
    @required TResult initial(),
    @required TResult directoryStorage(String spKey, String directory),
    @required TResult noMatter(),
    @required TResult selectDirectorySuccess(String spKey, String directory),
    @required TResult selectDirectoryFail(String spKey),
    @required TResult valid(),
    @required TResult renameFail(String failMessage),
    @required TResult renameSuccess(),
    @required TResult renameProcessing(),
  }) {
    assert(initial != null);
    assert(directoryStorage != null);
    assert(noMatter != null);
    assert(selectDirectorySuccess != null);
    assert(selectDirectoryFail != null);
    assert(valid != null);
    assert(renameFail != null);
    assert(renameSuccess != null);
    assert(renameProcessing != null);
    return directoryStorage(spKey, directory);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object>({
    TResult initial(),
    TResult directoryStorage(String spKey, String directory),
    TResult noMatter(),
    TResult selectDirectorySuccess(String spKey, String directory),
    TResult selectDirectoryFail(String spKey),
    TResult valid(),
    TResult renameFail(String failMessage),
    TResult renameSuccess(),
    TResult renameProcessing(),
    @required TResult orElse(),
  }) {
    assert(orElse != null);
    if (directoryStorage != null) {
      return directoryStorage(spKey, directory);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object>({
    @required TResult initial(_Initial value),
    @required TResult directoryStorage(_DirectoryStorage value),
    @required TResult noMatter(_NoMatter value),
    @required TResult selectDirectorySuccess(_SelectDirectorySuccess value),
    @required TResult selectDirectoryFail(_SelectDirectoryFail value),
    @required TResult valid(_Valid value),
    @required TResult renameFail(_RenameFail value),
    @required TResult renameSuccess(_RenameSuccess value),
    @required TResult renameProcessing(_RenameProcessing value),
  }) {
    assert(initial != null);
    assert(directoryStorage != null);
    assert(noMatter != null);
    assert(selectDirectorySuccess != null);
    assert(selectDirectoryFail != null);
    assert(valid != null);
    assert(renameFail != null);
    assert(renameSuccess != null);
    assert(renameProcessing != null);
    return directoryStorage(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object>({
    TResult initial(_Initial value),
    TResult directoryStorage(_DirectoryStorage value),
    TResult noMatter(_NoMatter value),
    TResult selectDirectorySuccess(_SelectDirectorySuccess value),
    TResult selectDirectoryFail(_SelectDirectoryFail value),
    TResult valid(_Valid value),
    TResult renameFail(_RenameFail value),
    TResult renameSuccess(_RenameSuccess value),
    TResult renameProcessing(_RenameProcessing value),
    @required TResult orElse(),
  }) {
    assert(orElse != null);
    if (directoryStorage != null) {
      return directoryStorage(this);
    }
    return orElse();
  }
}

abstract class _DirectoryStorage implements RenameFolderState {
  const factory _DirectoryStorage(String spKey, String directory) =
      _$_DirectoryStorage;

  String get spKey;
  String get directory;
  _$DirectoryStorageCopyWith<_DirectoryStorage> get copyWith;
}

/// @nodoc
abstract class _$NoMatterCopyWith<$Res> {
  factory _$NoMatterCopyWith(_NoMatter value, $Res Function(_NoMatter) then) =
      __$NoMatterCopyWithImpl<$Res>;
}

/// @nodoc
class __$NoMatterCopyWithImpl<$Res>
    extends _$RenameFolderStateCopyWithImpl<$Res>
    implements _$NoMatterCopyWith<$Res> {
  __$NoMatterCopyWithImpl(_NoMatter _value, $Res Function(_NoMatter) _then)
      : super(_value, (v) => _then(v as _NoMatter));

  @override
  _NoMatter get _value => super._value as _NoMatter;
}

/// @nodoc
class _$_NoMatter implements _NoMatter {
  const _$_NoMatter();

  @override
  String toString() {
    return 'RenameFolderState.noMatter()';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) || (other is _NoMatter);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object>({
    @required TResult initial(),
    @required TResult directoryStorage(String spKey, String directory),
    @required TResult noMatter(),
    @required TResult selectDirectorySuccess(String spKey, String directory),
    @required TResult selectDirectoryFail(String spKey),
    @required TResult valid(),
    @required TResult renameFail(String failMessage),
    @required TResult renameSuccess(),
    @required TResult renameProcessing(),
  }) {
    assert(initial != null);
    assert(directoryStorage != null);
    assert(noMatter != null);
    assert(selectDirectorySuccess != null);
    assert(selectDirectoryFail != null);
    assert(valid != null);
    assert(renameFail != null);
    assert(renameSuccess != null);
    assert(renameProcessing != null);
    return noMatter();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object>({
    TResult initial(),
    TResult directoryStorage(String spKey, String directory),
    TResult noMatter(),
    TResult selectDirectorySuccess(String spKey, String directory),
    TResult selectDirectoryFail(String spKey),
    TResult valid(),
    TResult renameFail(String failMessage),
    TResult renameSuccess(),
    TResult renameProcessing(),
    @required TResult orElse(),
  }) {
    assert(orElse != null);
    if (noMatter != null) {
      return noMatter();
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object>({
    @required TResult initial(_Initial value),
    @required TResult directoryStorage(_DirectoryStorage value),
    @required TResult noMatter(_NoMatter value),
    @required TResult selectDirectorySuccess(_SelectDirectorySuccess value),
    @required TResult selectDirectoryFail(_SelectDirectoryFail value),
    @required TResult valid(_Valid value),
    @required TResult renameFail(_RenameFail value),
    @required TResult renameSuccess(_RenameSuccess value),
    @required TResult renameProcessing(_RenameProcessing value),
  }) {
    assert(initial != null);
    assert(directoryStorage != null);
    assert(noMatter != null);
    assert(selectDirectorySuccess != null);
    assert(selectDirectoryFail != null);
    assert(valid != null);
    assert(renameFail != null);
    assert(renameSuccess != null);
    assert(renameProcessing != null);
    return noMatter(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object>({
    TResult initial(_Initial value),
    TResult directoryStorage(_DirectoryStorage value),
    TResult noMatter(_NoMatter value),
    TResult selectDirectorySuccess(_SelectDirectorySuccess value),
    TResult selectDirectoryFail(_SelectDirectoryFail value),
    TResult valid(_Valid value),
    TResult renameFail(_RenameFail value),
    TResult renameSuccess(_RenameSuccess value),
    TResult renameProcessing(_RenameProcessing value),
    @required TResult orElse(),
  }) {
    assert(orElse != null);
    if (noMatter != null) {
      return noMatter(this);
    }
    return orElse();
  }
}

abstract class _NoMatter implements RenameFolderState {
  const factory _NoMatter() = _$_NoMatter;
}

/// @nodoc
abstract class _$SelectDirectorySuccessCopyWith<$Res> {
  factory _$SelectDirectorySuccessCopyWith(_SelectDirectorySuccess value,
          $Res Function(_SelectDirectorySuccess) then) =
      __$SelectDirectorySuccessCopyWithImpl<$Res>;
  $Res call({String spKey, String directory});
}

/// @nodoc
class __$SelectDirectorySuccessCopyWithImpl<$Res>
    extends _$RenameFolderStateCopyWithImpl<$Res>
    implements _$SelectDirectorySuccessCopyWith<$Res> {
  __$SelectDirectorySuccessCopyWithImpl(_SelectDirectorySuccess _value,
      $Res Function(_SelectDirectorySuccess) _then)
      : super(_value, (v) => _then(v as _SelectDirectorySuccess));

  @override
  _SelectDirectorySuccess get _value => super._value as _SelectDirectorySuccess;

  @override
  $Res call({
    Object spKey = freezed,
    Object directory = freezed,
  }) {
    return _then(_SelectDirectorySuccess(
      spKey == freezed ? _value.spKey : spKey as String,
      directory == freezed ? _value.directory : directory as String,
    ));
  }
}

/// @nodoc
class _$_SelectDirectorySuccess implements _SelectDirectorySuccess {
  const _$_SelectDirectorySuccess(this.spKey, this.directory)
      : assert(spKey != null),
        assert(directory != null);

  @override
  final String spKey;
  @override
  final String directory;

  @override
  String toString() {
    return 'RenameFolderState.selectDirectorySuccess(spKey: $spKey, directory: $directory)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other is _SelectDirectorySuccess &&
            (identical(other.spKey, spKey) ||
                const DeepCollectionEquality().equals(other.spKey, spKey)) &&
            (identical(other.directory, directory) ||
                const DeepCollectionEquality()
                    .equals(other.directory, directory)));
  }

  @override
  int get hashCode =>
      runtimeType.hashCode ^
      const DeepCollectionEquality().hash(spKey) ^
      const DeepCollectionEquality().hash(directory);

  @override
  _$SelectDirectorySuccessCopyWith<_SelectDirectorySuccess> get copyWith =>
      __$SelectDirectorySuccessCopyWithImpl<_SelectDirectorySuccess>(
          this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object>({
    @required TResult initial(),
    @required TResult directoryStorage(String spKey, String directory),
    @required TResult noMatter(),
    @required TResult selectDirectorySuccess(String spKey, String directory),
    @required TResult selectDirectoryFail(String spKey),
    @required TResult valid(),
    @required TResult renameFail(String failMessage),
    @required TResult renameSuccess(),
    @required TResult renameProcessing(),
  }) {
    assert(initial != null);
    assert(directoryStorage != null);
    assert(noMatter != null);
    assert(selectDirectorySuccess != null);
    assert(selectDirectoryFail != null);
    assert(valid != null);
    assert(renameFail != null);
    assert(renameSuccess != null);
    assert(renameProcessing != null);
    return selectDirectorySuccess(spKey, directory);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object>({
    TResult initial(),
    TResult directoryStorage(String spKey, String directory),
    TResult noMatter(),
    TResult selectDirectorySuccess(String spKey, String directory),
    TResult selectDirectoryFail(String spKey),
    TResult valid(),
    TResult renameFail(String failMessage),
    TResult renameSuccess(),
    TResult renameProcessing(),
    @required TResult orElse(),
  }) {
    assert(orElse != null);
    if (selectDirectorySuccess != null) {
      return selectDirectorySuccess(spKey, directory);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object>({
    @required TResult initial(_Initial value),
    @required TResult directoryStorage(_DirectoryStorage value),
    @required TResult noMatter(_NoMatter value),
    @required TResult selectDirectorySuccess(_SelectDirectorySuccess value),
    @required TResult selectDirectoryFail(_SelectDirectoryFail value),
    @required TResult valid(_Valid value),
    @required TResult renameFail(_RenameFail value),
    @required TResult renameSuccess(_RenameSuccess value),
    @required TResult renameProcessing(_RenameProcessing value),
  }) {
    assert(initial != null);
    assert(directoryStorage != null);
    assert(noMatter != null);
    assert(selectDirectorySuccess != null);
    assert(selectDirectoryFail != null);
    assert(valid != null);
    assert(renameFail != null);
    assert(renameSuccess != null);
    assert(renameProcessing != null);
    return selectDirectorySuccess(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object>({
    TResult initial(_Initial value),
    TResult directoryStorage(_DirectoryStorage value),
    TResult noMatter(_NoMatter value),
    TResult selectDirectorySuccess(_SelectDirectorySuccess value),
    TResult selectDirectoryFail(_SelectDirectoryFail value),
    TResult valid(_Valid value),
    TResult renameFail(_RenameFail value),
    TResult renameSuccess(_RenameSuccess value),
    TResult renameProcessing(_RenameProcessing value),
    @required TResult orElse(),
  }) {
    assert(orElse != null);
    if (selectDirectorySuccess != null) {
      return selectDirectorySuccess(this);
    }
    return orElse();
  }
}

abstract class _SelectDirectorySuccess implements RenameFolderState {
  const factory _SelectDirectorySuccess(String spKey, String directory) =
      _$_SelectDirectorySuccess;

  String get spKey;
  String get directory;
  _$SelectDirectorySuccessCopyWith<_SelectDirectorySuccess> get copyWith;
}

/// @nodoc
abstract class _$SelectDirectoryFailCopyWith<$Res> {
  factory _$SelectDirectoryFailCopyWith(_SelectDirectoryFail value,
          $Res Function(_SelectDirectoryFail) then) =
      __$SelectDirectoryFailCopyWithImpl<$Res>;
  $Res call({String spKey});
}

/// @nodoc
class __$SelectDirectoryFailCopyWithImpl<$Res>
    extends _$RenameFolderStateCopyWithImpl<$Res>
    implements _$SelectDirectoryFailCopyWith<$Res> {
  __$SelectDirectoryFailCopyWithImpl(
      _SelectDirectoryFail _value, $Res Function(_SelectDirectoryFail) _then)
      : super(_value, (v) => _then(v as _SelectDirectoryFail));

  @override
  _SelectDirectoryFail get _value => super._value as _SelectDirectoryFail;

  @override
  $Res call({
    Object spKey = freezed,
  }) {
    return _then(_SelectDirectoryFail(
      spKey == freezed ? _value.spKey : spKey as String,
    ));
  }
}

/// @nodoc
class _$_SelectDirectoryFail implements _SelectDirectoryFail {
  const _$_SelectDirectoryFail(this.spKey) : assert(spKey != null);

  @override
  final String spKey;

  @override
  String toString() {
    return 'RenameFolderState.selectDirectoryFail(spKey: $spKey)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other is _SelectDirectoryFail &&
            (identical(other.spKey, spKey) ||
                const DeepCollectionEquality().equals(other.spKey, spKey)));
  }

  @override
  int get hashCode =>
      runtimeType.hashCode ^ const DeepCollectionEquality().hash(spKey);

  @override
  _$SelectDirectoryFailCopyWith<_SelectDirectoryFail> get copyWith =>
      __$SelectDirectoryFailCopyWithImpl<_SelectDirectoryFail>(
          this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object>({
    @required TResult initial(),
    @required TResult directoryStorage(String spKey, String directory),
    @required TResult noMatter(),
    @required TResult selectDirectorySuccess(String spKey, String directory),
    @required TResult selectDirectoryFail(String spKey),
    @required TResult valid(),
    @required TResult renameFail(String failMessage),
    @required TResult renameSuccess(),
    @required TResult renameProcessing(),
  }) {
    assert(initial != null);
    assert(directoryStorage != null);
    assert(noMatter != null);
    assert(selectDirectorySuccess != null);
    assert(selectDirectoryFail != null);
    assert(valid != null);
    assert(renameFail != null);
    assert(renameSuccess != null);
    assert(renameProcessing != null);
    return selectDirectoryFail(spKey);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object>({
    TResult initial(),
    TResult directoryStorage(String spKey, String directory),
    TResult noMatter(),
    TResult selectDirectorySuccess(String spKey, String directory),
    TResult selectDirectoryFail(String spKey),
    TResult valid(),
    TResult renameFail(String failMessage),
    TResult renameSuccess(),
    TResult renameProcessing(),
    @required TResult orElse(),
  }) {
    assert(orElse != null);
    if (selectDirectoryFail != null) {
      return selectDirectoryFail(spKey);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object>({
    @required TResult initial(_Initial value),
    @required TResult directoryStorage(_DirectoryStorage value),
    @required TResult noMatter(_NoMatter value),
    @required TResult selectDirectorySuccess(_SelectDirectorySuccess value),
    @required TResult selectDirectoryFail(_SelectDirectoryFail value),
    @required TResult valid(_Valid value),
    @required TResult renameFail(_RenameFail value),
    @required TResult renameSuccess(_RenameSuccess value),
    @required TResult renameProcessing(_RenameProcessing value),
  }) {
    assert(initial != null);
    assert(directoryStorage != null);
    assert(noMatter != null);
    assert(selectDirectorySuccess != null);
    assert(selectDirectoryFail != null);
    assert(valid != null);
    assert(renameFail != null);
    assert(renameSuccess != null);
    assert(renameProcessing != null);
    return selectDirectoryFail(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object>({
    TResult initial(_Initial value),
    TResult directoryStorage(_DirectoryStorage value),
    TResult noMatter(_NoMatter value),
    TResult selectDirectorySuccess(_SelectDirectorySuccess value),
    TResult selectDirectoryFail(_SelectDirectoryFail value),
    TResult valid(_Valid value),
    TResult renameFail(_RenameFail value),
    TResult renameSuccess(_RenameSuccess value),
    TResult renameProcessing(_RenameProcessing value),
    @required TResult orElse(),
  }) {
    assert(orElse != null);
    if (selectDirectoryFail != null) {
      return selectDirectoryFail(this);
    }
    return orElse();
  }
}

abstract class _SelectDirectoryFail implements RenameFolderState {
  const factory _SelectDirectoryFail(String spKey) = _$_SelectDirectoryFail;

  String get spKey;
  _$SelectDirectoryFailCopyWith<_SelectDirectoryFail> get copyWith;
}

/// @nodoc
abstract class _$ValidCopyWith<$Res> {
  factory _$ValidCopyWith(_Valid value, $Res Function(_Valid) then) =
      __$ValidCopyWithImpl<$Res>;
}

/// @nodoc
class __$ValidCopyWithImpl<$Res> extends _$RenameFolderStateCopyWithImpl<$Res>
    implements _$ValidCopyWith<$Res> {
  __$ValidCopyWithImpl(_Valid _value, $Res Function(_Valid) _then)
      : super(_value, (v) => _then(v as _Valid));

  @override
  _Valid get _value => super._value as _Valid;
}

/// @nodoc
class _$_Valid implements _Valid {
  const _$_Valid();

  @override
  String toString() {
    return 'RenameFolderState.valid()';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) || (other is _Valid);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object>({
    @required TResult initial(),
    @required TResult directoryStorage(String spKey, String directory),
    @required TResult noMatter(),
    @required TResult selectDirectorySuccess(String spKey, String directory),
    @required TResult selectDirectoryFail(String spKey),
    @required TResult valid(),
    @required TResult renameFail(String failMessage),
    @required TResult renameSuccess(),
    @required TResult renameProcessing(),
  }) {
    assert(initial != null);
    assert(directoryStorage != null);
    assert(noMatter != null);
    assert(selectDirectorySuccess != null);
    assert(selectDirectoryFail != null);
    assert(valid != null);
    assert(renameFail != null);
    assert(renameSuccess != null);
    assert(renameProcessing != null);
    return valid();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object>({
    TResult initial(),
    TResult directoryStorage(String spKey, String directory),
    TResult noMatter(),
    TResult selectDirectorySuccess(String spKey, String directory),
    TResult selectDirectoryFail(String spKey),
    TResult valid(),
    TResult renameFail(String failMessage),
    TResult renameSuccess(),
    TResult renameProcessing(),
    @required TResult orElse(),
  }) {
    assert(orElse != null);
    if (valid != null) {
      return valid();
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object>({
    @required TResult initial(_Initial value),
    @required TResult directoryStorage(_DirectoryStorage value),
    @required TResult noMatter(_NoMatter value),
    @required TResult selectDirectorySuccess(_SelectDirectorySuccess value),
    @required TResult selectDirectoryFail(_SelectDirectoryFail value),
    @required TResult valid(_Valid value),
    @required TResult renameFail(_RenameFail value),
    @required TResult renameSuccess(_RenameSuccess value),
    @required TResult renameProcessing(_RenameProcessing value),
  }) {
    assert(initial != null);
    assert(directoryStorage != null);
    assert(noMatter != null);
    assert(selectDirectorySuccess != null);
    assert(selectDirectoryFail != null);
    assert(valid != null);
    assert(renameFail != null);
    assert(renameSuccess != null);
    assert(renameProcessing != null);
    return valid(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object>({
    TResult initial(_Initial value),
    TResult directoryStorage(_DirectoryStorage value),
    TResult noMatter(_NoMatter value),
    TResult selectDirectorySuccess(_SelectDirectorySuccess value),
    TResult selectDirectoryFail(_SelectDirectoryFail value),
    TResult valid(_Valid value),
    TResult renameFail(_RenameFail value),
    TResult renameSuccess(_RenameSuccess value),
    TResult renameProcessing(_RenameProcessing value),
    @required TResult orElse(),
  }) {
    assert(orElse != null);
    if (valid != null) {
      return valid(this);
    }
    return orElse();
  }
}

abstract class _Valid implements RenameFolderState {
  const factory _Valid() = _$_Valid;
}

/// @nodoc
abstract class _$RenameFailCopyWith<$Res> {
  factory _$RenameFailCopyWith(
          _RenameFail value, $Res Function(_RenameFail) then) =
      __$RenameFailCopyWithImpl<$Res>;
  $Res call({String failMessage});
}

/// @nodoc
class __$RenameFailCopyWithImpl<$Res>
    extends _$RenameFolderStateCopyWithImpl<$Res>
    implements _$RenameFailCopyWith<$Res> {
  __$RenameFailCopyWithImpl(
      _RenameFail _value, $Res Function(_RenameFail) _then)
      : super(_value, (v) => _then(v as _RenameFail));

  @override
  _RenameFail get _value => super._value as _RenameFail;

  @override
  $Res call({
    Object failMessage = freezed,
  }) {
    return _then(_RenameFail(
      failMessage == freezed ? _value.failMessage : failMessage as String,
    ));
  }
}

/// @nodoc
class _$_RenameFail implements _RenameFail {
  const _$_RenameFail(this.failMessage) : assert(failMessage != null);

  @override
  final String failMessage;

  @override
  String toString() {
    return 'RenameFolderState.renameFail(failMessage: $failMessage)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other is _RenameFail &&
            (identical(other.failMessage, failMessage) ||
                const DeepCollectionEquality()
                    .equals(other.failMessage, failMessage)));
  }

  @override
  int get hashCode =>
      runtimeType.hashCode ^ const DeepCollectionEquality().hash(failMessage);

  @override
  _$RenameFailCopyWith<_RenameFail> get copyWith =>
      __$RenameFailCopyWithImpl<_RenameFail>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object>({
    @required TResult initial(),
    @required TResult directoryStorage(String spKey, String directory),
    @required TResult noMatter(),
    @required TResult selectDirectorySuccess(String spKey, String directory),
    @required TResult selectDirectoryFail(String spKey),
    @required TResult valid(),
    @required TResult renameFail(String failMessage),
    @required TResult renameSuccess(),
    @required TResult renameProcessing(),
  }) {
    assert(initial != null);
    assert(directoryStorage != null);
    assert(noMatter != null);
    assert(selectDirectorySuccess != null);
    assert(selectDirectoryFail != null);
    assert(valid != null);
    assert(renameFail != null);
    assert(renameSuccess != null);
    assert(renameProcessing != null);
    return renameFail(failMessage);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object>({
    TResult initial(),
    TResult directoryStorage(String spKey, String directory),
    TResult noMatter(),
    TResult selectDirectorySuccess(String spKey, String directory),
    TResult selectDirectoryFail(String spKey),
    TResult valid(),
    TResult renameFail(String failMessage),
    TResult renameSuccess(),
    TResult renameProcessing(),
    @required TResult orElse(),
  }) {
    assert(orElse != null);
    if (renameFail != null) {
      return renameFail(failMessage);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object>({
    @required TResult initial(_Initial value),
    @required TResult directoryStorage(_DirectoryStorage value),
    @required TResult noMatter(_NoMatter value),
    @required TResult selectDirectorySuccess(_SelectDirectorySuccess value),
    @required TResult selectDirectoryFail(_SelectDirectoryFail value),
    @required TResult valid(_Valid value),
    @required TResult renameFail(_RenameFail value),
    @required TResult renameSuccess(_RenameSuccess value),
    @required TResult renameProcessing(_RenameProcessing value),
  }) {
    assert(initial != null);
    assert(directoryStorage != null);
    assert(noMatter != null);
    assert(selectDirectorySuccess != null);
    assert(selectDirectoryFail != null);
    assert(valid != null);
    assert(renameFail != null);
    assert(renameSuccess != null);
    assert(renameProcessing != null);
    return renameFail(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object>({
    TResult initial(_Initial value),
    TResult directoryStorage(_DirectoryStorage value),
    TResult noMatter(_NoMatter value),
    TResult selectDirectorySuccess(_SelectDirectorySuccess value),
    TResult selectDirectoryFail(_SelectDirectoryFail value),
    TResult valid(_Valid value),
    TResult renameFail(_RenameFail value),
    TResult renameSuccess(_RenameSuccess value),
    TResult renameProcessing(_RenameProcessing value),
    @required TResult orElse(),
  }) {
    assert(orElse != null);
    if (renameFail != null) {
      return renameFail(this);
    }
    return orElse();
  }
}

abstract class _RenameFail implements RenameFolderState {
  const factory _RenameFail(String failMessage) = _$_RenameFail;

  String get failMessage;
  _$RenameFailCopyWith<_RenameFail> get copyWith;
}

/// @nodoc
abstract class _$RenameSuccessCopyWith<$Res> {
  factory _$RenameSuccessCopyWith(
          _RenameSuccess value, $Res Function(_RenameSuccess) then) =
      __$RenameSuccessCopyWithImpl<$Res>;
}

/// @nodoc
class __$RenameSuccessCopyWithImpl<$Res>
    extends _$RenameFolderStateCopyWithImpl<$Res>
    implements _$RenameSuccessCopyWith<$Res> {
  __$RenameSuccessCopyWithImpl(
      _RenameSuccess _value, $Res Function(_RenameSuccess) _then)
      : super(_value, (v) => _then(v as _RenameSuccess));

  @override
  _RenameSuccess get _value => super._value as _RenameSuccess;
}

/// @nodoc
class _$_RenameSuccess implements _RenameSuccess {
  const _$_RenameSuccess();

  @override
  String toString() {
    return 'RenameFolderState.renameSuccess()';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) || (other is _RenameSuccess);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object>({
    @required TResult initial(),
    @required TResult directoryStorage(String spKey, String directory),
    @required TResult noMatter(),
    @required TResult selectDirectorySuccess(String spKey, String directory),
    @required TResult selectDirectoryFail(String spKey),
    @required TResult valid(),
    @required TResult renameFail(String failMessage),
    @required TResult renameSuccess(),
    @required TResult renameProcessing(),
  }) {
    assert(initial != null);
    assert(directoryStorage != null);
    assert(noMatter != null);
    assert(selectDirectorySuccess != null);
    assert(selectDirectoryFail != null);
    assert(valid != null);
    assert(renameFail != null);
    assert(renameSuccess != null);
    assert(renameProcessing != null);
    return renameSuccess();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object>({
    TResult initial(),
    TResult directoryStorage(String spKey, String directory),
    TResult noMatter(),
    TResult selectDirectorySuccess(String spKey, String directory),
    TResult selectDirectoryFail(String spKey),
    TResult valid(),
    TResult renameFail(String failMessage),
    TResult renameSuccess(),
    TResult renameProcessing(),
    @required TResult orElse(),
  }) {
    assert(orElse != null);
    if (renameSuccess != null) {
      return renameSuccess();
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object>({
    @required TResult initial(_Initial value),
    @required TResult directoryStorage(_DirectoryStorage value),
    @required TResult noMatter(_NoMatter value),
    @required TResult selectDirectorySuccess(_SelectDirectorySuccess value),
    @required TResult selectDirectoryFail(_SelectDirectoryFail value),
    @required TResult valid(_Valid value),
    @required TResult renameFail(_RenameFail value),
    @required TResult renameSuccess(_RenameSuccess value),
    @required TResult renameProcessing(_RenameProcessing value),
  }) {
    assert(initial != null);
    assert(directoryStorage != null);
    assert(noMatter != null);
    assert(selectDirectorySuccess != null);
    assert(selectDirectoryFail != null);
    assert(valid != null);
    assert(renameFail != null);
    assert(renameSuccess != null);
    assert(renameProcessing != null);
    return renameSuccess(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object>({
    TResult initial(_Initial value),
    TResult directoryStorage(_DirectoryStorage value),
    TResult noMatter(_NoMatter value),
    TResult selectDirectorySuccess(_SelectDirectorySuccess value),
    TResult selectDirectoryFail(_SelectDirectoryFail value),
    TResult valid(_Valid value),
    TResult renameFail(_RenameFail value),
    TResult renameSuccess(_RenameSuccess value),
    TResult renameProcessing(_RenameProcessing value),
    @required TResult orElse(),
  }) {
    assert(orElse != null);
    if (renameSuccess != null) {
      return renameSuccess(this);
    }
    return orElse();
  }
}

abstract class _RenameSuccess implements RenameFolderState {
  const factory _RenameSuccess() = _$_RenameSuccess;
}

/// @nodoc
abstract class _$RenameProcessingCopyWith<$Res> {
  factory _$RenameProcessingCopyWith(
          _RenameProcessing value, $Res Function(_RenameProcessing) then) =
      __$RenameProcessingCopyWithImpl<$Res>;
}

/// @nodoc
class __$RenameProcessingCopyWithImpl<$Res>
    extends _$RenameFolderStateCopyWithImpl<$Res>
    implements _$RenameProcessingCopyWith<$Res> {
  __$RenameProcessingCopyWithImpl(
      _RenameProcessing _value, $Res Function(_RenameProcessing) _then)
      : super(_value, (v) => _then(v as _RenameProcessing));

  @override
  _RenameProcessing get _value => super._value as _RenameProcessing;
}

/// @nodoc
class _$_RenameProcessing implements _RenameProcessing {
  const _$_RenameProcessing();

  @override
  String toString() {
    return 'RenameFolderState.renameProcessing()';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) || (other is _RenameProcessing);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object>({
    @required TResult initial(),
    @required TResult directoryStorage(String spKey, String directory),
    @required TResult noMatter(),
    @required TResult selectDirectorySuccess(String spKey, String directory),
    @required TResult selectDirectoryFail(String spKey),
    @required TResult valid(),
    @required TResult renameFail(String failMessage),
    @required TResult renameSuccess(),
    @required TResult renameProcessing(),
  }) {
    assert(initial != null);
    assert(directoryStorage != null);
    assert(noMatter != null);
    assert(selectDirectorySuccess != null);
    assert(selectDirectoryFail != null);
    assert(valid != null);
    assert(renameFail != null);
    assert(renameSuccess != null);
    assert(renameProcessing != null);
    return renameProcessing();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object>({
    TResult initial(),
    TResult directoryStorage(String spKey, String directory),
    TResult noMatter(),
    TResult selectDirectorySuccess(String spKey, String directory),
    TResult selectDirectoryFail(String spKey),
    TResult valid(),
    TResult renameFail(String failMessage),
    TResult renameSuccess(),
    TResult renameProcessing(),
    @required TResult orElse(),
  }) {
    assert(orElse != null);
    if (renameProcessing != null) {
      return renameProcessing();
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object>({
    @required TResult initial(_Initial value),
    @required TResult directoryStorage(_DirectoryStorage value),
    @required TResult noMatter(_NoMatter value),
    @required TResult selectDirectorySuccess(_SelectDirectorySuccess value),
    @required TResult selectDirectoryFail(_SelectDirectoryFail value),
    @required TResult valid(_Valid value),
    @required TResult renameFail(_RenameFail value),
    @required TResult renameSuccess(_RenameSuccess value),
    @required TResult renameProcessing(_RenameProcessing value),
  }) {
    assert(initial != null);
    assert(directoryStorage != null);
    assert(noMatter != null);
    assert(selectDirectorySuccess != null);
    assert(selectDirectoryFail != null);
    assert(valid != null);
    assert(renameFail != null);
    assert(renameSuccess != null);
    assert(renameProcessing != null);
    return renameProcessing(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object>({
    TResult initial(_Initial value),
    TResult directoryStorage(_DirectoryStorage value),
    TResult noMatter(_NoMatter value),
    TResult selectDirectorySuccess(_SelectDirectorySuccess value),
    TResult selectDirectoryFail(_SelectDirectoryFail value),
    TResult valid(_Valid value),
    TResult renameFail(_RenameFail value),
    TResult renameSuccess(_RenameSuccess value),
    TResult renameProcessing(_RenameProcessing value),
    @required TResult orElse(),
  }) {
    assert(orElse != null);
    if (renameProcessing != null) {
      return renameProcessing(this);
    }
    return orElse();
  }
}

abstract class _RenameProcessing implements RenameFolderState {
  const factory _RenameProcessing() = _$_RenameProcessing;
}
