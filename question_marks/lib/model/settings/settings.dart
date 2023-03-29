import 'package:freezed_annotation/freezed_annotation.dart';

part 'settings.freezed.dart';
part 'settings.g.dart';

@freezed
class Settings with _$Settings {
  factory Settings.fromJson(Map<String, dynamic> json) =>
      _$SettingsFromJson(json);

  const factory Settings({
    @Default(false) bool showResult,
    @Default(true) bool clearSelect,
    @Default(false) bool showCollectNum,
  }) = _Settings;
}
