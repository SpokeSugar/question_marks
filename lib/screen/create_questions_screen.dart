import 'package:adaptive_breakpoints/adaptive_breakpoints.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:question_marks/component/back_home_button.dart';
import 'package:question_marks/component/question_text_field.dart';
import 'package:question_marks/state/create_question_answer_text_field_provider/create_question_answer_text_field_provider.dart';
import 'package:question_marks/state/create_question_screen_state_notifer/create_question_screen_state_notifier.dart';

import '../model/question/question.dart';

class CreateQuestionsScreen extends StatelessWidget {
  const CreateQuestionsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: CustomScrollView(
        slivers: [
          SliverAppBar(
            leading: BackHomeButton(),
            title: Text("Create Questions"),
          ),
          SliverFillRemaining(
            child: Center(
              child: Text('Unimplemented'),
            ),
          )
          // QuestionTitleSliver(),
          // QuestionCardsSliver(),
          // AddQuestionButtonColumn()
        ],
      ),
      // floatingActionButton: CreateQuestionFab(),
    );
  }
}

class CreateQuestionFab extends ConsumerWidget {
  const CreateQuestionFab({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Visibility(
      child: FloatingActionButton(
          child: const Icon(Icons.save_outlined),
          onPressed: () {
            ref
                .read(createQuestionScreenStateNotifierProvider.notifier)
                .copyAnswer();
            debugPrint(ref.read(createQuestionCanSaveProvider).toString());
          }
          // ref.read(createQuestionScreenStateNotifierProvider.notifier).save(),
          ),
    );
  }
}

final createQuestionTitleProvider =
    ChangeNotifierProvider.autoDispose((ref) => TextEditingController());

class CreateQuestionTitleTextField extends ConsumerWidget {
  const CreateQuestionTitleTextField({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return TextField(
      controller: ref.watch(createQuestionTitleProvider),
      decoration: const InputDecoration(hintText: 'Title'),
    );
  }
}

class QuestionTitleSliver extends StatelessWidget {
  const QuestionTitleSliver({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SliverPadding(
      sliver: SliverList(
          delegate:
              SliverChildListDelegate(const [CreateQuestionTitleTextField()])),
      padding:
          EdgeInsets.symmetric(horizontal: getBreakpointEntry(context).margin),
    );
  }
}

class QuestionCardsSliver extends ConsumerWidget {
  const QuestionCardsSliver({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return SliverList(
      delegate: SliverChildBuilderDelegate(
          (ctx, index) => EditableQuestionsCard(
                ref.watch(createQuestionScreenStateNotifierProvider
                    .select((value) => value.questionIDs[index])),
                index: index + 1,
              ),
          childCount: ref
              .watch(createQuestionScreenStateNotifierProvider)
              .questionIDs
              .length),
    );
  }
}

class EditableQuestionsCard extends ConsumerWidget {
  const EditableQuestionsCard(
    this.model, {
    required this.index,
    Key? key,
  }) : super(key: key);
  final QuestionModel model;
  final int index;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Card(
      margin: EdgeInsets.symmetric(
          horizontal: getBreakpointEntry(context).margin,
          vertical: getBreakpointEntry(context).margin / 2),
      child: Padding(
        padding: EdgeInsets.symmetric(
          vertical: getBreakpointEntry(context).margin / 2,
          horizontal: getBreakpointEntry(context).margin,
        ),
        child: Column(
          crossAxisAlignment: (getBreakpointEntry(context).adaptiveWindowType >
                  AdaptiveWindowType.xsmall)
              ? CrossAxisAlignment.start
              : CrossAxisAlignment.center,
          children: [
            TextField(
              controller: ref.watch(questionTextFieldProvider.call(model.uuid)),
              maxLines: 3,
              decoration: InputDecoration(labelText: "Question $index"),
            ),
            for (int i = 0; i < model.list.length; i++)
              AnswerTextField(
                indexText: (i + 1).toString(),
                answerID: model.list[i].uuid,
                questionID: model.uuid,
              ),
            AddAnswerButton(
              questionID: model.uuid,
              finalAnswerID: model.list.last.uuid,
            )
          ],
        ),
      ),
    );
  }
}

class AddAnswerButton extends ConsumerWidget {
  const AddAnswerButton(
      {super.key, required this.questionID, required this.finalAnswerID});

  final String questionID;
  final String finalAnswerID;

  @override
  Widget build(BuildContext context, ref) {
    return FilledButton.tonalIcon(
        onPressed: (ref.watch(answerTextFieldProvider
                    .call(CreateAnswerListID(questionID, finalAnswerID))
                    .select((value) => value.text == '')) ||
                ref.watch(answerTextFieldProvider
                    .call(CreateAnswerListID(questionID, finalAnswerID))
                    .select((value) => value.text == '')))
            ? () => ref
                .read(createQuestionScreenStateNotifierProvider.notifier)
                .createNewAnswer(questionID)
            : null,
        icon: const Icon(Icons.add),
        label: const Text("Answer"));
  }
}

class AddQuestionButtonColumn extends ConsumerWidget {
  const AddQuestionButtonColumn({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return SliverToBoxAdapter(
      child: Align(
          alignment: (getBreakpointEntry(context).adaptiveWindowType >
                  AdaptiveWindowType.xsmall)
              ? Alignment.topLeft
              : Alignment.center,
          child: Padding(
            padding: EdgeInsets.only(
                bottom: getBreakpointEntry(context).margin,
                left: getBreakpointEntry(context).margin),
            child: FilledButton.icon(
              onPressed: () => ref
                  .read(createQuestionScreenStateNotifierProvider.notifier)
                  .createNewQuestion(),
              icon: const Icon(Icons.add),
              label: const Text("Question"),
            ),
          )),
    );
  }
}
