import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:question_marks/model/answer_result/answer_result.dart';
import 'package:question_marks/screen/error_page.dart';
import 'package:question_marks/screen/file_picker.dart';
import 'package:question_marks/screen/result.dart';
import 'package:question_marks/screen/web_entry.dart';
import 'package:question_marks/state/question_manager/question_manager.dart';
import 'package:question_marks/state/quiz_session/quiz_session.dart';
import 'package:question_marks/state/settings/settings_notifier.dart';

import '../screen/answer_page.dart';
import '../screen/home.dart';
import '../screen/question_page.dart';

part 'rotes/answer_page_route.part.dart';
part 'rotes/file_picker_route.part.dart';
part 'rotes/home_route.part.dart';
part 'rotes/license.part.dart';
part 'rotes/question_page_route.part.dart';
part 'rotes/result_route.part.dart';
part 'router.g.dart';
