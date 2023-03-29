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
        builder: (ctx, ref, _) => QuestionPage(
          ref.watch(
            questionManagerProvider.call(questionListId).select(
                  (value) => value[index],
                ),
          ),
          selectedIndex: (set) {
            final getQuestion = ref.read(
              questionManagerProvider.call(questionListId).select(
                    (value) => value[index],
                  ),
            );

            ref
                .read(questionSessionsProvider.call(sessionID).notifier)
                .addQuestionSet(getQuestion);
            final getResultID = ref
                .read(questionSessionsProvider.call(sessionID).notifier)
                .getNewAnswerResultID();
            ref
                .read(questionSessionsProvider.call(sessionID).notifier)
                .addAnswerList(AnswerResultModel(
                  sessionID: sessionID,
                  questionID: getQuestion.uuid,
                  questionHash: getQuestion.hashCode,
                  resultID: getResultID,
                  answers: getQuestion.toIDList(),
                  collectAnswer: getQuestion.toCollectIDSet(),
                  selectAnswer: set
                      .map((e) => AnswerID(uuid: e.uuid, hash: e.hashCode))
                      .toSet(),
                  dateTime: DateTime.now(),
                ));

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
          collectValue: (ref.watch(settingsNotifierProvider).showCollectNum
              ? ref.watch(questionManagerProvider
                  .call(questionListId)
                  .select((value) => value[index].toCollectSet().length))
              : null),
        ),
      );
}
