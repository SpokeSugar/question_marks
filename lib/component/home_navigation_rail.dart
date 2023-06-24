import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../state/home_index.dart';

class HomeNavigationRail extends ConsumerWidget {
  const HomeNavigationRail({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return NavigationRail(
      elevation: 1,
      backgroundColor: ElevationOverlay.applySurfaceTint(
          Theme.of(context).colorScheme.surface,
          Theme.of(context).colorScheme.surfaceTint,
          1),
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
      onDestinationSelected: (value) => ref
          .read(homeBottomBarIndexProvider.notifier)
          .update((state) => value),
    );
  }
}

class HomeNavigationBar extends ConsumerWidget {
  const HomeNavigationBar({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, ref) {
    return NavigationBar(
        selectedIndex: ref.watch(homeBottomBarIndexProvider),
        onDestinationSelected: (value) => ref
            .read(homeBottomBarIndexProvider.notifier)
            .update((state) => value),
        destinations: const [
          NavigationDestination(
              icon: Icon(Icons.list_outlined), label: "Questions"),
          NavigationDestination(icon: Icon(Icons.add_outlined), label: "Add"),
          NavigationDestination(
              icon: Icon(Icons.folder_open_outlined), label: "Open"),
        ]);
  }
}
