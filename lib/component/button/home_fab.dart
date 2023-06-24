import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../state/home_index.dart';

class HomeFAB extends ConsumerWidget {
  const HomeFAB({
    super.key,
  });

  @override
  Widget build(BuildContext context, ref) {
    return FloatingActionButton(
      onPressed: () =>
          ref.read(homeBottomBarIndexProvider.notifier).update((state) => 1),
      child: const Icon(Icons.add),
    );
  }
}
