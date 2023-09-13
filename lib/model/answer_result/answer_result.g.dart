// GENERATED CODE - DO NOT MODIFY BY HAND

// ignore_for_file: non_constant_identifier_names

part of 'answer_result.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_AnswerResultModel _$$_AnswerResultModelFromJson(Map<String, dynamic> json) =>
    _$_AnswerResultModel(
      sessionID: json['sessionID'] as String,
      questionID: json['questionID'] as String,
      answers: (json['answers'] as List<dynamic>?)
              ?.map((e) => e as String)
              .toList() ??
          const [],
      collectAnswer: (json['collectAnswer'] as List<dynamic>?)
              ?.map((e) => e as String)
              .toSet() ??
          const {},
      selectAnswer: (json['selectAnswer'] as List<dynamic>?)
              ?.map((e) => e as String)
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
    'answers': instance.answers,
    'collectAnswer': instance.collectAnswer.toList(),
    'selectAnswer': instance.selectAnswer.toList(),
  };

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

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
