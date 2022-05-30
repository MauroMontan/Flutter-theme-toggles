import 'package:shared_preferences/shared_preferences.dart';

class SPreferences {
  static late SharedPreferences _prefs;

  static Future<void> init() async =>
      _prefs = await SharedPreferences.getInstance();

  static set themeMode(bool mode) => _prefs.setBool("themeMode", mode);
  static bool get themeMode => _prefs.getBool("themeMode") ?? false;
}
