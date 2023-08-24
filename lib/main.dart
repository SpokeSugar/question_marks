import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:question_marks/question_marks_application.dart';
import 'package:question_marks/state/color_scheme_inject.dart';
import 'package:restartable/restartable.dart';
import 'package:window_size/window_size.dart';

import 'logger.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  try {
    if (Platform.isWindows || Platform.isMacOS || Platform.isLinux) {
      setWindowMinSize(const Size(300, 300));
    }
  } catch (e) {
    logger.e(e, stackTrace: StackTrace.current);
  }

  runApp(const RestartWidget(
    ProviderScope(child: ThemeInjectScope(child: QuestionMarksApplication())),
  ));
}
