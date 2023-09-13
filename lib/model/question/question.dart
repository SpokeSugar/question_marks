import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:uuid/uuid.dart';

import '../answer/answer.dart';

part 'question.freezed.dart';
part 'question.g.dart';

@Freezed(makeCollectionsUnmodifiable: true)
class QuestionModel with _$QuestionModel {
  static const questionPath = 'question_data';

  const QuestionModel._();

  factory QuestionModel.fromJson(Map<String, dynamic> json) =>
      _$QuestionModelFromJson(json);

  const factory QuestionModel(
      {required String q,
      required List<AnswerModel> answers,
      String? imagePath,
      String? explanation,
      required String uuid}) = _QuestionModel;

  List<AnswerModel> toShuffleList() {
    final newList = answers.toList();
    newList.shuffle();
    return newList;
  }

  Set<AnswerModel> toCollectSet() {
    return answers.where((e) => e.isCorrect).toSet();
  }

  List<String> toIDList() {
    return answers.map((e) => e.uuid).toList();
  }

  Set<String> toIDSet() {
    return answers.map((e) => e.uuid).toSet();
  }

  Set<String> toCollectIDSet() {
    return toCollectSet().map((e) => e.uuid).toSet();
  }

  Iterable<AnswerModel> getFromAnswerIDIterable(Iterable<String> ids) {
    return answers.where((e) => ids.contains(e.uuid) || ids.contains(e.uuid));
  }

  String? getUniqueAnswerID() {
    final idList = answers.map((e) => e.uuid);

    while (true) {
      final newID = const Uuid().v4();
      if (!(idList.contains(newID))) {
        return newID;
      }
    }
  }
}
