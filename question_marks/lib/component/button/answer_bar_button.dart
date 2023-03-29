import 'package:flutter/material.dart';
import 'package:question_marks/mixin/localization_mixin.dart';

import '../../router/router.dart';

class AnswerButtonBar extends StatelessWidget {
  const AnswerButtonBar({
    super.key,
    required this.isCollect,
    required this.onAgainTap,
    required this.onNextTap,
  });

  final bool isCollect;
  final VoidCallback? onAgainTap;
  final VoidCallback? onNextTap;

  @override
  Widget build(BuildContext context) {
    return ButtonBar(
      overflowButtonSpacing: 8,
      alignment: MainAxisAlignment.start,
      buttonPadding: const EdgeInsets.all(4),
      children: [
        FilledButton.icon(
          onPressed: () => const HomeRoute().go(context),
          icon: const Icon(Icons.home_outlined),
          label: Text(
            MaterialLocalizations.of(context).firstPageTooltip,
          ),
        ),
        FilledButton.icon(
          onPressed: (isCollect) ? null : onAgainTap,
          icon: const Icon(Icons.undo_outlined),
          label: Text(
            context.appL10n.again,
          ),
        ),
        FilledButton.icon(
            onPressed: (onNextTap != null) ? onNextTap : null,
            icon: const Icon(Icons.navigate_next_outlined),
            label: Text(context.appL10n.nextQuestion)),
      ],
    );
  }
}
