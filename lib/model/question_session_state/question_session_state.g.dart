// GENERATED CODE - DO NOT MODIFY BY HAND

// ignore_for_file: non_constant_identifier_names

part of 'question_session_state.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_QuestionSessionState _$$_QuestionSessionStateFromJson(
        Map<String, dynamic> json) =>
    _$_QuestionSessionState(
      question: (json['question'] as List<dynamic>?)
              ?.map((e) => QuestionModel.fromJson(e as Map<String, dynamic>))
              .toSet() ??
          const {},
      answers: (json['answers'] as List<dynamic>?)
              ?.map(
                  (e) => AnswerResultModel.fromJson(e as Map<String, dynamic>))
              .toList() ??
          const [],
      index: json['index'] as int? ?? 0,
      create: const DateTimeConverter().fromJson(json['create'] as String),
    );

Map<String, dynamic> _$$_QuestionSessionStateToJson(
        _$_QuestionSessionState instance) =>
    <String, dynamic>{
      'question': instance.question.toList(),
      'answers': instance.answers,
      'index': instance.index,
      'create': const DateTimeConverter().toJson(instance.create),
    };
