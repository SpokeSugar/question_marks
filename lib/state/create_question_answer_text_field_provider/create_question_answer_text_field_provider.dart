import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'create_question_answer_text_field_provider.freezed.dart';

@freezed
class CreateAnswerListID with _$CreateAnswerListID {
  const factory CreateAnswerListID(String questionID, String answerID) =
      _CreateAnswerListID;
}

final questionTextFieldProvider = ChangeNotifierProvider.family(
    (ref, String questionID) => TextEditingController());

final answerTextFieldProvider = ChangeNotifierProvider.family(
    (ref, CreateAnswerListID id) => TextEditingController());

final answerCollectValueProvider =
    StateProvider.family((ref, CreateAnswerListID id) => false);

final answerDescriptionTextFieldProvider = ChangeNotifierProvider.family(
    (ref, CreateAnswerListID id) => TextEditingController());
