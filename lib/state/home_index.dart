import 'package:flutter_riverpod/flutter_riverpod.dart';

final homeBottomBarIndexProvider = StateProvider.autoDispose<int>((ref) {
  return 0;
});
