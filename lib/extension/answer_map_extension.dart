import '../model/answer/answer.dart';

extension AnswerMapExtension on Map<String, AnswerModel> {
  Set<AnswerModel> toAnswerSet(Set<String> id) {
    final map = <AnswerModel>{};
    forEach((key, value) {
      if (id.contains(key)) {
        map.add(value);
      }
    });
    return map;
  }
}
