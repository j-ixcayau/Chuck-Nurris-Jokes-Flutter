import 'package:flutter/painting.dart';

class AppLocale {
  AppLocale._();

  static const englishLocale = Locale('en');
  static const spanishLocale = Locale('es');

  static List<Locale> get locales => [englishLocale, spanishLocale];
}
