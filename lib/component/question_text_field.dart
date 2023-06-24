import 'package:adaptive_breakpoints/adaptive_breakpoints.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:question_marks/state/create_question_answer_text_field_provider/create_question_answer_text_field_provider.dart';
import 'package:question_marks/state/create_question_screen_state_notifer/create_question_screen_state_notifier.dart';

class AnswerTextField extends ConsumerStatefulWidget {
  const AnswerTextField(
      {super.key,
      this.indexText,
      required this.questionID,
      required this.answerID,
      this.showDelete = true});

  final String? indexText;
  final String questionID;
  final String answerID;
  final bool showDelete;

  @override
  ConsumerState<ConsumerStatefulWidget> createState() =>
      _AnswerTextFieldState();
}

class _AnswerTextFieldState extends ConsumerState<AnswerTextField> {
  CreateAnswerListID get id =>
      CreateAnswerListID(widget.questionID, widget.answerID);

  @override
  Widget build(BuildContext context) {
    return InkWell(
      hoverColor: const Color(0x00FFFFFF),
      borderRadius: const BorderRadius.all(Radius.circular(8)),
      onTap: ref.watch(questionTextFieldProvider
              .call(widget.questionID)
              .select((value) => value.text == ''))
          ? null
          : () => ref
              .read(answerCollectValueProvider.call(id).notifier)
              .update((state) => !state),
      child: Padding(
        padding: EdgeInsets.symmetric(
          vertical: getBreakpointEntry(context).margin / 2,
        ),
        child: Row(
          children: [
            Column(children: [
              Checkbox(
                value: ref.watch(answerCollectValueProvider.call(id)),
                onChanged: ref.watch(questionTextFieldProvider
                        .call(widget.questionID)
                        .select((value) => value.text == ''))
                    ? null
                    : (value) => ref
                        .read(answerCollectValueProvider.call(id).notifier)
                        .update((state) => value ?? state),
              ),
              IconButton(
                icon: const Icon(Icons.delete),
                onPressed: () => ref
                    .read(createQuestionScreenStateNotifierProvider.notifier)
                    .removeAnswer(widget.questionID, widget.answerID),
              )
            ]),
            Expanded(
              child: Column(
                children: [
                  TextField(
                    controller: ref.watch(
                      answerTextFieldProvider.call(id),
                    ),
                    decoration:
                        InputDecoration(labelText: "A${widget.indexText}"),
                    enabled: ref.watch(questionTextFieldProvider
                        .call(widget.questionID)
                        .select((value) => value.text != '')),
                  ),
                  TextField(
                    controller: ref.watch(
                      answerDescriptionTextFieldProvider.call(id),
                    ),
                    decoration: InputDecoration(
                      hintText:
                          "Answer${widget.indexText} Description (optional)",
                    ),
                    enabled: ref.watch(questionTextFieldProvider
                            .call(widget.questionID)
                            .select((value) => value.text != '')) &&
                        ref.watch(
                          answerTextFieldProvider
                              .call(id)
                              .select((value) => value.text != ''),
                        ),
                  )
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
