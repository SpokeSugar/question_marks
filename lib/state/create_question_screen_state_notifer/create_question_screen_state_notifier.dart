import 'dart:convert';

import 'package:collection/collection.dart';
import 'package:flutter/foundation.dart';
import 'package:path/path.dart' as p;
import 'package:path_provider/path_provider.dart';
import 'package:question_marks/model/question/question.dart';
import 'package:question_marks/screen/create_questions_screen.dart';
import 'package:question_marks/state/create_question_answer_text_field_provider/create_question_answer_text_field_provider.dart';
import 'package:question_marks/state/question_id_list/question_id_list.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:uuid/uuid.dart';

import '../../logger.dart';
import '../../model/answer/answer.dart';
import '../../model/create_question_screen_state/create_question_screen_state.dart';
import '../../model/file_request/file_request.dart';
import '../../model/question_column/question_column.dart';
import '../file_loading_state/file_loading_state_notifier.dart';

part 'create_question_screen_state_notifier.g.dart';

@riverpod
class CreateQuestionScreenStateNotifier
    extends _$CreateQuestionScreenStateNotifier {
  @override
  CreateQuestionScreenState build() {
    return CreateQuestionScreenState(
        questionIDs: UnmodifiableListView([
      QuestionModel(
          q: "",
          answers: [
            AnswerModel(uuid: const Uuid().v4(), label: '', isCorrect: false),
            AnswerModel(uuid: const Uuid().v4(), label: '', isCorrect: false)
          ],
          uuid: const Uuid().v4())
    ]));
  }

  void copyAnswer() {
    final iList = <QuestionModel>[];
    for (final i in state.questionIDs) {
      final jList = <AnswerModel>[];
      for (final j in i.answers) {
        final id = CreateAnswerListID(i.uuid, j.uuid);
        final answer = ref
            .read(
              answerTextFieldProvider.call(id),
            )
            .value
            .text;
        final exp =
            ref.read(answerDescriptionTextFieldProvider.call(id)).value.text;
        final correct = ref.read(answerCollectValueProvider.call(id));
        jList.add(j.copyWith(label: answer, exp: exp, isCorrect: correct));
      }
      final q = ref.read(
          questionTextFieldProvider.call(i.uuid).select((value) => value.text));
      iList.add(i.copyWith(q: q, answers: UnmodifiableListView(jList)));
    }
    state = state.copyWith(questionIDs: UnmodifiableListView(iList));
    logger.d(state.toString());
  }

  List<QuestionModel> modelsCopy() {
    return UnmodifiableListView(state.questionIDs
        .map((e) => e.copyWith(answers: UnmodifiableListView(e.answers.map(
              (i) {
                final answer = ref
                    .read(
                      answerTextFieldProvider
                          .call(CreateAnswerListID(e.uuid, i.uuid)),
                    )
                    .text;
                final exp = ref
                    .read(answerDescriptionTextFieldProvider
                        .call(CreateAnswerListID(e.uuid, i.uuid)))
                    .text;
                final isCollect = ref.read(answerCollectValueProvider
                    .call(CreateAnswerListID(e.uuid, i.uuid)));
                return i.copyWith(
                    label: answer, exp: exp, isCorrect: isCollect);
              },
            )))));
  }

  void removeAnswer(String questionID, String answerID) {
    copyAnswer();
    state = state.copyWith(
        questionIDs: UnmodifiableListView(state.questionIDs.map((e) {
      if (e.uuid == questionID) {
        return e.copyWith(
            answers: UnmodifiableListView(e.answers.map((i) {
          if (i.uuid != answerID) {
            return i;
          }
        }).whereNotNull()));
      } else {
        return e;
      }
    })));
    _removeAnswerIDForProviders(questionID, answerID);
  }

  void _removeAnswerIDForProviders(String questionID, String answerID) {
    final id = CreateAnswerListID(questionID, answerID);

    ref.invalidate(answerTextFieldProvider.call(id));
    ref.invalidate(answerDescriptionTextFieldProvider.call(id));
    ref.invalidate(answerCollectValueProvider.call(id));
  }

  void createNewQuestion() {
    copyAnswer();
    final i = const Uuid().v4();
    final j = const Uuid().v4();
    state = state.copyWith(
        questionIDs: UnmodifiableListView([
      ...state.questionIDs,
      QuestionModel(
        q: '',
        answers: [
          AnswerModel(uuid: i, label: '', isCorrect: false),
          AnswerModel(uuid: j, label: '', isCorrect: false)
        ],
        uuid: state.getUniqueQuestionID(),
      )
    ]));
  }

  void createNewAnswer(String questionID) {
    copyAnswer();
    final newQuestionIDs = state.questionIDs.map(
      (e) {
        if (e.uuid == questionID) {
          final newID = e.answers.getUniqueID();
          return e.copyWith(
              answers: UnmodifiableListView([
            ...e.answers,
            AnswerModel(uuid: newID, label: '', isCorrect: false)
          ]));
        } else {
          return e;
        }
      },
    );
    state = state.copyWith(
      questionIDs: UnmodifiableListView(newQuestionIDs),
    );
  }

  void removeIndex(int index) {
    copyAnswer();
    if (state.questionIDs.length > index) {
      final stockList = state.questionIDs.toList();
      final item = stockList.removeAt(index);
      state = state.copyWith(questionIDs: UnmodifiableListView(stockList));
      for (var e in item.answers) {
        _removeAnswerIDForProviders(item.uuid, e.uuid);
      }
      ref.invalidate(questionTextFieldProvider.call(item.uuid));
    }
  }

  Future<void> save({VoidCallback? isSuccess}) async {
    try {
      final documentsDirectory = await getApplicationDocumentsDirectory();
      final id = ref.watch(questionIDListStateProvider.notifier).getUniqueID();
      final iList = [];
      for (final i in state.questionIDs) {
        final jList = <AnswerModel>[];
        for (final j in i.answers) {
          final id = CreateAnswerListID(i.uuid, j.uuid);
          jList.add(
            j.copyWith(
              label: ref.read(
                answerTextFieldProvider.call(id).select((value) => value.text),
              ),
              exp: ref.read(
                answerDescriptionTextFieldProvider
                    .call(id)
                    .select((value) => value.text),
              ),
              isCorrect: ref.read(answerCollectValueProvider.call(id)),
            ),
          );
        }
        iList.add(i.copyWith(
            answers: UnmodifiableListView(jList),
            q: ref.read(questionTextFieldProvider
                .call(i.uuid)
                .select((value) => value.text))));
      }
      final questionTask = compute(
          FileLoadingSession.replaceFile,
          FileReq(
              p.join(
                  documentsDirectory.absolute.path,
                  QuestionModel.questionPath,
                  id,
                  FileLoadingSession.quizJsonFilePath),
              jsonEncode(iList)));

      final questionIDTask = compute(
        FileLoadingSession.replaceFile,
        FileReq(
          p.join(documentsDirectory.absolute.path, QuestionModel.questionPath,
              id, FileLoadingSession.idFilePath),
          jsonEncode(
            QuestionColumn(
                title: ref.watch(
                    createQuestionTitleProvider.select((value) => value.text)),
                id: id),
          ),
        ),
      );

      await questionTask;
      await questionIDTask;

      isSuccess?.call();
      ref.watch(questionIDListStateProvider.notifier).build();
    } catch (e) {
      debugPrint(e.toString());
    }
  }
}

final createQuestionCanSaveProvider = Provider.autoDispose((ref) {
  return ref.watch(createQuestionScreenStateNotifierProvider.select((value) {
    for (final i in value.questionIDs) {
      if (i.q == '') {
        return false;
      }
      final collects = <bool>[];
      for (final j in i.answers) {
        collects.add(j.isCorrect);
        if (j.label == '') {
          return false;
        }
      }
      if (collects.contains(false)) {
        return false;
      }
    }
    return true;
  }));
});
