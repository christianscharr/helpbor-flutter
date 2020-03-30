import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

class HelpborLocalizationsDelegate extends LocalizationsDelegate<HelpborLocalization> {
  const HelpborLocalizationsDelegate();

  @override
  bool isSupported(Locale locale) => ['en', 'es'].contains(locale.languageCode);

  @override
  Future<HelpborLocalization> load(Locale locale) {
    // Returning a SynchronousFuture here because an async "load" operation
    // isn't needed to produce an instance of DemoLocalizations.
    return SynchronousFuture<HelpborLocalization>(HelpborLocalization(locale));
  }

  @override
  bool shouldReload(HelpborLocalizationsDelegate old) => false;
}

class HelpborLocalization {
  HelpborLocalization(this.locale);

  final Locale locale;

  static HelpborLocalization of(BuildContext context) {
    return Localizations.of<HelpborLocalization>(context, HelpborLocalization);
  }

  static Map<String, Map<String, String>> _localizedValues = {
    'en': {
      'provideHelp': 'Provide Help',
      'askForHelp': 'Ask For Help'
    },
    'de': {
      'provideHelp': 'Hilfe Anbieten',
      'askForHelp': 'Um Hilfe Bitten'
    },
  };

  String get provideHelp {
    return _localizedValues[locale.languageCode]['provideHelp'];
  }

  String get askForHelp {
    return _localizedValues[locale.languageCode]['askForHelp'];
  }
}