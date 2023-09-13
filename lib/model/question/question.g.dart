// GENERATED CODE - DO NOT MODIFY BY HAND

// ignore_for_file: non_constant_identifier_names

part of 'question.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_QuestionModel _$$_QuestionModelFromJson(Map<String, dynamic> json) =>
    _$_QuestionModel(
      q: json['q'] as String,
      answers: (json['answers'] as List<dynamic>)
          .map((e) => AnswerModel.fromJson(e as Map<String, dynamic>))
          .toList(),
      imagePath: json['imagePath'] as String?,
      explanation: json['explanation'] as String?,
      uuid: json['uuid'] as String,
    );

Map<String, dynamic> _$$_QuestionModelToJson(_$_QuestionModel instance) {
  final val = <String, dynamic>{
    'q': instance.q,
    'answers': instance.answers,
  };

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('imagePath', instance.imagePath);
  writeNotNull('explanation', instance.explanation);
  val['uuid'] = instance.uuid;
  return val;
}
