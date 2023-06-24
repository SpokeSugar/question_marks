import 'package:dynamic_color/dynamic_color.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

final lightSchemeProvider = Provider((ref) {
  return QuestionMarksScheme.light;
});

final darkSchemeProvider = Provider((ref) {
  return QuestionMarksScheme.dark;
});

class QuestionMarksScheme {
  static final light = ColorScheme.fromSeed(seedColor: Colors.lightGreenAccent);
  static final dark = ColorScheme.fromSeed(
      seedColor: Colors.lightGreenAccent.shade400, brightness: Brightness.dark);
}

class ThemeInjectScope extends StatelessWidget {
  const ThemeInjectScope({Key? key, required this.child}) : super(key: key);
  final Widget child;

  @override
  Widget build(BuildContext context) {
    return DynamicColorBuilder(builder: (light, dark) {
      return ProviderScope(
        overrides: [
          lightSchemeProvider
              .overrideWithValue(light ?? QuestionMarksScheme.light),
          darkSchemeProvider.overrideWithValue(dark ?? QuestionMarksScheme.dark)
        ],
        child: child,
      );
    });
  }
}
