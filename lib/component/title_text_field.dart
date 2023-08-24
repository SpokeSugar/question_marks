import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../router/router.dart';
import '../state/file_loading_state/file_loading_state_notifier.dart';

final filePickerTitleProvider = ChangeNotifierProvider.autoDispose((ref) {
  return TextEditingController();
});

class TitleTextFieldColumn extends ConsumerWidget {
  const TitleTextFieldColumn({super.key});

  @override
  Widget build(BuildContext context, ref) {
    final isEmpty =
        ref.watch(filePickerTitleProvider.select((value) => value.text == ''));
    final isQuestionsNull = ref.watch(
        fileLoadingSessionProvider.select((value) => value.questions == null));

    return ListTile(
      title: TextField(
        controller: ref.watch(filePickerTitleProvider),
        decoration: const InputDecoration(labelText: 'Title Name'),
      ),
      trailing: FilledButton(
          onPressed: (!isEmpty && !isQuestionsNull)
              ? () {
                  ref
                      .read(fileLoadingSessionProvider.notifier)
                      .saveFile(ref.read(filePickerTitleProvider
                          .select((value) => value.text)))
                      .then((value) => const HomeRoute().go(context));
                }
              : null,
          child: const Text("Convert")),
    );
  }
}
