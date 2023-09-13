// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'answer.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

AnswerModel _$AnswerModelFromJson(Map<String, dynamic> json) {
  return _answerModel.fromJson(json);
}

/// @nodoc
mixin _$AnswerModel {
  String get uuid => throw _privateConstructorUsedError;
  String get label => throw _privateConstructorUsedError;
  String? get exp => throw _privateConstructorUsedError;
  bool get isCorrect => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $AnswerModelCopyWith<AnswerModel> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $AnswerModelCopyWith<$Res> {
  factory $AnswerModelCopyWith(
          AnswerModel value, $Res Function(AnswerModel) then) =
      _$AnswerModelCopyWithImpl<$Res, AnswerModel>;
  @useResult
  $Res call({String uuid, String label, String? exp, bool isCorrect});
}

/// @nodoc
class _$AnswerModelCopyWithImpl<$Res, $Val extends AnswerModel>
    implements $AnswerModelCopyWith<$Res> {
  _$AnswerModelCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? uuid = null,
    Object? label = null,
    Object? exp = freezed,
    Object? isCorrect = null,
  }) {
    return _then(_value.copyWith(
      uuid: null == uuid
          ? _value.uuid
          : uuid // ignore: cast_nullable_to_non_nullable
              as String,
      label: null == label
          ? _value.label
          : label // ignore: cast_nullable_to_non_nullable
              as String,
      exp: freezed == exp
          ? _value.exp
          : exp // ignore: cast_nullable_to_non_nullable
              as String?,
      isCorrect: null == isCorrect
          ? _value.isCorrect
          : isCorrect // ignore: cast_nullable_to_non_nullable
              as bool,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$_answerModelCopyWith<$Res>
    implements $AnswerModelCopyWith<$Res> {
  factory _$$_answerModelCopyWith(
          _$_answerModel value, $Res Function(_$_answerModel) then) =
      __$$_answerModelCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({String uuid, String label, String? exp, bool isCorrect});
}

/// @nodoc
class __$$_answerModelCopyWithImpl<$Res>
    extends _$AnswerModelCopyWithImpl<$Res, _$_answerModel>
    implements _$$_answerModelCopyWith<$Res> {
  __$$_answerModelCopyWithImpl(
      _$_answerModel _value, $Res Function(_$_answerModel) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? uuid = null,
    Object? label = null,
    Object? exp = freezed,
    Object? isCorrect = null,
  }) {
    return _then(_$_answerModel(
      uuid: null == uuid
          ? _value.uuid
          : uuid // ignore: cast_nullable_to_non_nullable
              as String,
      label: null == label
          ? _value.label
          : label // ignore: cast_nullable_to_non_nullable
              as String,
      exp: freezed == exp
          ? _value.exp
          : exp // ignore: cast_nullable_to_non_nullable
              as String?,
      isCorrect: null == isCorrect
          ? _value.isCorrect
          : isCorrect // ignore: cast_nullable_to_non_nullable
              as bool,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$_answerModel implements _answerModel {
  const _$_answerModel(
      {required this.uuid,
      required this.label,
      this.exp,
      required this.isCorrect});

  factory _$_answerModel.fromJson(Map<String, dynamic> json) =>
      _$$_answerModelFromJson(json);

  @override
  final String uuid;
  @override
  final String label;
  @override
  final String? exp;
  @override
  final bool isCorrect;

  @override
  String toString() {
    return 'AnswerModel(uuid: $uuid, label: $label, exp: $exp, isCorrect: $isCorrect)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_answerModel &&
            (identical(other.uuid, uuid) || other.uuid == uuid) &&
            (identical(other.label, label) || other.label == label) &&
            (identical(other.exp, exp) || other.exp == exp) &&
            (identical(other.isCorrect, isCorrect) ||
                other.isCorrect == isCorrect));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(runtimeType, uuid, label, exp, isCorrect);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_answerModelCopyWith<_$_answerModel> get copyWith =>
      __$$_answerModelCopyWithImpl<_$_answerModel>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_answerModelToJson(
      this,
    );
  }
}

abstract class _answerModel implements AnswerModel {
  const factory _answerModel(
      {required final String uuid,
      required final String label,
      final String? exp,
      required final bool isCorrect}) = _$_answerModel;

  factory _answerModel.fromJson(Map<String, dynamic> json) =
      _$_answerModel.fromJson;

  @override
  String get uuid;
  @override
  String get label;
  @override
  String? get exp;
  @override
  bool get isCorrect;
  @override
  @JsonKey(ignore: true)
  _$$_answerModelCopyWith<_$_answerModel> get copyWith =>
      throw _privateConstructorUsedError;
}
