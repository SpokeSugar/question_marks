import 'dart:async';
import 'dart:convert';
import 'dart:io';

import 'package:csv/csv.dart';
import 'package:file_selector/file_selector.dart';
import 'package:flutter/foundation.dart';
import 'package:path/path.dart' as p;
import 'package:path_provider/path_provider.dart';
import 'package:question_marks/model/question_column/question_column.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:uuid/uuid.dart';

import '../../model/answer/answer.dart';
import '../../model/file_loading_model/file_loading_model.dart';
import '../../model/question/question.dart';
import '../question_id_list/question_id_list.dart';

part 'file_loading_state_notifier.g.dart';

@riverpod
class FileLoadingSession extends _$FileLoadingSession {
  static const XTypeGroup csv = XTypeGroup(label: "csv", extensions: ["csv"]);
  static const XTypeGroup json =
      XTypeGroup(label: "json", extensions: ["json"]);

  final List<String> _questionId = [];

  static const imageFolderPath = 'image';
  static const idFilePath = "'id.json'";
  static const quizJsonFilePath = "quiz.json";

  @override
  FileLoadingState build() {
    return const FileLoadingState();
  }

  static String getUniqueID(List<String> idList) {
    while (true) {
      String id = const Uuid().v4();
      if (!idList.contains(id)) {
        return id;
      }
    }
  }

  Future<String?> openForWeb() async {
    final XFile? file = await openFile(acceptedTypeGroups: [json]);
    if (file is XFile) {
      final json = await convertJson(file);
      return ref
          .watch(questionIDListStateProvider.notifier)
          .setID('Test Products', json);
    }
    return null;
  }

  Future<void> open() async {
    final XFile? file = await openFile(acceptedTypeGroups: [csv, json]);

    if (file is XFile) {
      final tempDirectory = await getTemporaryDirectory();

      try {
        final ext = p.extension(file.path);

        final tempImageFile =
            Directory(p.join(tempDirectory.path, imageFolderPath));

        if (tempImageFile.existsSync()) {
          await tempImageFile.delete(recursive: true);
        }

        if (ext == '.csv') {
          state = state.copyWith(questions: await convertCSVFile(file));
        } else if (ext == '.json') {
          state = state.copyWith(questions: await convertJson(file));
        }

        state =
            state.copyWith(files: Directory(file.path), fileErrorText: null);
      } catch (e) {
        if (e is FormatException) {
          debugPrint("${e.message},${e.source}");
        }
        state = state.copyWith(fileErrorText: e.toString());
        rethrow;
      }
    }
  }

  Future<void> openImageDirectory() async {
    final file = await getDirectoryPath();

    if (file != null && state.questions != null) {
      try {
        final imageFile = Directory(file);
        final tempFile = await getTemporaryDirectory();
        final tempImageDirectory =
            Directory(p.join(tempFile.path, imageFolderPath));

        if (tempImageDirectory.existsSync()) {
          await tempImageDirectory.delete(recursive: true);
        }

        await tempImageDirectory.create();

        for (final i in state.questions!) {
          try {
            if (i.imagePath != null) {
              final imagePath =
                  (p.joinAll([...?i.imagePath?.split(RegExp(r'/'))]));

              final file = File(
                p.join(imageFile.absolute.path, imagePath),
              );

              final tempFile =
                  File(p.join(tempImageDirectory.absolute.path, imagePath));

              await file.copy(
                tempFile.path,
              );
            }
          } catch (e) {
            debugPrint(
              "$e",
            );
            state = state.copyWith(imageErrorText: "Unload image: $e");
          }
        }
        state = state.copyWith(
            imageDirectory: Directory(file), imageErrorText: null);
      } catch (e) {
        state = state.copyWith(imageErrorText: e.toString());
      }
    }
  }

  Future<List<QuestionModel>> convertJson(XFile file) async {
    final fileString = await file.readAsString();
    final List<dynamic> jsonData = jsonDecode(fileString);
    List<QuestionModel> questionList =
        jsonData.map((e) => QuestionModel.fromJson(e)).toList();
    return questionList;
  }

