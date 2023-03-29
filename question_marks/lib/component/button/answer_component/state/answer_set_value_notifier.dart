import 'dart:collection';

import 'package:flutter/material.dart';

import '../../../../model/answer/answer.dart';

class AnswerSetValueNotifier extends ValueNotifier<Set<AnswerModel>> {
  AnswerSetValueNotifier() : super(UnmodifiableSetView({}));

  void clear() {
    value = UnmodifiableSetView({});
  }

  void remove(AnswerModel model) {
    Set<AnswerModel> newState = {};
    for (final i in value) {
      if (i != model) newState.add(i);
    }
    value = UnmodifiableSetView(newState);
  }

  void add(AnswerModel model) {
    value = UnmodifiableSetView({...value, model});
  }
}
