import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:question_marks/mixin/localization_mixin.dart';
import 'package:question_marks/router/router.dart';
import 'package:question_marks/state/settings/settings_notifier.dart';

import '../component/button/answer_bar_button.dart';
import '../component/result_card.dart';
import '../expanded_card.dart';
import '../model/answer/answer.dart';

class AnswerPage extends ConsumerWidget {
  const AnswerPage({
    required this.select,
    required this.collectSet,
    super.key,
    this.questionText,
    this.textColor,
    this.onNextTap,
    this.onAgainTap,
    this.canBack = false,
  });

  final String? questionText;
  final Set<AnswerModel> select;
  final Set<AnswerModel> collectSet;
  final VoidCallback? onNextTap;
  final VoidCallback? onAgainTap;
  final Color? textColor;
  final bool canBack;
  static const route = "/answer_page";

  bool get isCollect => setEquals(select, collectSet);

  String get collectSetString {
    String result = '';
    for (var element in collectSet) {
      result = '$result${result == '' ? '' : ', '}${element.label}';
    }
    return result;
  }

  String get selectSetString {
    String result = '';
    for (var element in select) {
      result = '$result${result == '' ? '' : ', '}${element.label}';
    }
    return result;
  }

  @override
  Widget build(BuildContext context, ref) {
    final collectColor = Theme.of(context).colorScheme.secondary;
    final collectTextColor = Theme.of(context).colorScheme.onSecondary;
    final wrongColor = Theme.of(context).colorScheme.error;
    final wrongTextColor = Theme.of(context).colorScheme.onError;

    return Scaffold(
      body: CustomScrollView(
        slivers: [
          _AnswerAppBar(canBack: canBack, isCollect: isCollect),
          SliverPadding(
            sliver: SliverList(
              delegate: SliverChildListDelegate(
                [
                  if (questionText != null)
                    Text(questionText ?? "No Question Text"),
                  const Divider(),
                  if (ref.watch(settingsNotifierProvider).showResult)
                    ResultCard(
                      cardColor: collectColor,
                      text: context.appL10n.correctIs(collectSetString),
                      textColor: collectTextColor,
                    ),
                  ResultCard(
                    cardColor: isCollect ? collectColor : wrongColor,
                    text: context.appL10n.selectAnswerIs(selectSetString),
                    textColor: isCollect ? collectTextColor : wrongTextColor,
                  ),
                  const Divider(),
                  Text(
                    context.appL10n.aboutAnswer,
                    style: Theme.of(context)
                        .textTheme
                        .titleLarge
                        ?.copyWith(color: textColor),
                  ),
                  ...select.map(
                    (e) {
                      return ExpandedCard(
                        title: e.label,
                        description: e.exp,
                        isCollect: e.isCorrect,
                      );
                    },
                  ),
                  const Divider(),
                  AnswerButtonBar(
                    isCollect: isCollect,
                    onAgainTap: onAgainTap,
                    onNextTap: onNextTap,
                  ),
                ],
              ),
            ),
            padding: const EdgeInsets.symmetric(horizontal: 8),
          )
        ],
      ),
    );
  }
}

class _AnswerAppBar extends StatelessWidget {
  const _AnswerAppBar({
    required this.canBack,
    required this.isCollect,
  });

  final bool canBack;
  final bool isCollect;

  @override
  Widget build(BuildContext context) {
    final canPop = ModalRoute.of(context)?.canPop ?? false;
    return SliverAppBar.large(
      leading: (canPop)
          ? ((canBack)
              ? const BackButton()
              : CloseButton(
                  onPressed: () => const HomeRoute().go(context),
                ))
          : null,
      title: Text(isCollect ? context.appL10n.correct : context.appL10n.wrong),
    );
  }
}
