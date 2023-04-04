import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../router/router.dart';
import '../state/file_loading_state/file_loading_state_notifier.dart';

final filePickerTitleProvider = ChangeNotifierProvider.autoDispose((ref) {
  return TextEditingController();
});

class TitleTextFieldColumn extends ConsumerStatefulWidget {
  const TitleTextFieldColumn({Key? key}) : super(key: key);

  @override
  ConsumerState<ConsumerStatefulWidget> createState() =>
      _TitleTextFieldColumnState();
}

class _TitleTextFieldColumnState extends ConsumerState<TitleTextFieldColumn> {
  @override
  Widget build(BuildContext context) {
    final isEmpty =
        ref.watch(filePickerTitleProvider.select((value) => value.text == ''));
    final isQuestionsNull = ref.watch(
        fileLoadingSessionProvider.select((value) => value.questions == null));
    return ListTile(
      title: TextField(
        controller: ref.watch(filePickerTitleProvider),
        decoration: const InputDecoration(
            border: OutlineInputBorder(), labelText: 'Title Name'),
      ),
      trailing: FilledButton(
          onPressed: (!isEmpty && !isQuestionsNull)
              ? () async {
                  ref.read(fileLoadingSessionProvider.notifier).saveFile(
                      ref.read(filePickerTitleProvider
                          .select((value) => value.text)), isSuccess: () {
                    if (mounted) {
                      const HomeRoute().go(context);
                    }
                  });
                }
              : null,
          child: const Text("convert")),
    );
  }
}
