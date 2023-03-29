import 'package:question_marks/model/settings/settings.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'settings_notifier.g.dart';

typedef SettingsCallback = Settings Function(Settings oldState);

@Riverpod(keepAlive: true)
class SettingsNotifier extends _$SettingsNotifier {
  @override
  Settings build() {
    _load();
    return const Settings(showCollectNum: true);
  }

  Future<void> _load() async {}

  void saveSettings(SettingsCallback update) {
    state = update.call(state);
  }
}
