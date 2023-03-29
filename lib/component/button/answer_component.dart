import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:grab/grab.dart';
import 'package:question_marks/mixin/localization_mixin.dart';
import 'package:question_marks/state/settings/settings_notifier.dart';

import '../../model/answer/answer.dart';
import 'answer_component/state/answer_set_value_notifier.dart';

part 'answer_component/answer_button.dart';
part 'answer_component/answer_selector.dart';
part 'answer_component/button_bar_state_text.dart';

typedef SelectedIndex = void Function(Set<AnswerModel> value);
