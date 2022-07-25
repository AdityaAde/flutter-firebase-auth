import 'package:flutter/material.dart';

ThemeData theme() {
  return ThemeData(
    primaryColor: Colors.white,
    scaffoldBackgroundColor: Colors.white,
    fontFamily: 'Avenir',
    textTheme: _textTheme(),
  );
}

TextTheme _textTheme() {
  return const TextTheme(
    headline1: TextStyle(
      color: Colors.white,
      fontWeight: FontWeight.bold,
      fontSize: 36,
    ),
    headline2: TextStyle(
      color: Colors.white,
      fontWeight: FontWeight.bold,
      fontSize: 22,
    ),
    headline3: TextStyle(
      color: Colors.white,
      fontWeight: FontWeight.bold,
      fontSize: 18,
    ),
    headline4: TextStyle(
      color: Colors.white,
      fontWeight: FontWeight.bold,
      fontSize: 16,
    ),
    headline5: TextStyle(
      color: Colors.white,
      fontWeight: FontWeight.bold,
      fontSize: 14,
    ),
    headline6: TextStyle(
      color: Colors.white,
      fontWeight: FontWeight.normal,
      fontSize: 14,
    ),
    bodyText1: TextStyle(
      color: Colors.white,
      fontWeight: FontWeight.normal,
      height: 1.75,
      fontSize: 12,
    ),
    bodyText2: TextStyle(
      color: Colors.white,
      fontWeight: FontWeight.normal,
      fontSize: 10,
    ),
  );
}
