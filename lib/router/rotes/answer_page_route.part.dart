part of '../router.dart';

@TypedGoRoute<AnswerPageRoute>(path: "/answer_page/:sessionId/:resultIndex")
class AnswerPageRoute extends GoRouteData {
  const AnswerPageRoute({
    required this.sessionId,
    required this.resultIndex,
    this.questionListId,
    this.onAgain = false,
    this.showOnly = true,
  });
  final String sessionId;
  final String? questionListId;
  final int resultIndex;
  final bool onAgain;
  final bool showOnly;

  @override
  Widget build(context, state) => Consumer(
        builder: (ctx, ref, _) {
          final answer = ref
              .watch(questionSessionsProvider.call(sessionId).select((value) {
            return value.answers[resultIndex];
          }));
          final question = ref.watch(questionSessionsProvider
              .call(sessionId)
              .select((value) => value.getAnswerID(answer)));

          if (question != null) {
            return AnswerPage(
              collectSet: question.toCollectSet(),
              canBack:
                  !setEquals(question.toCollectIDSet(), answer.collectAnswer),
              select:
                  question.getFromAnswerIDIterable(answer.selectAnswer).toSet(),
              onNextTap: (questionListId != null && !showOnly)
                  ? () {
                      final length = ref
                              .watch(
                                  questionManagerProvider.call(questionListId!))
                              .value
                              ?.length ??
                          0;

                      if (ref
                              .watch(questionSessionsProvider.call(sessionId))
                              .index >=
                          (length - 1)) {
                        ResultRoute(sessionId).go(context);
                      } else {
                        ref
                            .watch(questionSessionsProvider
                                .call(sessionId)
                                .notifier)
                            .incrementIndex();
                        QuestionPageRoute(questionListId!,
                                index: ref
                                    .watch(questionSessionsProvider
                                        .call(sessionId))
                                    .index,
                                sessionID: sessionId)
                            .go(context);
                      }
                    }
                  : null,
              onAgainTap: (onAgain) ? () => context.pop() : null,
            );
          }
          return const ErrorPage();
        },
      );
}
