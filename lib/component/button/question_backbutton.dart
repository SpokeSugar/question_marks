import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:question_marks/mixin/localization_mixin.dart';

import '../../router/router.dart';

class QuestionBackbutton extends StatelessWidget {
  const QuestionBackbutton({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return BackButton(
      onPressed: () => showDialog(
          context: context,
          builder: (cxt) => AlertDialog(
                title: Text(context.appL10n.backHomeCheckTitle),
                content: Text(context.appL10n.backHomeCheckBody),
                actions: [
                  TextButton(
                    onPressed: () => context.pop(),
                    child: Text(
                        MaterialLocalizations.of(context).cancelButtonLabel),
                  ),
                  TextButton(
                    onPressed: () {
                      context.pop();
                      const HomeRoute().go(context);
                    },
                    style: TextButton.styleFrom(
                      foregroundColor: Theme.of(context).colorScheme.error,
                    ),
                    child: Text(
                      MaterialLocalizations.of(context).okButtonLabel,
                    ),
                  )
                ],
              )),
    );
  }
}
