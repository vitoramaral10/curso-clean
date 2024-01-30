import 'package:flutter/material.dart';

ThemeData makeAppTheme() {
  const primaryColor = Color.fromRGBO(136, 14, 79, 1);
  const primaryColorDark = Color.fromRGBO(96, 0, 39, 1);
  const primaryColorLight = Color.fromRGBO(188, 71, 123, 1);
  const textTheme = TextTheme(
    displayLarge: TextStyle(
      fontSize: 30,
      fontWeight: FontWeight.bold,
      color: primaryColorDark,
    ),
  );
  const inputDecorationTheme = InputDecorationTheme(
    enabledBorder: UnderlineInputBorder(
      borderSide: BorderSide(color: primaryColorLight),
    ),
    focusedBorder: UnderlineInputBorder(
      borderSide: BorderSide(color: primaryColor),
    ),
    alignLabelWithHint: true,
  );
  final elevatedButtonTheme = ElevatedButtonThemeData(
    style: ElevatedButton.styleFrom(
      foregroundColor: Colors.white,
      backgroundColor: primaryColor,
      padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 20),
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(20),
      ),
    ),
  );

  return ThemeData(
    primaryColor: primaryColor,
    primaryColorDark: primaryColorDark,
    primaryColorLight: primaryColorLight,
    colorScheme: ColorScheme.fromSwatch().copyWith(
      secondary: primaryColor,
      background: Colors.white,
    ),
    textTheme: textTheme,
    inputDecorationTheme: inputDecorationTheme,
    elevatedButtonTheme: elevatedButtonTheme,
  );
}
