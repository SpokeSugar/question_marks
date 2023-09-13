import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:question_marks/database/abstract/question_io.dart';
import 'package:question_marks/database/abstract/question_list_io.dart';
import 'package:question_marks/database/json/json_question_io.dart';
import 'package:question_marks/database/json/json_question_list_io.dart';
import 'package:question_marks/question_marks_application.dart';
import 'package:question_marks/state/color_scheme_inject.dart';
import 'package:restartable/restartable.dart';
import 'package:sqflite_common_ffi/sqflite_ffi.dart';
import 'package:window_size/window_size.dart';

import 'logger.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();

  sqfliteFfiInit();

  try {
    if (Platform.isWindows || Platform.isMacOS || Platform.isLinux) {
      setWindowMinSize(const Size(300, 300));
    }
  } catch (e) {
    logger.e(e, stackTrace: StackTrace.current);
  }

  runApp(RestartWidget(
    ProviderScope(
      child: ThemeInjectScope(child: QuestionMarksApplication()),
      overrides: [
        questionListIOProvider
            .overrideWith((ref) => const JsonQuestionListIO()),
        questionIOProvider.overrideWith((ref) => const JsonQuestionsIO())
      ],
    ),
  ));
}
