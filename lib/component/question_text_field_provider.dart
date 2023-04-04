import 'package:flutter/cupertino.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

final questionTextFieldProvider = ChangeNotifierProvider.autoDispose
    .family((ref, int id) => TextEditingController());

final questionTextFieldValueProvider = StateProvider.autoDispose.family(
    (ref, int value) => ref.watch(questionTextFieldProvider.call(value)).value);

final answerTextFieldProvider =
    StateProvider.autoDispose.family((ref, int value) {
  return TextEditingController();
});

final answerTextFieldValueProvider = StateProvider.autoDispose.family(
    (ref, int value) => ref.watch(answerTextFieldProvider.call(value)).value);
