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
  String get resultID => throw _privateConstructorUsedError;
  int? get questionHash => throw _privateConstructorUsedError;
  List<AnswerID> get answers => throw _privateConstructorUsedError;
  Set<AnswerID> get collectAnswer => throw _privateConstructorUsedError;
  Set<AnswerID> get selectAnswer => throw _privateConstructorUsedError;
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
      String resultID,
      int? questionHash,
      List<AnswerID> answers,
      Set<AnswerID> collectAnswer,
      Set<AnswerID> selectAnswer,
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
    Object? resultID = null,
    Object? questionHash = freezed,
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
      resultID: null == resultID
          ? _value.resultID
          : resultID // ignore: cast_nullable_to_non_nullable
              as String,
      questionHash: freezed == questionHash
          ? _value.questionHash
          : questionHash // ignore: cast_nullable_to_non_nullable
              as int?,
      answers: null == answers
          ? _value.answers
          : answers // ignore: cast_nullable_to_non_nullable
              as List<AnswerID>,
      collectAnswer: null == collectAnswer
          ? _value.collectAnswer
          : collectAnswer // ignore: cast_nullable_to_non_nullable
              as Set<AnswerID>,
      selectAnswer: null == selectAnswer
          ? _value.selectAnswer
          : selectAnswer // ignore: cast_nullable_to_non_nullable
              as Set<AnswerID>,
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
      String resultID,
      int? questionHash,
      List<AnswerID> answers,
      Set<AnswerID> collectAnswer,
      Set<AnswerID> selectAnswer,
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
    Object? resultID = null,
    Object? questionHash = freezed,
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
      resultID: null == resultID
          ? _value.resultID
          : resultID // ignore: cast_nullable_to_non_nullable
              as String,
      questionHash: freezed == questionHash
          ? _value.questionHash
          : questionHash // ignore: cast_nullable_to_non_nullable
              as int?,
      answers: null == answers
          ? _value._answers
          : answers // ignore: cast_nullable_to_non_nullable
              as List<AnswerID>,
      collectAnswer: null == collectAnswer
          ? _value._collectAnswer
          : collectAnswer // ignore: cast_nullable_to_non_nullable
              as Set<AnswerID>,
      selectAnswer: null == selectAnswer
          ? _value._selectAnswer
          : selectAnswer // ignore: cast_nullable_to_non_nullable
              as Set<AnswerID>,
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
      required this.resultID,
      this.questionHash,
      final List<AnswerID> answers = const [],
      final Set<AnswerID> collectAnswer = const {},
      final Set<AnswerID> selectAnswer = const {},
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
  @override
  final String resultID;
  @override
  final int? questionHash;
  final List<AnswerID> _answers;
  @override
  @JsonKey()
  List<AnswerID> get answers {
    if (_answers is EqualUnmodifiableListView) return _answers;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_answers);
  }

  final Set<AnswerID> _collectAnswer;
  @override
  @JsonKey()
  Set<AnswerID> get collectAnswer {
    if (_collectAnswer is EqualUnmodifiableSetView) return _collectAnswer;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableSetView(_collectAnswer);
  }

  final Set<AnswerID> _selectAnswer;
  @override
  @JsonKey()
  Set<AnswerID> get selectAnswer {
    if (_selectAnswer is EqualUnmodifiableSetView) return _selectAnswer;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableSetView(_selectAnswer);
  }

  @override
  @DateTimeConverter()
  final DateTime? dateTime;

  @override
  String toString({DiagnosticLevel minLevel = DiagnosticLevel.info}) {
    return 'AnswerResultModel(sessionID: $sessionID, questionID: $questionID, resultID: $resultID, questionHash: $questionHash, answers: $answers, collectAnswer: $collectAnswer, selectAnswer: $selectAnswer, dateTime: $dateTime)';
  }

  @override
  void debugFillProperties(DiagnosticPropertiesBuilder properties) {
    super.debugFillProperties(properties);
    properties
      ..add(DiagnosticsProperty('type', 'AnswerResultModel'))
      ..add(DiagnosticsProperty('sessionID', sessionID))
      ..add(DiagnosticsProperty('questionID', questionID))
      ..add(DiagnosticsProperty('resultID', resultID))
      ..add(DiagnosticsProperty('questionHash', questionHash))
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
            (identical(other.resultID, resultID) ||
                other.resultID == resultID) &&
            (identical(other.questionHash, questionHash) ||
                other.questionHash == questionHash) &&
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
      resultID,
      questionHash,
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
      required final String resultID,
      final int? questionHash,
      final List<AnswerID> answers,
      final Set<AnswerID> collectAnswer,
      final Set<AnswerID> selectAnswer,
      @DateTimeConverter() final DateTime? dateTime}) = _$_AnswerResultModel;
  const _AnswerResultModel._() : super._();

  factory _AnswerResultModel.fromJson(Map<String, dynamic> json) =
      _$_AnswerResultModel.fromJson;

  @override
  String get sessionID;
  @override
  String get questionID;
  @override
  String get resultID;
  @override
  int? get questionHash;
  @override
  List<AnswerID> get answers;
  @override
  Set<AnswerID> get collectAnswer;
  @override
  Set<AnswerID> get selectAnswer;
  @override
  @DateTimeConverter()
  DateTime? get dateTime;
  @override
  @JsonKey(ignore: true)
  _$$_AnswerResultModelCopyWith<_$_AnswerResultModel> get copyWith =>
      throw _privateConstructorUsedError;
}

