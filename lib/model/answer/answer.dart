import 'package:freezed_annotation/freezed_annotation.dart';

part 'answer.freezed.dart';
part 'answer.g.dart';

@freezed
class AnswerModel with _$AnswerModel {
  factory AnswerModel.fromJson(Map<String, dynamic> json) =>
      _$AnswerModelFromJson(json);
  const factory AnswerModel({
    required String uuid,
    required String label,
    String? exp,
    required bool isCorrect,
  }) = _answerModel;
}

extension AnswerModelIsCollectCheck on Iterable<AnswerModel> {
  bool isCollectExist() {
    bool exits = false;
    forEach((e) {
      if (e.isCorrect) {
        exits = true;
      }
    });
    return exits;
  }
}
