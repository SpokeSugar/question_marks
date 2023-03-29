import 'dart:collection';

import 'package:question_marks/model/answer_result/answer_result.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:uuid/uuid.dart';

part 'answer_cache.g.dart';

@Riverpod(keepAlive: true)
class AnswerCacheNotifier extends _$AnswerCacheNotifier {
  @override
  Map<String, AnswerResultModel> build(
      String questionListId, String questionId) {
    return UnmodifiableMapView({});
  }

  String setValue(AnswerResultModel result) {
    String id = _getUniqueKey();
    state = UnmodifiableMapView({...state, id: result});
    return id;
  }

  String _getUniqueKey() {
    while (true) {
      String i = const Uuid().v4();
      if (!state.containsKey(i)) {
        return i;
      }
    }
  }
}
