import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../model/question_column/question_column.dart';

final questionListIOProvider =
    Provider<QuestionListIO>((ref) => throw UnimplementedError());

abstract class QuestionListIO {
  Stream<QuestionColumn> fetchListStream();

  Future<List<QuestionColumn>> getListSync();

  Future<List<QuestionColumn>> removeID(int value);
}
