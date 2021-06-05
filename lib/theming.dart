import 'package:flutter/material.dart';

final BG_COLOR = Colors.pink.shade700;
final MAIN_COLOR = Colors.white;
final SECONDARY_COLOR = Colors.white;

final BorderSide borderSide =
    BorderSide(color: MAIN_COLOR, style: BorderStyle.solid);

class CustomTheme {
  static double spacing = 16;

  static ThemeData get light {
    return ThemeData(
        backgroundColor: BG_COLOR,
        buttonColor: SECONDARY_COLOR,
        scaffoldBackgroundColor: BG_COLOR,
        primaryColor: MAIN_COLOR,
        inputDecorationTheme: InputDecorationTheme(
            hoverColor: MAIN_COLOR,
            focusedBorder: UnderlineInputBorder(borderSide: borderSide),
            floatingLabelBehavior: FloatingLabelBehavior.auto,
            labelStyle:
                TextStyle(color: MAIN_COLOR, fontWeight: FontWeight.bold),
            border: UnderlineInputBorder(
              borderSide: borderSide,
            )),
        accentColor: SECONDARY_COLOR,
        textTheme: TextTheme(bodyText1: TextStyle(), bodyText2: TextStyle())
            .apply(displayColor: MAIN_COLOR, bodyColor: MAIN_COLOR));
  }
}
