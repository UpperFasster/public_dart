part of 'locale.dart';

class _SupportedLocales {
  static String get en => 'en';
  static String get ky => 'ky';
  static String get ru => 'ru';

  static List<String> get all => [en, ky, ru];
}

enum SupportedLocalesEnum {
  en,
  ky,
  ru,
}
