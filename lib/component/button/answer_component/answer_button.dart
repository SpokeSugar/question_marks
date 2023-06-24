part of '../answer_component.dart';

class AnswerButtonBar extends StatefulWidget with Grabful {
  const AnswerButtonBar({
    super.key,
    required this.answers,
    this.selectedIndex,
  });

  final List<AnswerModel> answers;
  final SelectedIndex? selectedIndex;

  @override
  State<AnswerButtonBar> createState() => _AnswerButtonBarState();
}

typedef AnswerState = ValueNotifier<int?>;

class _AnswerButtonBarState extends State<AnswerButtonBar> {
  final answerState = AnswerState(null);

  void answerPressed(bool selectValueReset) {
    if (answerState.value != null) {
      final value = answerState.value!.toInt();
      widget.selectedIndex?.call({widget.answers[value]});
      if (selectValueReset) {
        answerState.value = null;
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    final grabValue = answerState.grab(context);
    return Column(
      mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        ButtonStateText(
          "Single",
          color: Theme.of(context).colorScheme.secondaryContainer,
          textColor: Theme.of(context).colorScheme.onSecondaryContainer,
        ),
        Wrap(
          alignment: WrapAlignment.start,
          spacing: 8,
          runSpacing: 4,
          children: [
            for (int i = 0; i < widget.answers.length; i++)
              ChoiceChip(
                label: Text(widget.answers[i].answer),
                selected: i == answerState.grab(context),
                onSelected: (selected) {
                  answerState.value = selected ? i : null;
                },
              ),
          ],
        ),
        const SizedBox(
          height: 8,
        ),
        Tooltip(
          message:
              (grabValue is int) ? "" : context.appL10n.canNotAnswerTooltips,
          child: Consumer(
            builder: (ctx, ref, child) => FilledButton(
              onPressed: (grabValue is int)
                  ? () => answerPressed(ref.read(settingsNotifierProvider
                      .select((value) => value.clearSelect)))
                  : null,
              child: child,
            ),
            child: Text(
              (grabValue is int)
                  ? context.appL10n.answer
                  : context.appL10n.canNotAnswer,
            ),
          ),
        )
      ],
    );
  }
}
