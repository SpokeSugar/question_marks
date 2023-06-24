import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../state/home_index.dart';

class BackHomeButton extends ConsumerWidget {
  const BackHomeButton({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return BackButton(
      onPressed: () =>
          ref.read(homeBottomBarIndexProvider.notifier).update((state) => 0),
    );
  }
}
