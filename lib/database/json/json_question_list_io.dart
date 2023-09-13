import 'dart:convert';
import 'dart:io';

import 'package:collection/collection.dart';
import 'package:flutter/foundation.dart';
import 'package:path/path.dart' as p;
import 'package:path_provider/path_provider.dart';

import '../../logger.dart';
import '../../model/question/question.dart';
import '../../model/question_column/question_column.dart';
import '../abstract/question_list_io.dart';

class JsonQuestionListIO implements QuestionListIO {
  const JsonQuestionListIO();

  @override
  Stream<QuestionColumn> fetchListStream() async* {
    final getDirectory = await getApplicationDocumentsDirectory();
    final directory = Directory(
        p.join(getDirectory.absolute.path, QuestionModel.questionPath));

    await for (final i in directory.list()) {
      if (i is Directory) {
        final id = File(p.join(i.absolute.path, 'id.json'));
        if (await id.exists()) {
          try {
            yield QuestionColumn.fromJson(
                jsonDecode(await id.readAsString(encoding: utf8)));
          } catch (e, st) {
            logger.e(e, stackTrace: st);
          }
        }
      }
    }
  }

  @override
  Future<List<QuestionColumn>> getListSync() async {
    final getDirectory = await getApplicationDocumentsDirectory();
    final directory = Directory(
        p.join(getDirectory.absolute.path, QuestionModel.questionPath));

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
          } catch (e, st) {
            logger.e(e, stackTrace: st);
          }
        }
      }
    }
    return questionIDList;
  }

  @override
  Future<List<QuestionColumn>> removeID(int value) async {
    final state = await getListSync();

    final newList = state.toList();

    final docDoc = await getApplicationDocumentsDirectory();

    if (state.length > value) {
      await compute(
        _removeIDFromFile,
        Directory(
          p.joinAll(
            [docDoc.absolute.path, QuestionModel.questionPath, state[value].id],
          ),
        ),
      );
    }
    return UnmodifiableListView(
        newList.whereIndexed((index, _) => index != value));
  }

  Future<void> _removeIDFromFile(Directory quizDirectory) async {
    if (quizDirectory.existsSync()) {
      quizDirectory.delete(recursive: true);
    }
  }
}
