import 'package:flutter/material.dart';
import 'package:food_court/core/services/services.dart';
import 'package:food_court/core/utils/utils.dart';
import 'package:food_court/generated/l10n.dart';
import 'package:shared_preferences/shared_preferences.dart';

part 'supoerted_locales.enum.dart';

class LocaleService extends ChangeNotifier {
  late Locale _locale;
  LocaleService(Locale locale) {
    _locale = _getSupportedLocale(locale);
    notifyListeners();
  }

  Locale get locale => _locale;

  static Locale _getSupportedLocale(Locale systemLocale) {
    String? userSavedLanguage = getIt
        .get<SharedPreferences>()
        .getString(KeysOfSharedPreferences.savedLocal);
    if (userSavedLanguage != null &&
        userSavedLanguage != '' &&
        _SupportedLocales.all.any(
          (locale) => userSavedLanguage.contains(locale),
        )) {
      return _isSuportThatLanguage(Locale(userSavedLanguage));
    } else {
      return _isSuportThatLanguage(systemLocale);
    }
  }

  static Locale _isSuportThatLanguage(Locale locale) {
    if (S.delegate.isSupported(locale)) {
      return locale;
    } else {
      return Locale(_SupportedLocales.en);
    }
  }

  void changeLocale(SupportedLocalesEnum localeEnum) {
    if (localeEnum == SupportedLocalesEnum.en) {
      _locale = Locale(_SupportedLocales.en);
      notifyListeners();
    } else if (localeEnum == SupportedLocalesEnum.ky) {
      _locale = Locale(_SupportedLocales.ky);
      notifyListeners();
    } else if (localeEnum == SupportedLocalesEnum.ru) {
      _locale = Locale(_SupportedLocales.ru);
      notifyListeners();
    }
  }

  List<String> get supportedLanguages {
    return _SupportedLocales.all;
  }
}