  Future<List<QuestionModel>> convertCSVFile(XFile file) async {
    final csv = await file.readAsString();
    final field = const CsvToListConverter().convert(csv);
    final questions = <QuestionModel>[];

    for (final i in field) {
      final question = i[0];
      final collectAnswer = i[1].toString();
      final answerSplit = collectAnswer
          .alphanumericToHalfLength()
          .replaceAll('＠', '@')
          .split('@')
          .map((e) => int.parse(e))
          .toList();
      String? filePath;
      if (i[2] != null && i[2] != '') {
        filePath = i[2];
      }
      final List<AnswerModel> answers = [];
      final List<String> answerId = [];
      for (int j = 3; j < i.length; j += 2) {
        String id = getUniqueID(answerId);
        answerId.add(id);
        answers.add(AnswerModel(
          uuid: id,
          answer: i[j].toString(),
          exp: i[j + 1].toString(),
          isCorrect: answerSplit.contains(answerId.length),
        ));
      }
      final id = getUniqueID(_questionId);
      _questionId.add(id);
      questions.add(QuestionModel(
        q: question,
        list: answers,
        imagePath: filePath,
        uuid: id,
      ));
    }
    return questions;
  }

  Future<void> movePhotoFile(String id) async {
    final documentsDirectory = await getApplicationDocumentsDirectory();

    final tempDirectory = await getTemporaryDirectory();

    for (final i in state.questions!) {
      if (i.imagePath != null) {
        final imagePath = p.joinAll([...?i.imagePath?.split(RegExp(r'[/\\]'))]);

        await File(p.join(p.join(tempDirectory.absolute.path, imageFolderPath),
                imagePath))
            .copy(p.join(documentsDirectory.absolute.path,
                QuestionModel.questionPath, id, imageFolderPath, imagePath));
      }
    }
  }

  Future<void> saveFile(String title) async {
    if (state.questions != null) {
      final documentsDirectory = await getApplicationDocumentsDirectory();

      final id = ref.read(questionIDListStateProvider.notifier).getUniqueID();

      await movePhotoFile(id);

      final quizFile = File(p.join(documentsDirectory.absolute.path,
          QuestionModel.questionPath, id, quizJsonFilePath));

      if (await quizFile.exists()) {
        await quizFile.delete();
      }

      final quizDataFile =
          await quizFile.create(exclusive: false, recursive: true);
      await quizDataFile.writeAsString(jsonEncode(state.questions),
          flush: true, encoding: utf8);

      final questionIDJson = File(p.join(documentsDirectory.absolute.path,
          QuestionModel.questionPath, id, idFilePath));

      if (await questionIDJson.exists()) {
        await questionIDJson.delete();
      }
      final quizColumnData =
          await questionIDJson.create(exclusive: false, recursive: true);

      await quizColumnData
          .writeAsString(jsonEncode(QuestionColumn(title: title, id: id)));
    }
  }

  static Future<void> launchTempFile() async {
    final path = await getTemporaryDirectory();
    final file = Uri.file(path.path);
    if (await canLaunchUrl(file)) {
      launchUrl(file);
    }
  }

  static Future<void> launchAppDocument() async {
    final path = await getApplicationDocumentsDirectory();
    final file = Uri.file(path.path);
    if (await canLaunchUrl(file)) {
      launchUrl(file);
    }
  }
}

extension JapaneseString on String {
  static const _fullLengthCode = 65248;

  String alphanumericToFullLength() {
    final regex = RegExp(r'^[a-zA-Z\d]+$');
    final string = runes.map<String>((rune) {
      final char = String.fromCharCode(rune);
      return regex.hasMatch(char)
          ? String.fromCharCode(rune + _fullLengthCode)
          : char;
    });
    return string.join();
  }

  String alphanumericToHalfLength() {
    final regex = RegExp(r'^[Ａ-Ｚａ-ｚ０-９]+$');
    final string = runes.map<String>((rune) {
      final char = String.fromCharCode(rune);
      return regex.hasMatch(char)
          ? String.fromCharCode(rune - _fullLengthCode)
          : char;
    });
    return string.join();
  }
}
