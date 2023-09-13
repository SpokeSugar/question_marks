import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:question_marks/extension/string_list_extension.dart';

import '../answer/answer.dart';
import '../question/question.dart';

part 'create_question_screen_state.freezed.dart';

@freezed
class CreateQuestionScreenState with _$CreateQuestionScreenState {
  const CreateQuestionScreenState._();

  const factory CreateQuestionScreenState(
          {String? title, @Default([]) List<QuestionModel> questionIDs}) =
      _CreateQuestionScreenState;

  String getUniqueQuestionID() => questionIDs.map((e) => e.uuid).getUniqueID();

  String getUniqueAnswerIDFromIndex(int index) =>
      questionIDs[index].answers.map((e) => e.uuid).getUniqueID();
}

extension AnswerListExtenstion on List<AnswerModel> {
  String getUniqueID() => map((e) => e.uuid).getUniqueID();
}
