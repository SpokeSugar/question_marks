import 'package:adaptive_breakpoints/adaptive_breakpoints.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../component/home_navigation_rail.dart';
import '../question_marks_application.dart';
import '../state/home_index.dart';
import 'create_questions_screen.dart';
import 'file_picker.dart';

class MyHomePage extends ConsumerWidget {
  const MyHomePage({
    super.key,
  });

  @override
  Widget build(BuildContext context, ref) {
    final entry = getBreakpointEntry(context).adaptiveWindowType >=
        AdaptiveWindowType.small;
    return Scaffold(
      body: Row(children: [
        if (ref.watch(
            homeBottomBarIndexProvider.select((value) => entry && value == 0)))
          const HomeNavigationRail(),
        if (ref.watch(
            homeBottomBarIndexProvider.select((value) => entry && value == 0)))
          VerticalDivider(
            color: Theme.of(context).colorScheme.background,
          ),
        const Expanded(child: HomeBody())
      ]),
      bottomNavigationBar: ref.watch(
              homeBottomBarIndexProvider.select((value) => entry || value != 0))
          ? null
          : const HomeNavigationBar(),
    );
  }
}

class HomeBody extends ConsumerWidget {
  const HomeBody({
    Key? key,
  }) : super(key: key);

  static const List<Widget> lists = [
    HomeQuestionList(key: PageStorageKey(0)),
    CreateQuestionsScreen(
      key: PageStorageKey(1),
    ),
    FilePickerScreen(
      key: PageStorageKey(2),
    )
  ];

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    if (lists.length > ref.watch(homeBottomBarIndexProvider)) {
      return lists[ref.watch(homeBottomBarIndexProvider)];
    }

    return const Center(
      child: Text("List is Empty"),
    );
  }
}
