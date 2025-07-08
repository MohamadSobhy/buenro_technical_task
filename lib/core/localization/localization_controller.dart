import 'package:buenro_technical_task/app_module.dart';
import 'package:flutter/foundation.dart';

import '../../generated/l10n.dart';

class LocalizationController with ChangeNotifier {
  String _currentLocale = AppModule.I.currentLangCode ?? 'en';

  String get currentLocale => _currentLocale;

  void changeAppLanguage(String locale) {
    if (_currentLocale != locale && isLocaleSupported(locale)) {
      _currentLocale = locale;
      notifyListeners();
    }
  }

  bool isLocaleSupported(String locale) {
    // Add your supported locales here
    final supportedLocales = S.delegate.supportedLocales.map(
      (e) => e.languageCode,
    );

    return supportedLocales.contains(locale);
  }
}