AnswerID _$AnswerIDFromJson(Map<String, dynamic> json) {
  return _AnswerID.fromJson(json);
}

/// @nodoc
mixin _$AnswerID {
  String get uuid => throw _privateConstructorUsedError;
  int? get hash => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $AnswerIDCopyWith<AnswerID> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $AnswerIDCopyWith<$Res> {
  factory $AnswerIDCopyWith(AnswerID value, $Res Function(AnswerID) then) =
      _$AnswerIDCopyWithImpl<$Res, AnswerID>;
  @useResult
  $Res call({String uuid, int? hash});
}

/// @nodoc
class _$AnswerIDCopyWithImpl<$Res, $Val extends AnswerID>
    implements $AnswerIDCopyWith<$Res> {
  _$AnswerIDCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? uuid = null,
    Object? hash = freezed,
  }) {
    return _then(_value.copyWith(
      uuid: null == uuid
          ? _value.uuid
          : uuid // ignore: cast_nullable_to_non_nullable
              as String,
      hash: freezed == hash
          ? _value.hash
          : hash // ignore: cast_nullable_to_non_nullable
              as int?,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$_AnswerIDCopyWith<$Res> implements $AnswerIDCopyWith<$Res> {
  factory _$$_AnswerIDCopyWith(
          _$_AnswerID value, $Res Function(_$_AnswerID) then) =
      __$$_AnswerIDCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({String uuid, int? hash});
}

/// @nodoc
class __$$_AnswerIDCopyWithImpl<$Res>
    extends _$AnswerIDCopyWithImpl<$Res, _$_AnswerID>
    implements _$$_AnswerIDCopyWith<$Res> {
  __$$_AnswerIDCopyWithImpl(
      _$_AnswerID _value, $Res Function(_$_AnswerID) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? uuid = null,
    Object? hash = freezed,
  }) {
    return _then(_$_AnswerID(
      uuid: null == uuid
          ? _value.uuid
          : uuid // ignore: cast_nullable_to_non_nullable
              as String,
      hash: freezed == hash
          ? _value.hash
          : hash // ignore: cast_nullable_to_non_nullable
              as int?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$_AnswerID with DiagnosticableTreeMixin implements _AnswerID {
  const _$_AnswerID({required this.uuid, this.hash});

  factory _$_AnswerID.fromJson(Map<String, dynamic> json) =>
      _$$_AnswerIDFromJson(json);

  @override
  final String uuid;
  @override
  final int? hash;

  @override
  String toString({DiagnosticLevel minLevel = DiagnosticLevel.info}) {
    return 'AnswerID(uuid: $uuid, hash: $hash)';
  }

  @override
  void debugFillProperties(DiagnosticPropertiesBuilder properties) {
    super.debugFillProperties(properties);
    properties
      ..add(DiagnosticsProperty('type', 'AnswerID'))
      ..add(DiagnosticsProperty('uuid', uuid))
      ..add(DiagnosticsProperty('hash', hash));
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_AnswerID &&
            (identical(other.uuid, uuid) || other.uuid == uuid) &&
            (identical(other.hash, hash) || other.hash == hash));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(runtimeType, uuid, hash);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_AnswerIDCopyWith<_$_AnswerID> get copyWith =>
      __$$_AnswerIDCopyWithImpl<_$_AnswerID>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_AnswerIDToJson(
      this,
    );
  }
}

abstract class _AnswerID implements AnswerID {
  const factory _AnswerID({required final String uuid, final int? hash}) =
      _$_AnswerID;

  factory _AnswerID.fromJson(Map<String, dynamic> json) = _$_AnswerID.fromJson;

  @override
  String get uuid;
  @override
  int? get hash;
  @override
  @JsonKey(ignore: true)
  _$$_AnswerIDCopyWith<_$_AnswerID> get copyWith =>
      throw _privateConstructorUsedError;
}
