import 'package:flutter/material.dart';

enum MyThemeKeys { LIGHT, DARK }

class MyThemes {
  static final ThemeData lightTheme = ThemeData(
    brightness: Brightness.dark,
    primaryColor: Color.fromRGBO(40, 54, 55, 1),
    textSelectionColor: Colors.white,
    buttonColor: Color.fromRGBO(2, 150, 136, 1),
    splashColor: Color.fromRGBO(109, 127, 127, 1),
    cursorColor: Color.fromRGBO(2, 150, 136, 1),
    accentColor: Colors.white
  );

  static final ThemeData darkTheme = ThemeData(
      brightness: Brightness.light,
      primaryColor: Colors.white,
      textSelectionColor: Colors.grey,
      buttonColor: Color.fromRGBO(2, 150, 136, 1),
      splashColor: Colors.white,
      cursorColor: Color.fromRGBO(2, 150, 136, 1),
      accentColor: Colors.black);

  static ThemeData getThemeFromKey(MyThemeKeys themeKey) {
    switch (themeKey) {
      case MyThemeKeys.LIGHT:
        return lightTheme;
      case MyThemeKeys.DARK:
        return darkTheme;
      default:
        return lightTheme;
    }
  }
}