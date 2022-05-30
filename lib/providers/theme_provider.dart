import "package:flutter/material.dart";
import "package:local_storage/shared_preferences/shared_preferences.dart"
    show SPreferences;

class ThemeProvider extends ChangeNotifier {
  set setCurrentTheme(bool mode) {
    SPreferences.themeMode = mode;
    notifyListeners();
  }

  bool get getCurrentTheme => SPreferences.themeMode;
}
