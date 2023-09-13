import 'dart:collection';

import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:question_marks/model/answer_result/answer_result.dart';
import 'package:question_marks/state/session_list/session_list.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

import '../../model/answer/answer.dart';
import '../../model/question_session_state/question_session_state.dart';
import '../question_manager/question_manager.dart';

part 'quiz_session.g.dart';

@riverpod
class QuestionSessions extends _$QuestionSessions {
  late final KeepAliveLink _keepAlive;

  @override
  QuestionSessionState build(String id) {
    _keepAlive = ref.keepAlive();

    ref.onDispose(() {
      ref.watch(sessionListProvider.notifier).remove(id);
    });

    return QuestionSessionState(create: DateTime.now());
  }

  void sessionClose() {
    _keepAlive.close();
  }

  void incrementIndex() {
    state = state.copyWith(index: state.index + 1);
  }

  void addSessions(String questionListId, int index, Set<AnswerModel> set,
      String sessionID) {
    final getQuestion = ref.watch(
      questionManagerProvider.call(questionListId).select(
            (value) => value.value![index],
          ),
    );

    state = state.copyWith(
        question: UnmodifiableSetView({...state.question, getQuestion}));

    final model = AnswerResultModel(
      sessionID: sessionID,
      questionID: getQuestion.uuid,
      answers: getQuestion.toIDList(),
      collectAnswer: getQuestion.toCollectIDSet(),
      selectAnswer: set.map((e) => e.uuid).toSet(),
      dateTime: DateTime.now(),
    );

    state = state.copyWith(
        answers: UnmodifiableListView([...state.answers, model]));
  }
}
