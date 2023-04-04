import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:question_marks/component/question_text_field_provider.dart';

class QuestionTextField extends ConsumerWidget {
  const QuestionTextField({super.key, required this.index});

  final int index;

  @override
  Widget build(BuildContext context, ref) {
    return TextField(
      controller: ref.watch(
        questionTextFieldProvider.call(index),
      ),
      onChanged: (value) {
        ref.read(questionTextFieldValueProvider.call(index).notifier).state =
            ref.read(questionTextFieldProvider.call(index)).value;
      },
    );
  }
}
