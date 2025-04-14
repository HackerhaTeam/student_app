import 'package:flutter/material.dart';
import 'app_theme.dart';

class ThemeConfig extends ChangeNotifier {
  ThemeMode _themeMode = ThemeMode.system;

  ThemeMode get themeMode => _themeMode;

  /// Use this if you want to get the actual ThemeData
  ThemeData get lightTheme => AppTheme.light;
  ThemeData get darkTheme => AppTheme.dark;

  bool get isDarkMode => _themeMode == ThemeMode.dark;

  void toggleTheme() {
    if (_themeMode == ThemeMode.light) {
      _themeMode = ThemeMode.dark;
    } else {
      _themeMode = ThemeMode.light;
    }
    notifyListeners();
  }

  void setThemeMode(ThemeMode mode) {
    _themeMode = mode;
    notifyListeners();
  }
}
