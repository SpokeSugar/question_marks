// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'answer_result.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

AnswerResultModel _$AnswerResultModelFromJson(Map<String, dynamic> json) {
  return _AnswerResultModel.fromJson(json);
}

/// @nodoc
mixin _$AnswerResultModel {
  String get sessionID => throw _privateConstructorUsedError;
  String get questionID => throw _privateConstructorUsedError;
  List<String> get answers => throw _privateConstructorUsedError;
  Set<String> get collectAnswer => throw _privateConstructorUsedError;
  Set<String> get selectAnswer => throw _privateConstructorUsedError;
  @DateTimeConverter()
  DateTime? get dateTime => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $AnswerResultModelCopyWith<AnswerResultModel> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $AnswerResultModelCopyWith<$Res> {
  factory $AnswerResultModelCopyWith(
          AnswerResultModel value, $Res Function(AnswerResultModel) then) =
      _$AnswerResultModelCopyWithImpl<$Res, AnswerResultModel>;
  @useResult
  $Res call(
      {String sessionID,
      String questionID,
      List<String> answers,
      Set<String> collectAnswer,
      Set<String> selectAnswer,
      @DateTimeConverter() DateTime? dateTime});
}

/// @nodoc
class _$AnswerResultModelCopyWithImpl<$Res, $Val extends AnswerResultModel>
    implements $AnswerResultModelCopyWith<$Res> {
  _$AnswerResultModelCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? sessionID = null,
    Object? questionID = null,
    Object? answers = null,
    Object? collectAnswer = null,
    Object? selectAnswer = null,
    Object? dateTime = freezed,
  }) {
    return _then(_value.copyWith(
      sessionID: null == sessionID
          ? _value.sessionID
          : sessionID // ignore: cast_nullable_to_non_nullable
              as String,
      questionID: null == questionID
          ? _value.questionID
          : questionID // ignore: cast_nullable_to_non_nullable
              as String,
      answers: null == answers
          ? _value.answers
          : answers // ignore: cast_nullable_to_non_nullable
              as List<String>,
      collectAnswer: null == collectAnswer
          ? _value.collectAnswer
          : collectAnswer // ignore: cast_nullable_to_non_nullable
              as Set<String>,
      selectAnswer: null == selectAnswer
          ? _value.selectAnswer
          : selectAnswer // ignore: cast_nullable_to_non_nullable
              as Set<String>,
      dateTime: freezed == dateTime
          ? _value.dateTime
          : dateTime // ignore: cast_nullable_to_non_nullable
              as DateTime?,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$_AnswerResultModelCopyWith<$Res>
    implements $AnswerResultModelCopyWith<$Res> {
  factory _$$_AnswerResultModelCopyWith(_$_AnswerResultModel value,
          $Res Function(_$_AnswerResultModel) then) =
      __$$_AnswerResultModelCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {String sessionID,
      String questionID,
      List<String> answers,
      Set<String> collectAnswer,
      Set<String> selectAnswer,
      @DateTimeConverter() DateTime? dateTime});
}

/// @nodoc
class __$$_AnswerResultModelCopyWithImpl<$Res>
    extends _$AnswerResultModelCopyWithImpl<$Res, _$_AnswerResultModel>
    implements _$$_AnswerResultModelCopyWith<$Res> {
  __$$_AnswerResultModelCopyWithImpl(
      _$_AnswerResultModel _value, $Res Function(_$_AnswerResultModel) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? sessionID = null,
    Object? questionID = null,
    Object? answers = null,
    Object? collectAnswer = null,
    Object? selectAnswer = null,
    Object? dateTime = freezed,
  }) {
    return _then(_$_AnswerResultModel(
      sessionID: null == sessionID
          ? _value.sessionID
          : sessionID // ignore: cast_nullable_to_non_nullable
              as String,
      questionID: null == questionID
          ? _value.questionID
          : questionID // ignore: cast_nullable_to_non_nullable
              as String,
      answers: null == answers
          ? _value._answers
          : answers // ignore: cast_nullable_to_non_nullable
              as List<String>,
      collectAnswer: null == collectAnswer
          ? _value._collectAnswer
          : collectAnswer // ignore: cast_nullable_to_non_nullable
              as Set<String>,
      selectAnswer: null == selectAnswer
          ? _value._selectAnswer
          : selectAnswer // ignore: cast_nullable_to_non_nullable
              as Set<String>,
      dateTime: freezed == dateTime
          ? _value.dateTime
          : dateTime // ignore: cast_nullable_to_non_nullable
              as DateTime?,
    ));
  }
}

/// @nodoc

@JsonSerializable(includeIfNull: false)
class _$_AnswerResultModel extends _AnswerResultModel
    with DiagnosticableTreeMixin {
  const _$_AnswerResultModel(
      {required this.sessionID,
      required this.questionID,
      final List<String> answers = const [],
      final Set<String> collectAnswer = const {},
      final Set<String> selectAnswer = const {},
      @DateTimeConverter() this.dateTime})
      : _answers = answers,
        _collectAnswer = collectAnswer,
        _selectAnswer = selectAnswer,
        super._();

  factory _$_AnswerResultModel.fromJson(Map<String, dynamic> json) =>
      _$$_AnswerResultModelFromJson(json);

  @override
  final String sessionID;
  @override
  final String questionID;
  final List<String> _answers;
  @override
  @JsonKey()
  List<String> get answers {
    if (_answers is EqualUnmodifiableListView) return _answers;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_answers);
  }

  final Set<String> _collectAnswer;
  @override
  @JsonKey()
  Set<String> get collectAnswer {
    if (_collectAnswer is EqualUnmodifiableSetView) return _collectAnswer;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableSetView(_collectAnswer);
  }

  final Set<String> _selectAnswer;
  @override
  @JsonKey()
  Set<String> get selectAnswer {
    if (_selectAnswer is EqualUnmodifiableSetView) return _selectAnswer;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableSetView(_selectAnswer);
  }

  @override
  @DateTimeConverter()
  final DateTime? dateTime;

  @override
  String toString({DiagnosticLevel minLevel = DiagnosticLevel.info}) {
    return 'AnswerResultModel(sessionID: $sessionID, questionID: $questionID, answers: $answers, collectAnswer: $collectAnswer, selectAnswer: $selectAnswer, dateTime: $dateTime)';
  }

  @override
  void debugFillProperties(DiagnosticPropertiesBuilder properties) {
    super.debugFillProperties(properties);
    properties
      ..add(DiagnosticsProperty('type', 'AnswerResultModel'))
      ..add(DiagnosticsProperty('sessionID', sessionID))
      ..add(DiagnosticsProperty('questionID', questionID))
      ..add(DiagnosticsProperty('answers', answers))
      ..add(DiagnosticsProperty('collectAnswer', collectAnswer))
      ..add(DiagnosticsProperty('selectAnswer', selectAnswer))
      ..add(DiagnosticsProperty('dateTime', dateTime));
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_AnswerResultModel &&
            (identical(other.sessionID, sessionID) ||
                other.sessionID == sessionID) &&
            (identical(other.questionID, questionID) ||
                other.questionID == questionID) &&
            const DeepCollectionEquality().equals(other._answers, _answers) &&
            const DeepCollectionEquality()
                .equals(other._collectAnswer, _collectAnswer) &&
            const DeepCollectionEquality()
                .equals(other._selectAnswer, _selectAnswer) &&
            (identical(other.dateTime, dateTime) ||
                other.dateTime == dateTime));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(
      runtimeType,
      sessionID,
      questionID,
      const DeepCollectionEquality().hash(_answers),
      const DeepCollectionEquality().hash(_collectAnswer),
      const DeepCollectionEquality().hash(_selectAnswer),
      dateTime);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_AnswerResultModelCopyWith<_$_AnswerResultModel> get copyWith =>
      __$$_AnswerResultModelCopyWithImpl<_$_AnswerResultModel>(
          this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_AnswerResultModelToJson(
      this,
    );
  }
}

abstract class _AnswerResultModel extends AnswerResultModel {
  const factory _AnswerResultModel(
      {required final String sessionID,
      required final String questionID,
      final List<String> answers,
      final Set<String> collectAnswer,
      final Set<String> selectAnswer,
      @DateTimeConverter() final DateTime? dateTime}) = _$_AnswerResultModel;
  const _AnswerResultModel._() : super._();

  factory _AnswerResultModel.fromJson(Map<String, dynamic> json) =
      _$_AnswerResultModel.fromJson;

  @override
  String get sessionID;
  @override
  String get questionID;
  @override
  List<String> get answers;
  @override
  Set<String> get collectAnswer;
  @override
  Set<String> get selectAnswer;
  @override
  @DateTimeConverter()
  DateTime? get dateTime;
  @override
  @JsonKey(ignore: true)
  _$$_AnswerResultModelCopyWith<_$_AnswerResultModel> get copyWith =>
      throw _privateConstructorUsedError;
}
