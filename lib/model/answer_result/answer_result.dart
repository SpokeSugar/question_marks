import 'package:flutter/foundation.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:question_marks/model/question_session_state/question_session_state.dart';

part 'answer_result.freezed.dart';
part 'answer_result.g.dart';

@freezed
class AnswerResultModel with _$AnswerResultModel {
  const AnswerResultModel._();
  factory AnswerResultModel.fromJson(Map<String, dynamic> json) =>
      _$AnswerResultModelFromJson(json);

  @JsonSerializable(includeIfNull: false)
  const factory AnswerResultModel({
    required String sessionID,
    required String questionID,
    @Default([]) List<String> answers,
    @Default({}) Set<String> collectAnswer,
    @Default({}) Set<String> selectAnswer,
    @DateTimeConverter() DateTime? dateTime,
  }) = _AnswerResultModel;

  bool get isCollectAll => setEquals(selectAnswer, collectAnswer);
}
