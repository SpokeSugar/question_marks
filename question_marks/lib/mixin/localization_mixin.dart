import 'package:flutter/widgets.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:flutter_gen/gen_l10n/app_localizations_en.dart';

extension LocalizationMixin on BuildContext {
  AppLocalizations get appL10n =>
      AppLocalizations.of(this) ?? AppLocalizationsEn();
}
