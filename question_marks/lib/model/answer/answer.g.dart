// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'answer.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_answerModel _$$_answerModelFromJson(Map<String, dynamic> json) =>
    _$_answerModel(
      uuid: json['uuid'] as String,
      answer: json['answer'] as String,
      exp: json['exp'] as String?,
      isCorrect: json['isCorrect'] as bool,
    );

Map<String, dynamic> _$$_answerModelToJson(_$_answerModel instance) =>
    <String, dynamic>{
      'uuid': instance.uuid,
      'answer': instance.answer,
      'exp': instance.exp,
      'isCorrect': instance.isCorrect,
    };
