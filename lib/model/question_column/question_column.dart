import 'package:freezed_annotation/freezed_annotation.dart';

part 'question_column.freezed.dart';
part 'question_column.g.dart';

@freezed
class QuestionColumn with _$QuestionColumn {
  factory QuestionColumn.fromJson(Map<String, dynamic> json) =>
      _$QuestionColumnFromJson(json);

  const factory QuestionColumn(
      {required String id,
      required String title,
      DateTime? recentUsedBy,
      DateTime? createBy}) = _QuestionColumn;
}
