import 'package:dynamic_color/dynamic_color.dart';
import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:question_marks/router/router.dart';
import 'package:question_marks/state/question_id_list/question_id_list.dart';
import 'package:question_marks/state/session_list/session_list.dart';

final _router = GoRouter(routes: $appRoutes);

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

class MyHomePage extends ConsumerWidget {
  const MyHomePage({super.key, required this.title});

  final String title;

  @override
  Widget build(BuildContext context, ref) {
    final length =
        ref.watch(questionIDListStateProvider.select((value) => value.length));
    return Scaffold(
      body: CustomScrollView(
        slivers: [
          SliverAppBar(
            // Here we take the value from the MyHomePage object that was created by
            // the App.build method, and use it to set our appbar title.
            title: Text(title),
            actions: const [
              HomeMenu(),
            ],
          ),
          if (length >= 1)
            SliverList(
              delegate: SliverChildBuilderDelegate(
                  (_, index) => ListTile(
                        title: Text(
                          ref.watch(
                            questionIDListStateProvider.select(
                              (value) => value[index].title,
                            ),
                          ),
                        ),
                        onTap: () => QuestionPageRoute(
                          ref.read(
                            questionIDListStateProvider.select(
                              (value) => value[index].id,
                            ),
                          ),
                          sessionID: ref.read(sessionListProvider.notifier
                              .select((value) => value.getUniqueID())),
                        ).push(context),
                        trailing: PopupMenuButton(
                            itemBuilder: (BuildContext context) => [
                                  PopupMenuItem(
                                    child: Text(
                                        MaterialLocalizations.of(context)
                                            .deleteButtonTooltip),
                                    onTap: () => ref
                                        .read(questionIDListStateProvider
                                            .notifier)
                                        .removeID(index),
                                  )
                                ]),
                      ),
                  childCount: length),
            ),
          if (length == 0)
            const SliverFillRemaining(
              child: Center(child: Text("List is Empty")),
            )
        ],
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () => const FilePickerRoute().push(context),
        child: const Icon(Icons.add),
      ),
    );
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
