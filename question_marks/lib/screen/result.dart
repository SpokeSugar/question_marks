import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:question_marks/model/question_session_state/question_session_state.dart';
import 'package:question_marks/router/router.dart';

class ResultPage extends ConsumerWidget {
  const ResultPage(
    this.model, {
    Key? key,
  }) : super(key: key);

  final QuestionSessionState model;

  @override
  Widget build(BuildContext context, ref) {
    return Scaffold(
      body: CustomScrollView(
        slivers: [
          SliverAppBar.large(
            leading: CloseButton(
              onPressed: () => const HomeRoute().go(context),
            ),
            title: const Text("Result"),
          ),
          SliverPadding(
            padding: const EdgeInsets.symmetric(horizontal: 8),
            sliver: SliverList(
              delegate: SliverChildListDelegate([
                Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const Text("collect"),
                    Text(
                      "${model.getQuestionCollectNumber().toString()}|",
                      style: Theme.of(context).textTheme.displayLarge,
                    ),
                    const Text("finally"),
                    Text(
                      "${model.question.length}",
                      style: Theme.of(context).textTheme.displayLarge,
                    ),
                    const SizedBox(width: 8),
                    const Text("total"),
                    Text(
                      "${model.answers.length}",
                      style: Theme.of(context).textTheme.displayLarge,
                    ),
                  ],
                ),
              ]),
            ),
          ),
          SliverList(
              delegate: SliverChildBuilderDelegate(
                  (context, value) => const Placeholder(),
                  childCount: 0))
        ],
      ),
    );
  }
}
