part of '../router.dart';

@TypedGoRoute<QuestionPageRoute>(
    path: "/question/:questionListId/:sessionID/:index")
class QuestionPageRoute extends GoRouteData {
  const QuestionPageRoute(
    this.questionListId, {
    this.index = 0,
    required this.sessionID,
  });

  final String questionListId;
  final int index;
  final String sessionID;

  @override
  Widget build(BuildContext context, state) => Consumer(
        builder: (ctx, ref, _) => ref.watch(questionManagerProvider
                .call(questionListId)
                .select((value) => value.value == null))
            ? const ErrorPage()
            : QuestionPage(
                ref.watch(
                  questionManagerProvider.call(questionListId).select(
                        (value) => value.value![index],
                      ),
                ),
                selectedIndex: (set) {
                  ref
                      .watch(questionSessionsProvider.call(sessionID).notifier)
                      .addSessions(questionListId, index, set, sessionID);
                  AnswerPageRoute(
                          questionListId: questionListId,
                          sessionId: sessionID,
                          onAgain: true,
                          showOnly: false,
                          resultIndex: ref.read(questionSessionsProvider
                              .call(sessionID)
                              .select((value) => (value.answers.length - 1))))
                      .push(context);
                },
                collectValue:
                    (ref.watch(settingsNotifierProvider).showCollectNum
                        ? ref.watch(
                            questionManagerProvider.call(questionListId).select(
                                  (value) =>
                                      value.value?[index].toCollectSet().length,
                                ),
                          )
                        : null),
              ),
      );
}
