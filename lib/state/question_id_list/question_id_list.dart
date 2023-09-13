import 'dart:async';

import 'package:collection/collection.dart';
import 'package:flutter/foundation.dart';
import 'package:question_marks/model/question_column/question_column.dart';
import 'package:question_marks/state/question_manager/question_manager.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:uuid/uuid.dart';

import '../../database/abstract/question_list_io.dart';
import '../../logger.dart';
import '../../model/question/question.dart';

part 'question_id_list.g.dart';

@riverpod
class QuestionIDListState extends _$QuestionIDListState {
  StreamSubscription? requestListSubscription;

  @override
  FutureOr<List<QuestionColumn>> build() async {
    if (!kIsWeb) {
      requestList();
      return <QuestionColumn>[];
    }

    return <QuestionColumn>[];
  }

  void requestList() {
    void addRequest() {
      state = const AsyncLoading();

      requestListSubscription =
          ref.watch(questionListIOProvider).fetchListStream().listen(
        (event) {
          state = AsyncData([event, ...?state.value].sortedBy(
              (e) => e.recentUsedBy ?? DateTime.fromMillisecondsSinceEpoch(0)));
        },
        onError: (obj) {
          logger.e("$runtimeType.requestList() ERROR: $obj", stackTrace: obj);
          requestListSubscription = null;
        },
        onDone: () {
          logger.i(
              "$runtimeType.requestList(): QuestionIDList Complete loading All");
          requestListSubscription = null;
        },
      );
    }

    if (requestListSubscription == null) {
      addRequest();
      return;
    }
    requestListSubscription!.cancel().then((value) => addRequest);
  }

  String setQuestions(String title, List<QuestionModel> model) {
    final id = getUniqueID();
    ref.watch(questionManagerProvider.call(id).notifier).overrideValue(model);
    state = AsyncData(UnmodifiableListView(
        [QuestionColumn(title: title, id: id), ...?state.value]));
    return id;
  }

  Future<void> removeID(int value) async {
    state = await AsyncValue.guard(
        () async => await ref.watch(questionListIOProvider).removeID(value));
  }

  String getUniqueID() {
    while (true) {
      final id = const Uuid().v4();
      if (!(state.value?.map((e) => e.id).contains(id) ?? false)) {
        return id;
      }
    }
  }
}
