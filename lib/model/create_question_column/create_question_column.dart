import 'package:freezed_annotation/freezed_annotation.dart';

part 'create_question_column.freezed.dart';

@freezed
class CreateQuestionColumn with _$CreateQuestionColumn {
  const CreateQuestionColumn._();
  const factory CreateQuestionColumn(String questionId, List<String> answerId) =
      _CreateQuestionColumn;
}
