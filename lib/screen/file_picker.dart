import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:question_marks/state/file_loading_state/file_loading_state_notifier.dart';
import 'package:restartable/restartable.dart';

import '../component/back_home_button.dart';
import '../component/title_text_field.dart';
import '../model/file_loading_model/file_loading_model.dart';

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
            const _FileSelector(),
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
          const SelectedFileButton(),
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
      leading: const BackHomeButton(),
      actions: [
        PopupMenuButton(
            itemBuilder: (context) => [
                  PopupMenuItem(
                    child: const Text("Open Temp file"),
                    onTap: () => FileLoadingSession.launchTempFile(),
                  ),
                  PopupMenuItem(
                    child: const Text("Open document file"),
                    onTap: () => FileLoadingSession.launchAppDocument(),
                  ),
                  PopupMenuItem(
                    child: const Text("Reset App"),
                    onTap: () => RestartWidget.reset(context),
                  )
                ])
      ],
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

class SelectedFileButton extends ConsumerWidget {
  const SelectedFileButton({super.key});

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

class _FileSelector extends ConsumerWidget {
  const _FileSelector();

  @override
  Widget build(BuildContext context, ref) {
    return SliverFillRemaining(
      child: Center(
        child: FilledButton.tonal(
          onPressed: () async =>
              ref.watch(fileLoadingSessionProvider.notifier).open(),
          child: const Text("File pick"),
        ),
      ),
    );
  }
}
