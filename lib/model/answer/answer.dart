import 'package:freezed_annotation/freezed_annotation.dart';

part 'answer.freezed.dart';
part 'answer.g.dart';

@freezed
class AnswerModel with _$AnswerModel {
  factory AnswerModel.fromJson(Map<String, dynamic> json) =>
      _$AnswerModelFromJson(json);

  const factory AnswerModel({
    required String uuid,
    required String answer,
    String? exp,
    required bool isCorrect,
  }) = _answerModel;
}
