import 'dart:convert';
import 'dart:io';

import 'package:path/path.dart' as p;
import 'package:path_provider/path_provider.dart';

import '../../model/question/question.dart';
import '../../state/file_loading_state/file_loading_state_notifier.dart';
import '../abstract/question_io.dart';

class JsonQuestionsIO implements QuestionsIO {
  const JsonQuestionsIO();

  @override
  Future<List<QuestionModel>> getQuestions(String id) async {
    final appDoc = await getApplicationDocumentsDirectory();
    final file = File(p.join(appDoc.absolute.path, QuestionModel.questionPath,
        id, FileLoadingSession.quizJsonFilePath));

    final fileString = await file.readAsString();
    final List<dynamic> jsonData = jsonDecode(fileString);
    List<QuestionModel> questionList = jsonData.map((e) {
      final item = QuestionModel.fromJson(e);
      if (item.imagePath != null && item.imagePath != "") {
        final imageFolder = File(p.join(
            appDoc.absolute.path,
            QuestionModel.questionPath,
            id,
            FileLoadingSession.imageFolderPath,
            item.imagePath?.toLowerCase()));
        if (imageFolder.existsSync()) {
          return item.copyWith(imagePath: imageFolder.absolute.path);
        }
      }
      return item.copyWith(imagePath: null);
    }).toList();
    return questionList;
  }
}
