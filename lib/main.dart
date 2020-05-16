import 'package:first_app/calc_screen.dart';
import 'package:first_app/custom_theme.dart';
import 'package:first_app/themes.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(
    CustomTheme(
      initialThemeKey: MyThemeKeys.LIGHT,
      child: MyApp(),
    ),
  );
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Calculator',
      theme: CustomTheme.of(context),
      home: CalculatorScreen(),
       debugShowCheckedModeBanner: false,
    );
  }
}
