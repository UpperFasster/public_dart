import 'package:flutter/material.dart';

class ThemeService extends ChangeNotifier {
  bool _isDark = false;
  ThemeService();

  bool get isDark => _isDark;

  ThemeMode get themeMode => isDark ? ThemeMode.dark : ThemeMode.light;

  void toggleTheme() {
    _isDark = !_isDark;
    notifyListeners();
  }
}
