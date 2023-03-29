// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'question_session_state.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

QuestionSessionState _$QuestionSessionStateFromJson(Map<String, dynamic> json) {
  return _QuestionSessionState.fromJson(json);
}

/// @nodoc
mixin _$QuestionSessionState {
  Set<QuestionModel> get question => throw _privateConstructorUsedError;
  List<AnswerResultModel> get answers => throw _privateConstructorUsedError;
  int get index => throw _privateConstructorUsedError;
  @DateTimeConverter()
  DateTime get create => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $QuestionSessionStateCopyWith<QuestionSessionState> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $QuestionSessionStateCopyWith<$Res> {
  factory $QuestionSessionStateCopyWith(QuestionSessionState value,
          $Res Function(QuestionSessionState) then) =
      _$QuestionSessionStateCopyWithImpl<$Res, QuestionSessionState>;
  @useResult
  $Res call(
      {Set<QuestionModel> question,
      List<AnswerResultModel> answers,
      int index,
      @DateTimeConverter() DateTime create});
}

/// @nodoc
class _$QuestionSessionStateCopyWithImpl<$Res,
        $Val extends QuestionSessionState>
    implements $QuestionSessionStateCopyWith<$Res> {
  _$QuestionSessionStateCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? question = null,
    Object? answers = null,
    Object? index = null,
    Object? create = null,
  }) {
    return _then(_value.copyWith(
      question: null == question
          ? _value.question
          : question // ignore: cast_nullable_to_non_nullable
              as Set<QuestionModel>,
      answers: null == answers
          ? _value.answers
          : answers // ignore: cast_nullable_to_non_nullable
              as List<AnswerResultModel>,
      index: null == index
          ? _value.index
          : index // ignore: cast_nullable_to_non_nullable
              as int,
      create: null == create
          ? _value.create
          : create // ignore: cast_nullable_to_non_nullable
              as DateTime,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$_QuestionSessionStateCopyWith<$Res>
    implements $QuestionSessionStateCopyWith<$Res> {
  factory _$$_QuestionSessionStateCopyWith(_$_QuestionSessionState value,
          $Res Function(_$_QuestionSessionState) then) =
      __$$_QuestionSessionStateCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {Set<QuestionModel> question,
      List<AnswerResultModel> answers,
      int index,
      @DateTimeConverter() DateTime create});
}

/// @nodoc
class __$$_QuestionSessionStateCopyWithImpl<$Res>
    extends _$QuestionSessionStateCopyWithImpl<$Res, _$_QuestionSessionState>
    implements _$$_QuestionSessionStateCopyWith<$Res> {
  __$$_QuestionSessionStateCopyWithImpl(_$_QuestionSessionState _value,
      $Res Function(_$_QuestionSessionState) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? question = null,
    Object? answers = null,
    Object? index = null,
    Object? create = null,
  }) {
    return _then(_$_QuestionSessionState(
      question: null == question
          ? _value._question
          : question // ignore: cast_nullable_to_non_nullable
              as Set<QuestionModel>,
      answers: null == answers
          ? _value._answers
          : answers // ignore: cast_nullable_to_non_nullable
              as List<AnswerResultModel>,
      index: null == index
          ? _value.index
          : index // ignore: cast_nullable_to_non_nullable
              as int,
      create: null == create
          ? _value.create
          : create // ignore: cast_nullable_to_non_nullable
              as DateTime,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$_QuestionSessionState extends _QuestionSessionState {
  const _$_QuestionSessionState(
      {final Set<QuestionModel> question = const {},
      final List<AnswerResultModel> answers = const [],
      this.index = 0,
      @DateTimeConverter() required this.create})
      : _question = question,
        _answers = answers,
        super._();

  factory _$_QuestionSessionState.fromJson(Map<String, dynamic> json) =>
      _$$_QuestionSessionStateFromJson(json);

  final Set<QuestionModel> _question;
  @override
  @JsonKey()
  Set<QuestionModel> get question {
    if (_question is EqualUnmodifiableSetView) return _question;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableSetView(_question);
  }

  final List<AnswerResultModel> _answers;
  @override
  @JsonKey()
  List<AnswerResultModel> get answers {
    if (_answers is EqualUnmodifiableListView) return _answers;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_answers);
  }

  @override
  @JsonKey()
  final int index;
  @override
  @DateTimeConverter()
  final DateTime create;

  @override
  String toString() {
    return 'QuestionSessionState(question: $question, answers: $answers, index: $index, create: $create)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_QuestionSessionState &&
            const DeepCollectionEquality().equals(other._question, _question) &&
            const DeepCollectionEquality().equals(other._answers, _answers) &&
            (identical(other.index, index) || other.index == index) &&
            (identical(other.create, create) || other.create == create));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(
      runtimeType,
      const DeepCollectionEquality().hash(_question),
      const DeepCollectionEquality().hash(_answers),
      index,
      create);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_QuestionSessionStateCopyWith<_$_QuestionSessionState> get copyWith =>
      __$$_QuestionSessionStateCopyWithImpl<_$_QuestionSessionState>(
          this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_QuestionSessionStateToJson(
      this,
    );
  }
}

abstract class _QuestionSessionState extends QuestionSessionState {
  const factory _QuestionSessionState(
          {final Set<QuestionModel> question,
          final List<AnswerResultModel> answers,
          final int index,
          @DateTimeConverter() required final DateTime create}) =
      _$_QuestionSessionState;
  const _QuestionSessionState._() : super._();

  factory _QuestionSessionState.fromJson(Map<String, dynamic> json) =
      _$_QuestionSessionState.fromJson;

  @override
  Set<QuestionModel> get question;
  @override
  List<AnswerResultModel> get answers;
  @override
  int get index;
  @override
  @DateTimeConverter()
  DateTime get create;
  @override
  @JsonKey(ignore: true)
  _$$_QuestionSessionStateCopyWith<_$_QuestionSessionState> get copyWith =>
      throw _privateConstructorUsedError;
}
