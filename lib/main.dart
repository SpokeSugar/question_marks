import 'package:adaptive_breakpoints/adaptive_breakpoints.dart';
import 'package:dynamic_color/dynamic_color.dart';
import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:question_marks/mixin/localization_mixin.dart';
import 'package:question_marks/router/router.dart';
import 'package:question_marks/screen/create_questions_screen.dart';
import 'package:question_marks/screen/file_picker.dart';
import 'package:question_marks/state/home_index.dart';
import 'package:question_marks/state/question_id_list/question_id_list.dart';
import 'package:question_marks/state/session_list/session_list.dart';

final _router = GoRouter(routes: [...$appRoutes]);

void main() {
  runApp(const ProviderScope(child: MyApp()));
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return DynamicColorBuilder(builder: (light, dark) {
      return MaterialApp.router(
        title: 'Flutter Demo',
        themeMode: ThemeMode.dark,
        theme: ThemeData.from(
            colorScheme:
                // light ??
                ColorScheme.fromSeed(seedColor: Colors.lightGreenAccent),
            useMaterial3: true),
        darkTheme: ThemeData.from(
            colorScheme:
                // dark ??
                ColorScheme.fromSeed(
                    seedColor: Colors.lightGreenAccent,
                    brightness: Brightness.dark),
            useMaterial3: true),
        localizationsDelegates: AppLocalizations.localizationsDelegates,
        supportedLocales: AppLocalizations.supportedLocales,
        routerConfig: _router,
      );
    });
  }
}

class _HomeBody extends ConsumerWidget {
  const _HomeBody({
    Key? key,
  }) : super(key: key);

  static const List<Widget> lists = [
    HomeQuestionList(key: PageStorageKey(0)),
    CreateQuesionsScreen(
      key: PageStorageKey(1),
    ),
    FilePickerScreen(
      key: PageStorageKey(2),
    )
  ];

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    if (lists.length > ref.watch(homeBottomBarIndexProvider)) {
      return lists[ref.watch(homeBottomBarIndexProvider)];
    }

    return const Center(
      child: Text("List is Empty"),
    );
  }
}

class MyHomePage extends ConsumerWidget {
  const MyHomePage({
    super.key,
  });

  @override
  Widget build(BuildContext context, ref) {
    final entry = getBreakpointEntry(context).adaptiveWindowType >=
        AdaptiveWindowType.small;
    return Scaffold(
      body: Row(children: [
        if (ref.watch(
            homeBottomBarIndexProvider.select((value) => entry && value == 0)))
          const HomeNavigationRail(),
        const Expanded(child: _HomeBody())
      ]),
      bottomNavigationBar: ref.watch(
              homeBottomBarIndexProvider.select((value) => entry || value != 0))
          ? null
          : const HomeNavigationBar(),
    );
  }
}

class HomeFAB extends ConsumerWidget {
  const HomeFAB({
    super.key,
  });

  @override
  Widget build(BuildContext context, ref) {
    return FloatingActionButton(
      onPressed: () => ref.read(homeBottomBarIndexProvider.notifier).state = 1,
      child: const Icon(Icons.add),
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

class HomeNavigationRail extends ConsumerWidget {
  const HomeNavigationRail({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return NavigationRail(
      destinations: const [
        NavigationRailDestination(
            icon: Icon(Icons.list_outlined), label: Text("Questions")),
        NavigationRailDestination(
            icon: Icon(Icons.add_outlined), label: Text("Add")),
        NavigationRailDestination(
            icon: Icon(Icons.folder_open_outlined), label: Text("Open")),
      ],
      groupAlignment: 0,
      selectedIndex: ref.watch(homeBottomBarIndexProvider),
      labelType: NavigationRailLabelType.all,
      onDestinationSelected: (value) =>
          ref.read(homeBottomBarIndexProvider.notifier).state = value,
    );
  }
}

class HomeNavigationBar extends ConsumerWidget {
  const HomeNavigationBar({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, ref) {
    return NavigationBar(
        selectedIndex: ref.watch(homeBottomBarIndexProvider),
        onDestinationSelected: (value) =>
            ref.read(homeBottomBarIndexProvider.notifier).state = value,
        destinations: const [
          NavigationDestination(
              icon: Icon(Icons.list_outlined), label: "Questions"),
          NavigationDestination(icon: Icon(Icons.add_outlined), label: "Add"),
          NavigationDestination(
              icon: Icon(Icons.folder_open_outlined), label: "Open"),
        ]);
  }
}

class HomeMenu extends StatelessWidget {
  const HomeMenu({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return PopupMenuButton(
      itemBuilder: (ctx) => <PopupMenuEntry>[
        PopupMenuItem(
          child: const Text("Licenses"),
          onTap: () => Future.delayed(
            const Duration(seconds: 0),
            () => showAboutDialog(context: context),
          ),
        )
      ],
    );
  }
}
