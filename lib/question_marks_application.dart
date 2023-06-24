import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:question_marks/mixin/localization_mixin.dart';
import 'package:question_marks/router/router.dart';
import 'package:question_marks/screen/error_page.dart';
import 'package:question_marks/state/color_scheme_inject.dart';
import 'package:question_marks/state/question_id_list/question_id_list.dart';
import 'package:question_marks/state/session_list/session_list.dart';

import 'component/home_menu.dart';

final _router = GoRouter(
    errorBuilder: (context, state) => ErrorPage(e: state.error),
    routes: [...$appRoutes]);

class QuestionMarksApplication extends ConsumerWidget {
  const QuestionMarksApplication({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context, ref) {
    return MaterialApp.router(
      title: 'Flutter Demo',
      theme: ThemeData.from(
              colorScheme: ref.watch(lightSchemeProvider), useMaterial3: true)
          .copyWith(
              inputDecorationTheme: Theme.of(context)
                  .inputDecorationTheme
                  .copyWith(border: const OutlineInputBorder())),
      darkTheme: ThemeData.from(
              colorScheme: ref.watch(darkSchemeProvider), useMaterial3: true)
          .copyWith(
              inputDecorationTheme: Theme.of(context)
                  .inputDecorationTheme
                  .copyWith(border: const OutlineInputBorder())),
      localizationsDelegates: AppLocalizations.localizationsDelegates,
      supportedLocales: AppLocalizations.supportedLocales,
      routerConfig: _router,
    );
  }
}

class HomeQuestionList extends ConsumerWidget {
  const HomeQuestionList({
    super.key,
  });

  @override
  Widget build(BuildContext context, ref) {
    final length =
        ref.watch(questionIDListStateProvider.select((value) => value.value));
    return CustomScrollView(
      slivers: [
        SliverAppBar(
          // Here we take the value from the MyHomePage object that was created by
          // the App.build method, and use it to set our appbar title.
          title: Text(context.appL10n.helloWorld),
          actions: const [
            HomeMenu(),
          ],
        ),
        if ((length?.length ?? 0) >= 1)
          SliverList(
            delegate: SliverChildBuilderDelegate(
                (_, index) => ListTile(
                      title: Text(
                        ref.watch(
                          questionIDListStateProvider.select(
                            (value) =>
                                value.value?[index].title ?? "Error Title",
                          ),
                        ),
                      ),
                      onTap: () => QuestionPageRoute(
                        ref.read(
                          questionIDListStateProvider.select(
                            (value) => value.value![index].id,
                          ),
                        ),
                        sessionID: ref.read(sessionListProvider.notifier
                            .select((value) => value.getUniqueID())),
                      ).push(context),
                      trailing: PopupMenuButton(
                          itemBuilder: (BuildContext context) => [
                                PopupMenuItem(
                                  child: Text(MaterialLocalizations.of(context)
                                      .deleteButtonTooltip),
                                  onTap: () => ref
                                      .read(
                                          questionIDListStateProvider.notifier)
                                      .removeID(index),
                                )
                              ]),
                    ),
                childCount: length?.length ?? 0),
          ),
        if (ref.watch(questionIDListStateProvider
                .select((value) => value.isLoading)) ||
            ref.watch(questionIDListStateProvider
                .select((value) => value.isReloading)) ||
            ref.watch(questionIDListStateProvider
                .select((value) => value.isRefreshing)))
          const SliverFillRemaining(
            child: CircularProgressIndicator(),
          ),
        if ((length?.length ?? 0) == 0)
          const SliverFillRemaining(
            child: Center(child: Text("List is Empty")),
          )
      ],
    );
  }
}
