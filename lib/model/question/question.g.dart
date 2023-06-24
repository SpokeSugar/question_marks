// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'question.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_QuestionModel _$$_QuestionModelFromJson(Map<String, dynamic> json) =>
    _$_QuestionModel(
      q: json['q'] as String,
      list: (json['list'] as List<dynamic>)
          .map((e) => AnswerModel.fromJson(e as Map<String, dynamic>))
          .toList(),
      imagePath: json['imagePath'] as String?,
      uuid: json['uuid'] as String,
    );

Map<String, dynamic> _$$_QuestionModelToJson(_$_QuestionModel instance) {
  final val = <String, dynamic>{
    'q': instance.q,
    'list': instance.list,
  };

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('imagePath', instance.imagePath);
  val['uuid'] = instance.uuid;
  return val;
}
