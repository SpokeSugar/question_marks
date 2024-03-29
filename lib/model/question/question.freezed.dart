// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'question.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

QuestionModel _$QuestionModelFromJson(Map<String, dynamic> json) {
  return _QuestionModel.fromJson(json);
}

/// @nodoc
mixin _$QuestionModel {
  String get q => throw _privateConstructorUsedError;
  List<AnswerModel> get answers => throw _privateConstructorUsedError;
  String? get imagePath => throw _privateConstructorUsedError;
  String? get explanation => throw _privateConstructorUsedError;
  String get uuid => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $QuestionModelCopyWith<QuestionModel> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $QuestionModelCopyWith<$Res> {
  factory $QuestionModelCopyWith(
          QuestionModel value, $Res Function(QuestionModel) then) =
      _$QuestionModelCopyWithImpl<$Res, QuestionModel>;
  @useResult
  $Res call(
      {String q,
      List<AnswerModel> answers,
      String? imagePath,
      String? explanation,
      String uuid});
}

/// @nodoc
class _$QuestionModelCopyWithImpl<$Res, $Val extends QuestionModel>
    implements $QuestionModelCopyWith<$Res> {
  _$QuestionModelCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? q = null,
    Object? answers = null,
    Object? imagePath = freezed,
    Object? explanation = freezed,
    Object? uuid = null,
  }) {
    return _then(_value.copyWith(
      q: null == q
          ? _value.q
          : q // ignore: cast_nullable_to_non_nullable
              as String,
      answers: null == answers
          ? _value.answers
          : answers // ignore: cast_nullable_to_non_nullable
              as List<AnswerModel>,
      imagePath: freezed == imagePath
          ? _value.imagePath
          : imagePath // ignore: cast_nullable_to_non_nullable
              as String?,
      explanation: freezed == explanation
          ? _value.explanation
          : explanation // ignore: cast_nullable_to_non_nullable
              as String?,
      uuid: null == uuid
          ? _value.uuid
          : uuid // ignore: cast_nullable_to_non_nullable
              as String,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$_QuestionModelCopyWith<$Res>
    implements $QuestionModelCopyWith<$Res> {
  factory _$$_QuestionModelCopyWith(
          _$_QuestionModel value, $Res Function(_$_QuestionModel) then) =
      __$$_QuestionModelCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {String q,
      List<AnswerModel> answers,
      String? imagePath,
      String? explanation,
      String uuid});
}

/// @nodoc
class __$$_QuestionModelCopyWithImpl<$Res>
    extends _$QuestionModelCopyWithImpl<$Res, _$_QuestionModel>
    implements _$$_QuestionModelCopyWith<$Res> {
  __$$_QuestionModelCopyWithImpl(
      _$_QuestionModel _value, $Res Function(_$_QuestionModel) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? q = null,
    Object? answers = null,
    Object? imagePath = freezed,
    Object? explanation = freezed,
    Object? uuid = null,
  }) {
    return _then(_$_QuestionModel(
      q: null == q
          ? _value.q
          : q // ignore: cast_nullable_to_non_nullable
              as String,
      answers: null == answers
          ? _value._answers
          : answers // ignore: cast_nullable_to_non_nullable
              as List<AnswerModel>,
      imagePath: freezed == imagePath
          ? _value.imagePath
          : imagePath // ignore: cast_nullable_to_non_nullable
              as String?,
      explanation: freezed == explanation
          ? _value.explanation
          : explanation // ignore: cast_nullable_to_non_nullable
              as String?,
      uuid: null == uuid
          ? _value.uuid
          : uuid // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$_QuestionModel extends _QuestionModel {
  const _$_QuestionModel(
      {required this.q,
      required final List<AnswerModel> answers,
      this.imagePath,
      this.explanation,
      required this.uuid})
      : _answers = answers,
        super._();

  factory _$_QuestionModel.fromJson(Map<String, dynamic> json) =>
      _$$_QuestionModelFromJson(json);

  @override
  final String q;
  final List<AnswerModel> _answers;
  @override
  List<AnswerModel> get answers {
    if (_answers is EqualUnmodifiableListView) return _answers;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_answers);
  }

  @override
  final String? imagePath;
  @override
  final String? explanation;
  @override
  final String uuid;

  @override
  String toString() {
    return 'QuestionModel(q: $q, answers: $answers, imagePath: $imagePath, explanation: $explanation, uuid: $uuid)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_QuestionModel &&
            (identical(other.q, q) || other.q == q) &&
            const DeepCollectionEquality().equals(other._answers, _answers) &&
            (identical(other.imagePath, imagePath) ||
                other.imagePath == imagePath) &&
            (identical(other.explanation, explanation) ||
                other.explanation == explanation) &&
            (identical(other.uuid, uuid) || other.uuid == uuid));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(
      runtimeType,
      q,
      const DeepCollectionEquality().hash(_answers),
      imagePath,
      explanation,
      uuid);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_QuestionModelCopyWith<_$_QuestionModel> get copyWith =>
      __$$_QuestionModelCopyWithImpl<_$_QuestionModel>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_QuestionModelToJson(
      this,
    );
  }
}

abstract class _QuestionModel extends QuestionModel {
  const factory _QuestionModel(
      {required final String q,
      required final List<AnswerModel> answers,
      final String? imagePath,
      final String? explanation,
      required final String uuid}) = _$_QuestionModel;
  const _QuestionModel._() : super._();

  factory _QuestionModel.fromJson(Map<String, dynamic> json) =
      _$_QuestionModel.fromJson;

  @override
  String get q;
  @override
  List<AnswerModel> get answers;
  @override
  String? get imagePath;
  @override
  String? get explanation;
  @override
  String get uuid;
  @override
  @JsonKey(ignore: true)
  _$$_QuestionModelCopyWith<_$_QuestionModel> get copyWith =>
      throw _privateConstructorUsedError;
}
