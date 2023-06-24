// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'router.dart';

// **************************************************************************
// GoRouterGenerator
// **************************************************************************

List<GoRoute> get $appRoutes => [
      $answerPageRoute,
      $filePickerRoute,
      $homeRoute,
      $licenseRoute,
      $questionPageRoute,
      $resultRoute,
    ];

GoRoute get $answerPageRoute => GoRouteData.$route(
      path: '/answer_page/:sessionId/:resultIndex',
      factory: $AnswerPageRouteExtension._fromState,
    );

extension $AnswerPageRouteExtension on AnswerPageRoute {
  static AnswerPageRoute _fromState(GoRouterState state) => AnswerPageRoute(
        sessionId: state.pathParameters['sessionId']!,
        resultIndex: int.parse(state.pathParameters['resultIndex']!),
        questionListId: state.queryParameters['question-list-id'],
        onAgain:
            _$convertMapValue('on-again', state.queryParameters, _$boolConverter) ??
                false,
        showOnly: _$convertMapValue(
                'show-only', state.queryParameters, _$boolConverter) ??
            true,
      );

  String get location => GoRouteData.$location(
        '/answer_page/${Uri.encodeComponent(sessionId)}/${Uri.encodeComponent(resultIndex.toString())}',
        queryParams: {
          if (questionListId != null) 'question-list-id': questionListId,
          if (onAgain != false) 'on-again': onAgain.toString(),
          if (showOnly != true) 'show-only': showOnly.toString(),
        },
      );

  void go(BuildContext context) => context.go(location);

  void push(BuildContext context) => context.push(location);

  void pushReplacement(BuildContext context) =>
      context.pushReplacement(location);
}

T? _$convertMapValue<T>(
  String key,
  Map<String, String> map,
  T Function(String) converter,
) {
  final value = map[key];
  return value == null ? null : converter(value);
}

bool _$boolConverter(String value) {
  switch (value) {
    case 'true':
      return true;
    case 'false':
      return false;
    default:
      throw UnsupportedError('Cannot convert "$value" into a bool.');
  }
}

GoRoute get $filePickerRoute => GoRouteData.$route(
      path: '/load_files',
      factory: $FilePickerRouteExtension._fromState,
    );

extension $FilePickerRouteExtension on FilePickerRoute {
  static FilePickerRoute _fromState(GoRouterState state) =>
      const FilePickerRoute();

  String get location => GoRouteData.$location(
        '/load_files',
      );

  void go(BuildContext context) => context.go(location);

  void push(BuildContext context) => context.push(location);

  void pushReplacement(BuildContext context) =>
      context.pushReplacement(location);
}

GoRoute get $homeRoute => GoRouteData.$route(
      path: '/',
      factory: $HomeRouteExtension._fromState,
    );

extension $HomeRouteExtension on HomeRoute {
  static HomeRoute _fromState(GoRouterState state) => const HomeRoute();

  String get location => GoRouteData.$location(
        '/',
      );

  void go(BuildContext context) => context.go(location);

  void push(BuildContext context) => context.push(location);

  void pushReplacement(BuildContext context) =>
      context.pushReplacement(location);
}

GoRoute get $licenseRoute => GoRouteData.$route(
      path: '/licenses',
      factory: $LicenseRouteExtension._fromState,
    );

extension $LicenseRouteExtension on LicenseRoute {
  static LicenseRoute _fromState(GoRouterState state) => LicenseRoute();

  String get location => GoRouteData.$location(
        '/licenses',
      );

  void go(BuildContext context) => context.go(location);

  void push(BuildContext context) => context.push(location);

  void pushReplacement(BuildContext context) =>
      context.pushReplacement(location);
}

GoRoute get $questionPageRoute => GoRouteData.$route(
      path: '/question/:questionListId/:sessionID/:index',
      factory: $QuestionPageRouteExtension._fromState,
    );

extension $QuestionPageRouteExtension on QuestionPageRoute {
  static QuestionPageRoute _fromState(GoRouterState state) => QuestionPageRoute(
        state.pathParameters['questionListId']!,
        sessionID: state.pathParameters['sessionID']!,
        index: _$convertMapValue('index', state.queryParameters, int.parse) ?? 0,
      );

  String get location => GoRouteData.$location(
        '/question/${Uri.encodeComponent(questionListId)}/${Uri.encodeComponent(sessionID)}/${Uri.encodeComponent(index.toString())}',
        queryParams: {
          if (index != 0) 'index': index.toString(),
        },
      );

  void go(BuildContext context) => context.go(location);

  void push(BuildContext context) => context.push(location);

  void pushReplacement(BuildContext context) =>
      context.pushReplacement(location);
}

GoRoute get $resultRoute => GoRouteData.$route(
      path: '/result/:sessionID',
      factory: $ResultRouteExtension._fromState,
    );

extension $ResultRouteExtension on ResultRoute {
  static ResultRoute _fromState(GoRouterState state) => ResultRoute(
        state.pathParameters['sessionID']!,
      );

  String get location => GoRouteData.$location(
        '/result/${Uri.encodeComponent(sessionID)}',
      );

  void go(BuildContext context) => context.go(location);

  void push(BuildContext context) => context.push(location);

  void pushReplacement(BuildContext context) =>
      context.pushReplacement(location);
}
