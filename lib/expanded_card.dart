import 'package:flutter/material.dart';
import 'package:question_marks/mixin/localization_mixin.dart';

class ExpandedCard extends StatelessWidget {
  const ExpandedCard({
    super.key,
    required this.title,
    required this.isCollect,
    this.description,
  });

  final String title;
  final String? description;
  final bool isCollect;

  @override
  Widget build(BuildContext context) {
    final color = isCollect
        ? Theme.of(context).colorScheme.secondaryContainer
        : Theme.of(context).colorScheme.errorContainer;
    final textColor = isCollect
        ? Theme.of(context).colorScheme.onSecondaryContainer
        : Theme.of(context).colorScheme.onErrorContainer;
    return Card(
      color: color,
      clipBehavior: Clip.antiAlias,
      child: ExpansionTile(
        childrenPadding: const EdgeInsets.all(8),
        expandedCrossAxisAlignment: CrossAxisAlignment.start,
        iconColor: textColor,
        title: Text(
          title,
          style: Theme.of(context)
              .textTheme
              .titleMedium
              ?.copyWith(color: textColor),
        ),
        children: [
          Divider(
            color: textColor,
          ),
          Text(
            description ?? context.appL10n.noneDescription,
            style: Theme.of(context)
                .textTheme
                .bodyMedium
                ?.copyWith(color: textColor),
          ),
        ],
      ),
    );
  }
}
