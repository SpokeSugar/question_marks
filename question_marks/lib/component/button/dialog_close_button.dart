import 'package:flutter/material.dart';

import '../../router/router.dart';

class DialogCloseButton extends StatelessWidget {
  const DialogCloseButton({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return TextButton(
      onPressed: () => const HomeRoute().go(context),
      child: Text(MaterialLocalizations.of(context).backButtonTooltip),
    );
  }
}
