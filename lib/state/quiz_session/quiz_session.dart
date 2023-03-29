import 'dart:collection';

import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:question_marks/model/answer_result/answer_result.dart';
import 'package:question_marks/state/session_list/session_list.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:uuid/uuid.dart';

import '../../model/question/question.dart';
import '../../model/question_session_state/question_session_state.dart';

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

  String getNewAnswerResultID() {
    final map = state.answers.map((e) => e.resultID).toList();
    while (true) {
      String i = const Uuid().v4();
      if (!map.contains(i)) {
        return i;
      }
    }
  }

  int addAnswerList(AnswerResultModel model) {
    state = state.copyWith(
        answers: UnmodifiableListView([...state.answers, model]));
    return state.answers.length - 1;
  }

  void addQuestionSet(QuestionModel model) {
    state = state.copyWith(
        question: UnmodifiableSetView({...state.question, model}));
  }
}
