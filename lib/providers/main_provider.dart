import 'package:flutter/material.dart';

class MainProvider extends ChangeNotifier {
  ThemeMode themeMode = ThemeMode.dark;
  bool isDark = true;

  void changeTheme(bool value) {
    if (value) {
      themeMode = ThemeMode.dark;
      isDark = true;
    } else {
      themeMode = ThemeMode.light;
      isDark = false;
    }
    notifyListeners();
  }
}
