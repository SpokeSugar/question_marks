// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'answer_result.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_AnswerResultModel _$$_AnswerResultModelFromJson(Map<String, dynamic> json) =>
    _$_AnswerResultModel(
      sessionID: json['sessionID'] as String,
      questionID: json['questionID'] as String,
      resultID: json['resultID'] as String,
      questionHash: json['questionHash'] as int?,
      answers: (json['answers'] as List<dynamic>?)
              ?.map((e) => AnswerID.fromJson(e as Map<String, dynamic>))
              .toList() ??
          const [],
      collectAnswer: (json['collectAnswer'] as List<dynamic>?)
              ?.map((e) => AnswerID.fromJson(e as Map<String, dynamic>))
              .toSet() ??
          const {},
      selectAnswer: (json['selectAnswer'] as List<dynamic>?)
              ?.map((e) => AnswerID.fromJson(e as Map<String, dynamic>))
              .toSet() ??
          const {},
      dateTime: _$JsonConverterFromJson<String, DateTime>(
          json['dateTime'], const DateTimeConverter().fromJson),
    );

Map<String, dynamic> _$$_AnswerResultModelToJson(
    _$_AnswerResultModel instance) {
  final val = <String, dynamic>{
    'sessionID': instance.sessionID,
    'questionID': instance.questionID,
    'resultID': instance.resultID,
  };

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('questionHash', instance.questionHash);
  val['answers'] = instance.answers;
  val['collectAnswer'] = instance.collectAnswer.toList();
  val['selectAnswer'] = instance.selectAnswer.toList();
  writeNotNull(
      'dateTime',
      _$JsonConverterToJson<String, DateTime>(
          instance.dateTime, const DateTimeConverter().toJson));
  return val;
}

Value? _$JsonConverterFromJson<Json, Value>(
  Object? json,
  Value? Function(Json json) fromJson,
) =>
    json == null ? null : fromJson(json as Json);

Json? _$JsonConverterToJson<Json, Value>(
  Value? value,
  Json? Function(Value value) toJson,
) =>
    value == null ? null : toJson(value);

_$_AnswerID _$$_AnswerIDFromJson(Map<String, dynamic> json) => _$_AnswerID(
      uuid: json['uuid'] as String,
      hash: json['hash'] as int?,
    );

Map<String, dynamic> _$$_AnswerIDToJson(_$_AnswerID instance) {
  final val = <String, dynamic>{
    'uuid': instance.uuid,
  };

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('hash', instance.hash);
  return val;
}
