import 'package:flutter/material.dart';

class CustomTheme {
  static ThemeData darkTheme = ThemeData.dark().copyWith(
      primaryColor: Colors.pink,
      useMaterial3: true,
      switchTheme: SwitchThemeData(
        trackColor: MaterialStateProperty.all(Colors.purple),
        thumbColor: MaterialStateProperty.all(Colors.purpleAccent),
      ),
      scaffoldBackgroundColor: const Color.fromRGBO(30, 28, 41, 1),
      appBarTheme:
          const AppBarTheme(backgroundColor: Color.fromARGB(30, 28, 41, 1)));
  static ThemeData lightTheme = ThemeData.light().copyWith(
    useMaterial3: true,
  );
}
