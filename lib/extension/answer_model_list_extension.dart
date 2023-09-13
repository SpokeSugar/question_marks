import '../model/answer/answer.dart';

extension AnswerModelListExtension on List<AnswerModel> {
  Map<String, AnswerModel> get fromAnswerIDToAnswerModel =>
      Map.fromEntries(map((e) => MapEntry(e.uuid, e)));
}
