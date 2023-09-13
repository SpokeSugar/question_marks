import 'dart:collection';
import 'dart:math' as math;

import 'package:question_marks/model/question/question.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

import '../../database/abstract/question_io.dart';
import '../../model/answer/answer.dart';

part 'question_manager.g.dart';

@riverpod
class QuestionManager extends _$QuestionManager {
  static List<QuestionModel> damyData = UnmodifiableListView([
    const QuestionModel(
      q: 'test00',
      answers: [
        AnswerModel(
            label: "A",
            exp: "AはChigau",
            isCorrect: false,
            uuid: "a630e4b9-9779-440b-b97e-faa560395f95"),
        AnswerModel(
            label: "B",
            exp: "Bダウ",
            isCorrect: true,
            uuid: "6c583c0a-c2be-4347-89c6-bd78693366c9"),
        AnswerModel(
            label: "C",
            exp: "CはChigau",
            isCorrect: false,
            uuid: "5867653c-cb94-4f5e-b98c-4a7f12eb820e"),
        AnswerModel(
            label: "D",
            exp: "DはChigau",
            isCorrect: false,
            uuid: "73f8122c-3bd7-489a-ba2a-683b30ad64f0"),
        AnswerModel(
            label: "E",
            exp: "EはChigau",
            isCorrect: false,
            uuid: "940dd916-d5b1-40a3-b812-c7e653fdb69d"),
      ],
      uuid: "e3b0bae6-f768-4d40-b7c2-50f2b34ae3ff",
    ),
    const QuestionModel(
      q: 'test01',
      answers: [
        AnswerModel(
            label: "A",
            exp: "AはChigau",
            isCorrect: false,
            uuid: "01a6c1fb-0b61-4822-b7a3-a254f0801778"),
        AnswerModel(
            label: "B",
            exp: "Bダウ",
            isCorrect: true,
            uuid: "74849f06-2dbf-491e-83d5-efbf51359ca5"),
        AnswerModel(
            label: "C",
            exp: "CはChigau",
            isCorrect: false,
            uuid: "8e938399-ef4d-485c-bbd3-52653d69b52c"),
        AnswerModel(
            label: "D",
            exp: "DはDao",
            isCorrect: true,
            uuid: "0278268f-876a-4893-b0b8-4091997ae112"),
        AnswerModel(
            label: "E",
            exp: "EはChigau",
            isCorrect: false,
            uuid: "fe186fc4-b897-4dd4-a3b6-3e4aaaa85ced"),
      ],
      uuid: "d0cd3e68-3d8d-44ed-b940-7b27626a2487",
    )
  ]);

  QuestionModel? get random {
    if ((state.value?.isNotEmpty ?? false)) {
      final value = math.Random().nextInt((state.value?.length ?? 0) - 1);
      return state.value?[value];
    }
    return null;
  }

  @override
  Future<List<QuestionModel>> build(String id) async {
    return ref.watch(questionIOProvider).getQuestions(id);
  }

  void overrideValue(List<QuestionModel> model) {
    ref.keepAlive();
    state = AsyncData(UnmodifiableListView(model));
  }
}
