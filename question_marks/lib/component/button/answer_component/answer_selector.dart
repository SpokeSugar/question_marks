part of '../answer_component.dart';

class AnswerSelector extends StatefulWidget with Grabful {
  const AnswerSelector(
      {Key? key, required this.answers, this.selectedIndex, this.maxValue})
      : super(key: key);
  final List<AnswerModel> answers;
  final SelectedIndex? selectedIndex;
  final int? maxValue;

  @override
  State<AnswerSelector> createState() => _AnswerSelectorState();
}

class _AnswerSelectorState extends State<AnswerSelector> {
  final answerState = AnswerSetValueNotifier();

  void answerPressed(bool isReset) {
    if (answerState.value.isNotEmpty) {
      final answer = answerState.value.toSet();
      if (isReset) {
        answerState.clear();
      }
      widget.selectedIndex?.call(answer);
    }
  }

  bool isEnable(int i) {
    return widget.maxValue == null ||
        answerState.value.length < (widget.maxValue ?? 0) ||
        answerState.value.contains(widget.answers[i]);
  }

  ValueChanged<bool>? changed(int i) {
    if (isEnable(i)) {
      return (value) {
        if (value) {
          answerState.add(widget.answers[i]);
        } else {
          answerState.remove(widget.answers[i]);
        }
      };
    }
    return null;
  }

  bool collectAnswerIs() {
    if (widget.maxValue == null) {
      return false;
    }
    return answerState.value.length != widget.maxValue;
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          children: [
            ButtonStateText(
              "Multiple",
              textColor: Theme.of(context).colorScheme.onTertiary,
              color: Theme.of(context).colorScheme.tertiary,
            ),
            if (widget.maxValue != null)
              ButtonStateText('${widget.maxValue} values',
                  color: Theme.of(context).colorScheme.tertiary,
                  textColor: Theme.of(context).colorScheme.onTertiary)
          ],
        ),
        Wrap(
          alignment: WrapAlignment.start,
          spacing: 8,
          runSpacing: 4,
          children: [
            for (int i = 0; i < widget.answers.length; i++)
              FilterChip(
                label: Text(widget.answers[i].answer),
                selected: context
                    .grab<Set<AnswerModel>>(answerState)
                    .contains(widget.answers[i]),
                onSelected: changed(i),
              ),
          ],
        ),
        const SizedBox(
          height: 8,
        ),
        Tooltip(
          message: (answerState.value.isEmpty)
              ? context.appL10n.canNotAnswerTooltips
              : "",
          child: Consumer(
            builder: (ctx, ref, child) => FilledButton(
                onPressed: (answerState.value.isEmpty || collectAnswerIs())
                    ? null
                    : () => answerPressed(
                        ref.watch(settingsNotifierProvider).clearSelect),
                child: child),
            child: Text(answerState.value.isEmpty || collectAnswerIs()
                ? context.appL10n.canNotAnswer
                : context.appL10n.answer),
          ),
        )
      ],
    );
  }
}
