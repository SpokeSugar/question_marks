// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'create_question_answer_text_field_provider.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

/// @nodoc
mixin _$CreateAnswerListID {
  String get questionID => throw _privateConstructorUsedError;
  String get answerID => throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $CreateAnswerListIDCopyWith<CreateAnswerListID> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $CreateAnswerListIDCopyWith<$Res> {
  factory $CreateAnswerListIDCopyWith(
          CreateAnswerListID value, $Res Function(CreateAnswerListID) then) =
      _$CreateAnswerListIDCopyWithImpl<$Res, CreateAnswerListID>;
  @useResult
  $Res call({String questionID, String answerID});
}

/// @nodoc
class _$CreateAnswerListIDCopyWithImpl<$Res, $Val extends CreateAnswerListID>
    implements $CreateAnswerListIDCopyWith<$Res> {
  _$CreateAnswerListIDCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? questionID = null,
    Object? answerID = null,
  }) {
    return _then(_value.copyWith(
      questionID: null == questionID
          ? _value.questionID
          : questionID // ignore: cast_nullable_to_non_nullable
              as String,
      answerID: null == answerID
          ? _value.answerID
          : answerID // ignore: cast_nullable_to_non_nullable
              as String,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$_CreateAnswerListIDCopyWith<$Res>
    implements $CreateAnswerListIDCopyWith<$Res> {
  factory _$$_CreateAnswerListIDCopyWith(_$_CreateAnswerListID value,
          $Res Function(_$_CreateAnswerListID) then) =
      __$$_CreateAnswerListIDCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({String questionID, String answerID});
}

/// @nodoc
class __$$_CreateAnswerListIDCopyWithImpl<$Res>
    extends _$CreateAnswerListIDCopyWithImpl<$Res, _$_CreateAnswerListID>
    implements _$$_CreateAnswerListIDCopyWith<$Res> {
  __$$_CreateAnswerListIDCopyWithImpl(
      _$_CreateAnswerListID _value, $Res Function(_$_CreateAnswerListID) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? questionID = null,
    Object? answerID = null,
  }) {
    return _then(_$_CreateAnswerListID(
      null == questionID
          ? _value.questionID
          : questionID // ignore: cast_nullable_to_non_nullable
              as String,
      null == answerID
          ? _value.answerID
          : answerID // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc

class _$_CreateAnswerListID implements _CreateAnswerListID {
  const _$_CreateAnswerListID(this.questionID, this.answerID);

  @override
  final String questionID;
  @override
  final String answerID;

  @override
  String toString() {
    return 'CreateAnswerListID(questionID: $questionID, answerID: $answerID)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_CreateAnswerListID &&
            (identical(other.questionID, questionID) ||
                other.questionID == questionID) &&
            (identical(other.answerID, answerID) ||
                other.answerID == answerID));
  }

  @override
  int get hashCode => Object.hash(runtimeType, questionID, answerID);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_CreateAnswerListIDCopyWith<_$_CreateAnswerListID> get copyWith =>
      __$$_CreateAnswerListIDCopyWithImpl<_$_CreateAnswerListID>(
          this, _$identity);
}

abstract class _CreateAnswerListID implements CreateAnswerListID {
  const factory _CreateAnswerListID(
      final String questionID, final String answerID) = _$_CreateAnswerListID;

  @override
  String get questionID;
  @override
  String get answerID;
  @override
  @JsonKey(ignore: true)
  _$$_CreateAnswerListIDCopyWith<_$_CreateAnswerListID> get copyWith =>
      throw _privateConstructorUsedError;
}
