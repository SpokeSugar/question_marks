// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'file_loading_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

/// @nodoc
mixin _$FileLoadingState {
  LoadType get type => throw _privateConstructorUsedError;
  List<QuestionModel>? get questions => throw _privateConstructorUsedError;
  Directory? get files => throw _privateConstructorUsedError;
  String? get fileErrorText => throw _privateConstructorUsedError;
  Directory? get imageDirectory => throw _privateConstructorUsedError;
  String? get imageErrorText => throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $FileLoadingStateCopyWith<FileLoadingState> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $FileLoadingStateCopyWith<$Res> {
  factory $FileLoadingStateCopyWith(
          FileLoadingState value, $Res Function(FileLoadingState) then) =
      _$FileLoadingStateCopyWithImpl<$Res, FileLoadingState>;
  @useResult
  $Res call(
      {LoadType type,
      List<QuestionModel>? questions,
      Directory? files,
      String? fileErrorText,
      Directory? imageDirectory,
      String? imageErrorText});
}

/// @nodoc
class _$FileLoadingStateCopyWithImpl<$Res, $Val extends FileLoadingState>
    implements $FileLoadingStateCopyWith<$Res> {
  _$FileLoadingStateCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? type = null,
    Object? questions = freezed,
    Object? files = freezed,
    Object? fileErrorText = freezed,
    Object? imageDirectory = freezed,
    Object? imageErrorText = freezed,
  }) {
    return _then(_value.copyWith(
      type: null == type
          ? _value.type
          : type // ignore: cast_nullable_to_non_nullable
              as LoadType,
      questions: freezed == questions
          ? _value.questions
          : questions // ignore: cast_nullable_to_non_nullable
              as List<QuestionModel>?,
      files: freezed == files
          ? _value.files
          : files // ignore: cast_nullable_to_non_nullable
              as Directory?,
      fileErrorText: freezed == fileErrorText
          ? _value.fileErrorText
          : fileErrorText // ignore: cast_nullable_to_non_nullable
              as String?,
      imageDirectory: freezed == imageDirectory
          ? _value.imageDirectory
          : imageDirectory // ignore: cast_nullable_to_non_nullable
              as Directory?,
      imageErrorText: freezed == imageErrorText
          ? _value.imageErrorText
          : imageErrorText // ignore: cast_nullable_to_non_nullable
              as String?,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$_FileLoadingStateCopyWith<$Res>
    implements $FileLoadingStateCopyWith<$Res> {
  factory _$$_FileLoadingStateCopyWith(
          _$_FileLoadingState value, $Res Function(_$_FileLoadingState) then) =
      __$$_FileLoadingStateCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {LoadType type,
      List<QuestionModel>? questions,
      Directory? files,
      String? fileErrorText,
      Directory? imageDirectory,
      String? imageErrorText});
}

/// @nodoc
class __$$_FileLoadingStateCopyWithImpl<$Res>
    extends _$FileLoadingStateCopyWithImpl<$Res, _$_FileLoadingState>
    implements _$$_FileLoadingStateCopyWith<$Res> {
  __$$_FileLoadingStateCopyWithImpl(
      _$_FileLoadingState _value, $Res Function(_$_FileLoadingState) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? type = null,
    Object? questions = freezed,
    Object? files = freezed,
    Object? fileErrorText = freezed,
    Object? imageDirectory = freezed,
    Object? imageErrorText = freezed,
  }) {
    return _then(_$_FileLoadingState(
      type: null == type
          ? _value.type
          : type // ignore: cast_nullable_to_non_nullable
              as LoadType,
      questions: freezed == questions
          ? _value._questions
          : questions // ignore: cast_nullable_to_non_nullable
              as List<QuestionModel>?,
      files: freezed == files
          ? _value.files
          : files // ignore: cast_nullable_to_non_nullable
              as Directory?,
      fileErrorText: freezed == fileErrorText
          ? _value.fileErrorText
          : fileErrorText // ignore: cast_nullable_to_non_nullable
              as String?,
      imageDirectory: freezed == imageDirectory
          ? _value.imageDirectory
          : imageDirectory // ignore: cast_nullable_to_non_nullable
              as Directory?,
      imageErrorText: freezed == imageErrorText
          ? _value.imageErrorText
          : imageErrorText // ignore: cast_nullable_to_non_nullable
              as String?,
    ));
  }
}

/// @nodoc

class _$_FileLoadingState extends _FileLoadingState {
  const _$_FileLoadingState(
      {this.type = LoadType.undifined,
      final List<QuestionModel>? questions,
      this.files,
      this.fileErrorText,
      this.imageDirectory,
      this.imageErrorText})
      : _questions = questions,
        super._();

  @override
  @JsonKey()
  final LoadType type;
  final List<QuestionModel>? _questions;
  @override
  List<QuestionModel>? get questions {
    final value = _questions;
    if (value == null) return null;
    if (_questions is EqualUnmodifiableListView) return _questions;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(value);
  }

  @override
  final Directory? files;
  @override
  final String? fileErrorText;
  @override
  final Directory? imageDirectory;
  @override
  final String? imageErrorText;

  @override
  String toString() {
    return 'FileLoadingState(type: $type, questions: $questions, files: $files, fileErrorText: $fileErrorText, imageDirectory: $imageDirectory, imageErrorText: $imageErrorText)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_FileLoadingState &&
            (identical(other.type, type) || other.type == type) &&
            const DeepCollectionEquality()
                .equals(other._questions, _questions) &&
            (identical(other.files, files) || other.files == files) &&
            (identical(other.fileErrorText, fileErrorText) ||
                other.fileErrorText == fileErrorText) &&
            (identical(other.imageDirectory, imageDirectory) ||
                other.imageDirectory == imageDirectory) &&
            (identical(other.imageErrorText, imageErrorText) ||
                other.imageErrorText == imageErrorText));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType,
      type,
      const DeepCollectionEquality().hash(_questions),
      files,
      fileErrorText,
      imageDirectory,
      imageErrorText);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_FileLoadingStateCopyWith<_$_FileLoadingState> get copyWith =>
      __$$_FileLoadingStateCopyWithImpl<_$_FileLoadingState>(this, _$identity);
}

abstract class _FileLoadingState extends FileLoadingState {
  const factory _FileLoadingState(
      {final LoadType type,
      final List<QuestionModel>? questions,
      final Directory? files,
      final String? fileErrorText,
      final Directory? imageDirectory,
      final String? imageErrorText}) = _$_FileLoadingState;
  const _FileLoadingState._() : super._();

  @override
  LoadType get type;
  @override
  List<QuestionModel>? get questions;
  @override
  Directory? get files;
  @override
  String? get fileErrorText;
  @override
  Directory? get imageDirectory;
  @override
  String? get imageErrorText;
  @override
  @JsonKey(ignore: true)
  _$$_FileLoadingStateCopyWith<_$_FileLoadingState> get copyWith =>
      throw _privateConstructorUsedError;
}
