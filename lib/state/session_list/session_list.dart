import 'dart:collection';

import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:uuid/uuid.dart';

part 'session_list.g.dart';

@Riverpod(keepAlive: true)
class SessionList extends _$SessionList {
  @override
  Set<String> build() {
    return UnmodifiableSetView({});
  }

  String getUniqueID() {
    while (true) {
      String i = const Uuid().v4();
      if (!state.contains(i)) {
        state = UnmodifiableSetView({...state, i});
        return i;
      }
    }
  }

  void remove(String value) {
    final newState = state.toSet()..removeWhere((element) => element == value);
    state = UnmodifiableSetView(newState);
  }
}
