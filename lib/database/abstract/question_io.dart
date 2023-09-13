import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../model/question/question.dart';

final questionIOProvider =
    Provider<QuestionsIO>((ref) => throw UnimplementedError());

abstract class QuestionsIO {
  Future<List<QuestionModel>> getQuestions(String id);
}
