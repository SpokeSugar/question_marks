import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:question_marks/state/file_loading_state/file_loading_state_notifier.dart';

import '../model/file_loading_model/file_loading_model.dart';

class FilePickerScreen extends ConsumerWidget {
  const FilePickerScreen({super.key});

  final fileType = LoadType.undifined;

  @override
  Widget build(BuildContext context, ref) {
    return Scaffold(
      body: CustomScrollView(
        slivers: [
          const SliverAppBar(
            title: Text("File Picker"),
          ),
          SliverList(
            delegate: SliverChildListDelegate([
              const TitleTextFieldColumn(),
              if (ref.watch(fileLoadingSessionProvider.select((value) =>
                  (value.fileErrorText != null || value.files != null))))
                const SelectedFileText(),
              if (ref.watch(fileLoadingSessionProvider
                  .select((value) => (value.questions != null))))
                const ImageFileText(),
              TextButton(
                  onPressed: () async => FileLoadingSession.launchTempFile(),
                  child: const Text("launch temp file")),
              TextButton(
                  onPressed: () async => FileLoadingSession.launchAppDocument(),
                  child: const Text("launch_app_docs"))
            ]),
          ),
          if (ref.watch(fileLoadingSessionProvider
              .select((value) => (value.questions == null))))
            const FileSelector(),
        ],
      ),
    );
  }
}

class TitleTextFieldColumn extends ConsumerStatefulWidget {
  const TitleTextFieldColumn({Key? key}) : super(key: key);

  @override
  ConsumerState<TitleTextFieldColumn> createState() =>
      _TitleTextFieldColumnState();
}

class _TitleTextFieldColumnState extends ConsumerState<TitleTextFieldColumn> {
  late final TextEditingController _controller;

  @override
  void initState() {
    super.initState();
    _controller = TextEditingController();
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return ListTile(
      title: TextField(
        controller: _controller,
        decoration: const InputDecoration(
            border: OutlineInputBorder(), labelText: 'Title Name'),
      ),
      trailing: TextButton(
          onPressed: () async {
            if (_controller.text != '') {
              ref
                  .watch(fileLoadingSessionProvider.notifier)
                  .saveFile(_controller.text);
            }
          },
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
        child: const Text("Select Directory"),
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
