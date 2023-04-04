import 'dart:collection';
import 'dart:convert';
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

@riverpod
class QuestionIDListState extends _$QuestionIDListState {
  @override
  FutureOr<List<QuestionColumn>> build() async {
    ref.keepAlive();
    getFromDirectory();
    return <QuestionColumn>[];
  }

  List<String> get getIDList => state.value!.map((e) => e.id).toList();

  Future<void> getFromDirectory({Directory? directory}) async {
    if (directory == null && !kIsWeb) {
      final getDirectory = await getApplicationDocumentsDirectory();
      directory = Directory(
          p.join(getDirectory.absolute.path, QuestionModel.questionPath));
    }
    if (directory != null) {
      state = await AsyncValue.guard(
          () async => UnmodifiableListView([...(await getList(directory!))]));
    }
  }

  static Future<List<QuestionColumn>> getList(Directory directory) async {
    List<QuestionColumn> questionIDList = [];

    final sortedList = directory.listSync().toList();

    sortedList
        .sort((a, b) => b.statSync().changed.compareTo(a.statSync().changed));

    for (final i in sortedList) {
      if (i is Directory) {
        final id = File(p.join(i.absolute.path, 'id.json'));
        if (await id.exists()) {
          try {
            questionIDList = [
              QuestionColumn.fromJson(
                  jsonDecode(await id.readAsString(encoding: utf8))),
              ...questionIDList
            ];
          } catch (e) {
            debugPrint("$e");
          }
        }
      }
    }
    return questionIDList;
  }

  Future<void> setIDColumn(String title, String id) async {
    state = AsyncData(UnmodifiableListView(
        [QuestionColumn(title: title, id: id), ...?state.value]));
  }

  String setIDData(String title, List<QuestionModel> model) {
    final id = getUniqueID();
    ref.watch(questionManagerProvider.call(id).notifier).setValue(model);
    state = AsyncData(UnmodifiableListView(
        [QuestionColumn(title: title, id: id), ...?state.value]));
    return id;
  }

  static Future<void> removeIDFromFile(Directory quizDirectory) async {
    if (quizDirectory.existsSync()) {
      quizDirectory.delete(recursive: true);
    }
  }

  Future<void> removeID(int value) async {
    state = await AsyncValue.guard(() async {
      final newList = state.value?.toList();

      final docDoc = await getApplicationDocumentsDirectory();
      if ((state.value?.length ?? 0) > value) {
        await compute(
          removeIDFromFile,
          Directory(
            p.joinAll(
              [
                docDoc.absolute.path,
                QuestionModel.questionPath,
                if (state.value?[value].id != null) state.value![value].id
              ],
            ),
          ),
        );
      }
      newList?.removeAt(value);
      return UnmodifiableListView([...?newList]);
    });
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
