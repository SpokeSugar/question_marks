import 'package:flutter/material.dart';

class HomeMenu extends StatelessWidget {
  const HomeMenu({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return PopupMenuButton(
      itemBuilder: (ctx) => <PopupMenuEntry>[
        PopupMenuItem(
          child: Text(MaterialLocalizations.of(context).licensesPageTitle),
          onTap: () async => Future.delayed(
            const Duration(seconds: 0),
            () => showAboutDialog(context: context),
          ),
        ),
        PopupMenuItem(
          child: const Text("Preferences"),
          onTap: () async => Future.delayed(
            const Duration(seconds: 0),
            () => showAboutDialog(context: context),
          ),
        ),
      ],
    );
  }
}
