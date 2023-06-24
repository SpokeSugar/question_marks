import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:question_marks/router/router.dart';
import 'package:question_marks/state/file_loading_state/file_loading_state_notifier.dart';
import 'package:question_marks/state/question_id_list/question_id_list.dart';

class WebEntry extends StatelessWidget {
  const WebEntry({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Web Entry"),
      ),
      body: const Center(
        child: WebOpenFileButton(),
      ),
    );
  }
}

class WebOpenFileButton extends ConsumerStatefulWidget {
  const WebOpenFileButton({
    super.key,
  });

  @override
  ConsumerState<WebOpenFileButton> createState() => _WebOpenFileButtonState();
}

class _WebOpenFileButtonState extends ConsumerState<WebOpenFileButton> {
  @override
  Widget build(BuildContext context) {
    return FilledButton(
      onPressed: () async {
        final id =
            await ref.read(fileLoadingSessionProvider.notifier).openForWeb();
        if (id != null && mounted) {
          QuestionPageRoute(id,
                  sessionID: ref
                      .read(questionIDListStateProvider.notifier)
                      .getUniqueID())
              .push(context);
        }
      },
      child: const Text("File Select"),
    );
  }
}
