import 'package:freezed_annotation/freezed_annotation.dart';

import '../answer_result/answer_result.dart';
import '../question/question.dart';

part 'question_session_state.freezed.dart';
part 'question_session_state.g.dart';

@freezed
class QuestionSessionState with _$QuestionSessionState {
  const QuestionSessionState._();

  factory QuestionSessionState.fromJson(Map<String, dynamic> json) =>
      _$QuestionSessionStateFromJson(json);

  const factory QuestionSessionState({
    @Default({}) Set<QuestionModel> question,
    @Default([]) List<AnswerResultModel> answers,
    @Default(0) int index,
    @DateTimeConverter() required DateTime create,
  }) = _QuestionSessionState;

  QuestionModel? getAnswerID(AnswerResultModel answerID) {
    final answerQuestion = question.where((e) =>
        e.uuid == answerID.questionID &&
        e.hashCode == (answerID.questionHash ?? e.hashCode));
    if (answerQuestion.isEmpty) {
      return null;
    } else {
      return answerQuestion.first;
    }
  }

  int getQuestionCollectNumber() {
    final map = Map.fromEntries(
        answers.map((e) => MapEntry(e.questionID, e.isCollectAll)).toList());
    int i = 0;
    map.forEach((key, value) {
      if (value) {
        i++;
      }
    });
    return i;
  }
}

class DateTimeConverter implements JsonConverter<DateTime, String> {
  const DateTimeConverter();

  @override
  DateTime fromJson(String json) {
    if (json.contains(".")) {
      json = json.substring(0, json.length - 1);
    }

    return DateTime.parse(json);
  }

  @override
  String toJson(DateTime object) => object.toIso8601String();
}
