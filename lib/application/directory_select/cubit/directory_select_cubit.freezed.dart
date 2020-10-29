// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies

part of 'directory_select_cubit.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

/// @nodoc
class _$DirectorySelectStateTearOff {
  const _$DirectorySelectStateTearOff();

// ignore: unused_element
  _Initial initial(@nullable String directory) {
    return _Initial(
      directory,
    );
  }

// ignore: unused_element
  _Fail fail(String spKey) {
    return _Fail(
      spKey,
    );
  }

// ignore: unused_element
  _Directory success(String spKey, @nullable String directory) {
    return _Directory(
      spKey,
      directory,
    );
  }
}

/// @nodoc
// ignore: unused_element
const $DirectorySelectState = _$DirectorySelectStateTearOff();

/// @nodoc
mixin _$DirectorySelectState {
  @optionalTypeArgs
  Result when<Result extends Object>({
    @required Result initial(@nullable String directory),
    @required Result fail(String spKey),
    @required Result success(String spKey, @nullable String directory),
  });
  @optionalTypeArgs
  Result maybeWhen<Result extends Object>({
    Result initial(@nullable String directory),
    Result fail(String spKey),
    Result success(String spKey, @nullable String directory),
    @required Result orElse(),
  });
  @optionalTypeArgs
  Result map<Result extends Object>({
    @required Result initial(_Initial value),
    @required Result fail(_Fail value),
    @required Result success(_Directory value),
  });
  @optionalTypeArgs
  Result maybeMap<Result extends Object>({
    Result initial(_Initial value),
    Result fail(_Fail value),
    Result success(_Directory value),
    @required Result orElse(),
  });
}

/// @nodoc
abstract class $DirectorySelectStateCopyWith<$Res> {
  factory $DirectorySelectStateCopyWith(DirectorySelectState value,
          $Res Function(DirectorySelectState) then) =
      _$DirectorySelectStateCopyWithImpl<$Res>;
}

/// @nodoc
class _$DirectorySelectStateCopyWithImpl<$Res>
    implements $DirectorySelectStateCopyWith<$Res> {
  _$DirectorySelectStateCopyWithImpl(this._value, this._then);

  final DirectorySelectState _value;
  // ignore: unused_field
  final $Res Function(DirectorySelectState) _then;
}

/// @nodoc
abstract class _$InitialCopyWith<$Res> {
  factory _$InitialCopyWith(_Initial value, $Res Function(_Initial) then) =
      __$InitialCopyWithImpl<$Res>;
  $Res call({@nullable String directory});
}

/// @nodoc
class __$InitialCopyWithImpl<$Res>
    extends _$DirectorySelectStateCopyWithImpl<$Res>
    implements _$InitialCopyWith<$Res> {
  __$InitialCopyWithImpl(_Initial _value, $Res Function(_Initial) _then)
      : super(_value, (v) => _then(v as _Initial));

  @override
  _Initial get _value => super._value as _Initial;

  @override
  $Res call({
    Object directory = freezed,
  }) {
    return _then(_Initial(
      directory == freezed ? _value.directory : directory as String,
    ));
  }
}

/// @nodoc
class _$_Initial implements _Initial {
  const _$_Initial(@nullable this.directory);

  @override
  @nullable
  final String directory;

