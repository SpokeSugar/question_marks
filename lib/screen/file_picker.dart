import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:question_marks/router/router.dart';
import 'package:question_marks/state/file_loading_state/file_loading_state_notifier.dart';

import '../model/file_loading_model/file_loading_model.dart';

final filePickerTitleProvider =
    StateProvider.autoDispose((ref) => TextEditingController());

final filePickerTitleValueProvider = StateProvider.autoDispose(
    (ref) => ref.watch(filePickerTitleProvider).value);

class FilePickerScreen extends ConsumerWidget {
  const FilePickerScreen({super.key});

  final fileType = LoadType.undifined;

  @override
  Widget build(BuildContext context, ref) {
    return Scaffold(
      body: CustomScrollView(
        slivers: [
          const _FilePickerAppBar(),
          const _FilePickerBody(),
          if (ref.watch(fileLoadingSessionProvider
              .select((value) => (value.questions == null))))
            const FileSelector(),
        ],
      ),
    );
  }
}

class _FilePickerBody extends ConsumerWidget {
  const _FilePickerBody();

  @override
  Widget build(BuildContext context, ref) {
    return SliverList(
      delegate: SliverChildListDelegate([
        const TitleTextFieldColumn(),
        if (ref.watch(fileLoadingSessionProvider.select(
            (value) => (value.fileErrorText != null || value.files != null))))
          const SelectedFileText(),
        if (ref.watch(fileLoadingSessionProvider
            .select((value) => (value.questions != null))))
          const ImageFileText(),
      ]),
    );
  }
}

class _FilePickerAppBar extends StatelessWidget {
  const _FilePickerAppBar();

  @override
  Widget build(BuildContext context) {
    return SliverAppBar(
      title: const Text("File Picker"),
      actions: [
        PopupMenuButton(
            itemBuilder: (context) => [
                  PopupMenuItem(
                    child: Text("Open Temp file"),
                    onTap: () => FileLoadingSession.launchTempFile(),
                  ),
                  PopupMenuItem(
                    child: Text("Open document file"),
                    onTap: () => FileLoadingSession.launchAppDocument(),
                  )
                ])
      ],
    );
  }
}

class TitleTextFieldColumn extends ConsumerStatefulWidget {
  const TitleTextFieldColumn({Key? key}) : super(key: key);

  @override
  ConsumerState<ConsumerStatefulWidget> createState() =>
      _TitleTextFieldColumnState();
}

class _TitleTextFieldColumnState extends ConsumerState<TitleTextFieldColumn> {
  @override
  Widget build(BuildContext context) {
    final isEmpty = ref.watch(
        filePickerTitleValueProvider.select((value) => value.text == ''));
    final isQuestionsNull = ref.watch(
        fileLoadingSessionProvider.select((value) => value.questions == null));
    return ListTile(
      title: TextField(
        controller: ref.watch(filePickerTitleProvider),
        decoration: const InputDecoration(
            border: OutlineInputBorder(), labelText: 'Title Name'),
        onChanged: (value) {
          ref.read(filePickerTitleValueProvider.notifier).state =
              ref.read(filePickerTitleProvider).value;
        },
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

class ImageFileText extends ConsumerWidget {
  const ImageFileText({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return ListTile(
      trailing: FilledButton.tonal(
        onPressed: () =>
            ref.read(fileLoadingSessionProvider.notifier).openImageDirectory(),
        child: const Text("Import Directory"),
      ),
      title: const Text(
        "Image File Path",
      ),
      subtitle: Text(
        ref.watch(
          fileLoadingSessionProvider.select((value) => value.imageMessage),
        ),
        // maxLines: 1,
        // overflow: TextOverflow.ellipsis,
      ),
    );
  }
}

class SelectedFileText extends ConsumerWidget {
  const SelectedFileText({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return ListTile(
      trailing: FilledButton.tonal(
        onPressed: () {
          ref.read(fileLoadingSessionProvider.notifier).open();
        },
        child: const Text("Select File"),
      ),
      title: const Text('Select Question'),
      subtitle: Text(
        ref.watch(
          fileLoadingSessionProvider.select((value) => value.fileMessage),
        ),
        overflow: TextOverflow.ellipsis,
        maxLines: 1,
      ),
    );
  }
}

class FileSelector extends ConsumerWidget {
  const FileSelector({
    super.key,
  });

  @override
  Widget build(BuildContext context, ref) {
    return SliverFillRemaining(
      child: Center(
        child: FilledButton.tonal(
          onPressed: () async {
            ref.watch(fileLoadingSessionProvider.notifier).open();
          },
          child: const Text("File pick"),
        ),
      ),
    );
  }
}
