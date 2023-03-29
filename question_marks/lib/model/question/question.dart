import 'package:freezed_annotation/freezed_annotation.dart';

import '../answer/answer.dart';
import '../answer_result/answer_result.dart';

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
      required List<AnswerModel> list,
      String? imagePath,
      required String uuid}) = _QuestionModel;

  List<AnswerModel> toShuffleList() {
    final newList = list.toList();
    newList.shuffle();
    return newList;
  }

  Set<AnswerModel> toCollectSet() {
    return list.where((e) => e.isCorrect).toSet();
  }

  List<AnswerID> toIDList() {
    return list.map((e) => AnswerID(uuid: e.uuid, hash: e.hashCode)).toList();
  }

  Set<AnswerID> toIDSet() {
    return list.map((e) => AnswerID(uuid: e.uuid, hash: e.hashCode)).toSet();
  }

  Set<AnswerID> toCollectIDSet() {
    return toCollectSet()
        .map((e) => AnswerID(uuid: e.uuid, hash: e.hashCode))
        .toSet();
  }

  Iterable<AnswerModel> getFromAnswerIDIterable(Iterable<AnswerID> ids) {
    return list.where((e) =>
        ids.contains(AnswerID(uuid: e.uuid)) ||
        ids.contains(AnswerID(uuid: e.uuid, hash: e.hashCode)));
  }
}
