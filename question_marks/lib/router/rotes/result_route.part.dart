part of '../router.dart';

@TypedGoRoute<ResultRoute>(path: '/result/:sessionID')
class ResultRoute extends GoRouteData {
  const ResultRoute(this.sessionID);

  final String sessionID;

  @override
  Widget build(context, state) => Consumer(
        builder: (ctx, ref, _) => ResultPage(
          ref.watch(
            questionSessionsProvider.call(sessionID),
          ),
        ),
      );
}
