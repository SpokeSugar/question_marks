// GENERATED CODE - DO NOT MODIFY BY HAND

// ignore_for_file: non_constant_identifier_names

part of 'question_column.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_QuestionColumn _$$_QuestionColumnFromJson(Map<String, dynamic> json) =>
    _$_QuestionColumn(
      id: json['id'] as String,
      title: json['title'] as String,
      recentUsedBy: json['recentUsedBy'] == null
          ? null
          : DateTime.parse(json['recentUsedBy'] as String),
      createBy: json['createBy'] == null
          ? null
          : DateTime.parse(json['createBy'] as String),
    );

Map<String, dynamic> _$$_QuestionColumnToJson(_$_QuestionColumn instance) {
  final val = <String, dynamic>{
    'id': instance.id,
    'title': instance.title,
  };

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('recentUsedBy', instance.recentUsedBy?.toIso8601String());
  writeNotNull('createBy', instance.createBy?.toIso8601String());
  return val;
}
