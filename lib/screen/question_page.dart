import 'dart:io';

import 'package:flutter/material.dart';
import 'package:question_marks/mixin/localization_mixin.dart';
import 'package:question_marks/model/question/question.dart';

import '../component/button/answer_component.dart';
import '../component/button/question_backbutton.dart';

class QuestionPage extends StatelessWidget {
  const QuestionPage(
    this.question, {
    this.selectedIndex,
    this.collectValue,
    super.key,
  });

  final QuestionModel question;
  final SelectedIndex? selectedIndex;
  final int? collectValue;

  @override
  Widget build(BuildContext context) {
    final canPop = ModalRoute.of(context)?.canPop ?? false;
    return Scaffold(
      body: CustomScrollView(
        slivers: [
          SliverAppBar.medium(
            leading: canPop ? const QuestionBackbutton() : null,
            title: Text(context.appL10n.question),
          ),
          SliverPadding(
            padding: const EdgeInsets.symmetric(horizontal: 8),
            sliver: SliverList(
              delegate: SliverChildListDelegate([
                Text(
                  question.q,
                  style: Theme.of(context).textTheme.bodyLarge,
                ),
                const SizedBox(
                  height: 8,
                ),
                if (question.imagePath != null)
                  Image.file(File(question.imagePath!)),
                if (question.imagePath != null)
                  const SizedBox(
                    height: 8,
                  ),
                (question.toCollectSet().length == 1)
                    ? AnswerButtonBar(
                        answers: question.toShuffleList(),
                        selectedIndex: selectedIndex,
                      )
                    : AnswerSelector(
                        answers: question.toShuffleList(),
                        selectedIndex: selectedIndex,
                        maxValue: collectValue,
                      )
              ]),
            ),
          )
        ],
      ),
    );
  }
}
