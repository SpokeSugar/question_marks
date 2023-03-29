import 'dart:collection';
import 'dart:io';

import 'package:flutter/foundation.dart';
import 'package:path/path.dart' as p;
import 'package:path_provider/path_provider.dart';
import 'package:question_marks/model/question_column/question_column.dart';
import 'package:question_marks/state/question_manager/question_manager.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:uuid/uuid.dart';

import '../../model/question/question.dart';

part 'question_id_list.g.dart';

@Riverpod(keepAlive: true)
class QuestionIDListState extends _$QuestionIDListState {
  @override
  List<QuestionColumn> build() {
    return [QuestionColumn(title: "Test Title", id: const Uuid().v4())];
  }

  List<String> get getIDList => state.map((e) => e.id).toList();

  Future<void> getIDColumn() async {
    if (kIsWeb) {
    } else {
      final appDocs = await getApplicationDocumentsDirectory();
      final directory =
          Directory(p.join(appDocs.absolute.path, QuestionModel.questionPath));
    }
  }

  String setID(String title, List<QuestionModel> model) {
    final id = getUniqueID();
    ref.watch(questionManagerProvider.call(id).notifier).setValue(model);
    state =
        UnmodifiableListView([...state, QuestionColumn(title: title, id: id)]);
    return id;
  }

  void removeID(int value) {
    final newList = state.toList();
    newList.removeAt(value);
    state = UnmodifiableListView(newList);
  }

  String getUniqueID() {
    while (true) {
      final id = const Uuid().v4();
      if (!getIDList.contains(id)) {
        return id;
      }
    }
  }
}
