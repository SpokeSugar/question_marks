import 'dart:collection';
import 'dart:convert';
import 'dart:io';
import 'dart:math' as math;

import 'package:path/path.dart' as p;
import 'package:path_provider/path_provider.dart';
import 'package:question_marks/model/answer_result/answer_result.dart';
import 'package:question_marks/model/question/question.dart';
import 'package:question_marks/state/file_loading_state/file_loading_state_notifier.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

import '../../model/answer/answer.dart';

part 'question_manager.g.dart';

@Riverpod(keepAlive: true)
class QuestionManager extends _$QuestionManager {
  static List<QuestionModel> damyData = UnmodifiableListView([
    const QuestionModel(
      q: 'test00',
      list: [
        AnswerModel(
            answer: "A",
            exp: "AはChigau",
            isCorrect: false,
            uuid: "a630e4b9-9779-440b-b97e-faa560395f95"),
        AnswerModel(
            answer: "B",
            exp: "Bダウ",
            isCorrect: true,
            uuid: "6c583c0a-c2be-4347-89c6-bd78693366c9"),
        AnswerModel(
            answer: "C",
            exp: "CはChigau",
            isCorrect: false,
            uuid: "5867653c-cb94-4f5e-b98c-4a7f12eb820e"),
        AnswerModel(
            answer: "D",
            exp: "DはChigau",
            isCorrect: false,
            uuid: "73f8122c-3bd7-489a-ba2a-683b30ad64f0"),
        AnswerModel(
            answer: "E",
            exp: "EはChigau",
            isCorrect: false,
            uuid: "940dd916-d5b1-40a3-b812-c7e653fdb69d"),
      ],
      uuid: "e3b0bae6-f768-4d40-b7c2-50f2b34ae3ff",
    ),
    const QuestionModel(
      q: 'test01',
      list: [
        AnswerModel(
            answer: "A",
            exp: "AはChigau",
            isCorrect: false,
            uuid: "01a6c1fb-0b61-4822-b7a3-a254f0801778"),
        AnswerModel(
            answer: "B",
            exp: "Bダウ",
            isCorrect: true,
            uuid: "74849f06-2dbf-491e-83d5-efbf51359ca5"),
        AnswerModel(
            answer: "C",
            exp: "CはChigau",
            isCorrect: false,
            uuid: "8e938399-ef4d-485c-bbd3-52653d69b52c"),
        AnswerModel(
            answer: "D",
            exp: "DはDao",
            isCorrect: true,
            uuid: "0278268f-876a-4893-b0b8-4091997ae112"),
        AnswerModel(
            answer: "E",
            exp: "EはChigau",
            isCorrect: false,
            uuid: "fe186fc4-b897-4dd4-a3b6-3e4aaaa85ced"),
      ],
      uuid: "d0cd3e68-3d8d-44ed-b940-7b27626a2487",
    )
  ]);

  QuestionModel? get random {
    if ((state.value?.isNotEmpty ?? false)) {
      final value = math.Random().nextInt((state.value?.length ?? 0));
      return state.value?[value - 1];
    }
    return null;
  }

  @override
  Future<List<QuestionModel>> build(String id) async {
    final appDoc = await getApplicationDocumentsDirectory();
    final file = File(p.join(appDoc.absolute.path, QuestionModel.questionPath,
        id, FileLoadingSession.quizJsonFilePath));
    if (file.existsSync()) {
      final fileString = await file.readAsString();
      final List<dynamic> jsonData = jsonDecode(fileString);
      List<QuestionModel> questionList =
          jsonData.map((e) => QuestionModel.fromJson(e)).toList();
      return questionList;
    }
    return UnmodifiableListView(damyData);
  }

  void setValue(List<QuestionModel> model) {
    state = AsyncData(UnmodifiableListView(model));
  }
}

extension GetModelExtention on List<QuestionModel> {
  Map<String, QuestionModel> get toQuestionMap =>
      Map.fromEntries(map((e) => MapEntry(e.uuid, e)));
}

extension AnswerModelListExtension on List<AnswerModel> {
  Map<String, AnswerModel> get fromAnswerIDToAnswerModel =>
      Map.fromEntries(map((e) => MapEntry(e.uuid, e)));
}

extension AnswerMapExtension on Map<AnswerID, AnswerModel> {
  Set<AnswerModel> toAnswerSet(Set<AnswerID> id) {
    final map = <AnswerModel>{};
    forEach((key, value) {
      if (id.contains(key)) {
        map.add(value);
      }
    });
    return map;
  }
}