  @override
  String toString() {
    return 'DirectorySelectState.initial(directory: $directory)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other is _Initial &&
            (identical(other.directory, directory) ||
                const DeepCollectionEquality()
                    .equals(other.directory, directory)));
  }

  @override
  int get hashCode =>
      runtimeType.hashCode ^ const DeepCollectionEquality().hash(directory);

  @override
  _$InitialCopyWith<_Initial> get copyWith =>
      __$InitialCopyWithImpl<_Initial>(this, _$identity);

  @override
  @optionalTypeArgs
  Result when<Result extends Object>({
    @required Result initial(@nullable String directory),
    @required Result fail(String spKey),
    @required Result success(String spKey, @nullable String directory),
  }) {
    assert(initial != null);
    assert(fail != null);
    assert(success != null);
    return initial(directory);
  }

  @override
  @optionalTypeArgs
  Result maybeWhen<Result extends Object>({
    Result initial(@nullable String directory),
    Result fail(String spKey),
    Result success(String spKey, @nullable String directory),
    @required Result orElse(),
  }) {
    assert(orElse != null);
    if (initial != null) {
      return initial(directory);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  Result map<Result extends Object>({
    @required Result initial(_Initial value),
    @required Result fail(_Fail value),
    @required Result success(_Directory value),
  }) {
    assert(initial != null);
    assert(fail != null);
    assert(success != null);
    return initial(this);
  }

  @override
  @optionalTypeArgs
  Result maybeMap<Result extends Object>({
    Result initial(_Initial value),
    Result fail(_Fail value),
    Result success(_Directory value),
    @required Result orElse(),
  }) {
    assert(orElse != null);
    if (initial != null) {
      return initial(this);
    }
    return orElse();
  }
}

abstract class _Initial implements DirectorySelectState {
  const factory _Initial(@nullable String directory) = _$_Initial;

  @nullable
  String get directory;
  _$InitialCopyWith<_Initial> get copyWith;
}

/// @nodoc
abstract class _$FailCopyWith<$Res> {
  factory _$FailCopyWith(_Fail value, $Res Function(_Fail) then) =
      __$FailCopyWithImpl<$Res>;
  $Res call({String spKey});
}

/// @nodoc
class __$FailCopyWithImpl<$Res> extends _$DirectorySelectStateCopyWithImpl<$Res>
    implements _$FailCopyWith<$Res> {
  __$FailCopyWithImpl(_Fail _value, $Res Function(_Fail) _then)
      : super(_value, (v) => _then(v as _Fail));

  @override
  _Fail get _value => super._value as _Fail;

  @override
  $Res call({
    Object spKey = freezed,
  }) {
    return _then(_Fail(
      spKey == freezed ? _value.spKey : spKey as String,
    ));
  }
}

/// @nodoc
class _$_Fail implements _Fail {
  const _$_Fail(this.spKey) : assert(spKey != null);

  @override
  final String spKey;

  @override
  String toString() {
    return 'DirectorySelectState.fail(spKey: $spKey)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other is _Fail &&
            (identical(other.spKey, spKey) ||
                const DeepCollectionEquality().equals(other.spKey, spKey)));
  }

  @override
  int get hashCode =>
      runtimeType.hashCode ^ const DeepCollectionEquality().hash(spKey);

  @override
  _$FailCopyWith<_Fail> get copyWith =>
      __$FailCopyWithImpl<_Fail>(this, _$identity);

  @override
  @optionalTypeArgs
  Result when<Result extends Object>({
    @required Result initial(@nullable String directory),
    @required Result fail(String spKey),
    @required Result success(String spKey, @nullable String directory),
  }) {
    assert(initial != null);
    assert(fail != null);
    assert(success != null);
    return fail(spKey);
  }

  @override
  @optionalTypeArgs
  Result maybeWhen<Result extends Object>({
    Result initial(@nullable String directory),
    Result fail(String spKey),
    Result success(String spKey, @nullable String directory),
    @required Result orElse(),
  }) {
    assert(orElse != null);
    if (fail != null) {
      return fail(spKey);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  Result map<Result extends Object>({
    @required Result initial(_Initial value),
    @required Result fail(_Fail value),
    @required Result success(_Directory value),
  }) {
    assert(initial != null);
    assert(fail != null);
    assert(success != null);
    return fail(this);
  }

  @override
  @optionalTypeArgs
  Result maybeMap<Result extends Object>({
    Result initial(_Initial value),
    Result fail(_Fail value),
    Result success(_Directory value),
    @required Result orElse(),
  }) {
    assert(orElse != null);
    if (fail != null) {
      return fail(this);
    }
    return orElse();
  }
}

abstract class _Fail implements DirectorySelectState {
  const factory _Fail(String spKey) = _$_Fail;

  String get spKey;
  _$FailCopyWith<_Fail> get copyWith;
}

/// @nodoc
abstract class _$DirectoryCopyWith<$Res> {
  factory _$DirectoryCopyWith(
          _Directory value, $Res Function(_Directory) then) =
      __$DirectoryCopyWithImpl<$Res>;
  $Res call({String spKey, @nullable String directory});
}

/// @nodoc
class __$DirectoryCopyWithImpl<$Res>
    extends _$DirectorySelectStateCopyWithImpl<$Res>
    implements _$DirectoryCopyWith<$Res> {
  __$DirectoryCopyWithImpl(_Directory _value, $Res Function(_Directory) _then)
      : super(_value, (v) => _then(v as _Directory));

  @override
  _Directory get _value => super._value as _Directory;

  @override
  $Res call({
    Object spKey = freezed,
    Object directory = freezed,
  }) {
    return _then(_Directory(
      spKey == freezed ? _value.spKey : spKey as String,
      directory == freezed ? _value.directory : directory as String,
    ));
  }
}

/// @nodoc
class _$_Directory implements _Directory {
  const _$_Directory(this.spKey, @nullable this.directory)
      : assert(spKey != null);

  @override
  final String spKey;
  @override
  @nullable
  final String directory;

  @override
  String toString() {
    return 'DirectorySelectState.success(spKey: $spKey, directory: $directory)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other is _Directory &&
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
  _$DirectoryCopyWith<_Directory> get copyWith =>
      __$DirectoryCopyWithImpl<_Directory>(this, _$identity);

  @override
  @optionalTypeArgs
  Result when<Result extends Object>({
    @required Result initial(@nullable String directory),
    @required Result fail(String spKey),
    @required Result success(String spKey, @nullable String directory),
  }) {
    assert(initial != null);
    assert(fail != null);
    assert(success != null);
    return success(spKey, directory);
  }

  @override
  @optionalTypeArgs
  Result maybeWhen<Result extends Object>({
    Result initial(@nullable String directory),
    Result fail(String spKey),
    Result success(String spKey, @nullable String directory),
    @required Result orElse(),
  }) {
    assert(orElse != null);
    if (success != null) {
      return success(spKey, directory);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  Result map<Result extends Object>({
    @required Result initial(_Initial value),
    @required Result fail(_Fail value),
    @required Result success(_Directory value),
  }) {
    assert(initial != null);
    assert(fail != null);
    assert(success != null);
    return success(this);
  }

  @override
  @optionalTypeArgs
  Result maybeMap<Result extends Object>({
    Result initial(_Initial value),
    Result fail(_Fail value),
    Result success(_Directory value),
    @required Result orElse(),
  }) {
    assert(orElse != null);
    if (success != null) {
      return success(this);
    }
    return orElse();
  }
}

abstract class _Directory implements DirectorySelectState {
  const factory _Directory(String spKey, @nullable String directory) =
      _$_Directory;

  String get spKey;
  @nullable
  String get directory;
  _$DirectoryCopyWith<_Directory> get copyWith;
}
