// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'file_request.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

/// @nodoc
mixin _$FileReq {
  String get path => throw _privateConstructorUsedError;
  String get text => throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $FileReqCopyWith<FileReq> get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $FileReqCopyWith<$Res> {
  factory $FileReqCopyWith(FileReq value, $Res Function(FileReq) then) =
      _$FileReqCopyWithImpl<$Res, FileReq>;
  @useResult
  $Res call({String path, String text});
}

/// @nodoc
class _$FileReqCopyWithImpl<$Res, $Val extends FileReq>
    implements $FileReqCopyWith<$Res> {
  _$FileReqCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? path = null,
    Object? text = null,
  }) {
    return _then(_value.copyWith(
      path: null == path
          ? _value.path
          : path // ignore: cast_nullable_to_non_nullable
              as String,
      text: null == text
          ? _value.text
          : text // ignore: cast_nullable_to_non_nullable
              as String,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$_FileReqCopyWith<$Res> implements $FileReqCopyWith<$Res> {
  factory _$$_FileReqCopyWith(
          _$_FileReq value, $Res Function(_$_FileReq) then) =
      __$$_FileReqCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({String path, String text});
}

/// @nodoc
class __$$_FileReqCopyWithImpl<$Res>
    extends _$FileReqCopyWithImpl<$Res, _$_FileReq>
    implements _$$_FileReqCopyWith<$Res> {
  __$$_FileReqCopyWithImpl(_$_FileReq _value, $Res Function(_$_FileReq) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? path = null,
    Object? text = null,
  }) {
    return _then(_$_FileReq(
      null == path
          ? _value.path
          : path // ignore: cast_nullable_to_non_nullable
              as String,
      null == text
          ? _value.text
          : text // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc

class _$_FileReq implements _FileReq {
  const _$_FileReq(this.path, this.text);

  @override
  final String path;
  @override
  final String text;

  @override
  String toString() {
    return 'FileReq(path: $path, text: $text)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_FileReq &&
            (identical(other.path, path) || other.path == path) &&
            (identical(other.text, text) || other.text == text));
  }

  @override
  int get hashCode => Object.hash(runtimeType, path, text);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_FileReqCopyWith<_$_FileReq> get copyWith =>
      __$$_FileReqCopyWithImpl<_$_FileReq>(this, _$identity);
}

abstract class _FileReq implements FileReq {
  const factory _FileReq(final String path, final String text) = _$_FileReq;

  @override
  String get path;
  @override
  String get text;
  @override
  @JsonKey(ignore: true)
  _$$_FileReqCopyWith<_$_FileReq> get copyWith =>
      throw _privateConstructorUsedError;
}
