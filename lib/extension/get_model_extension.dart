import 'package:uuid/uuid.dart';

import '../model/question/question.dart';

extension GetModelExtention on List<QuestionModel> {
  Map<String, QuestionModel> get toQuestionMap =>
      Map.fromEntries(map((e) => MapEntry(e.uuid, e)));

  String uniqueID() {
    final idList = map((e) => e.uuid);
    while (true) {
      final uuid = const Uuid().v4();
      if (!idList.contains(uuid)) {
        return uuid;
      }
    }
  }
}
