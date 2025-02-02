import 'package:flutter/material.dart';

final String fontFamily = 'BarlowSemiCondensed';

class AppTypography {
  static TextStyle headline1 = TextStyle(
    fontFamily: fontFamily,
    fontSize: 96,
    fontWeight: FontWeight.w300,
    letterSpacing: -1.5,
  );

  static TextStyle headline2 = TextStyle(
    fontFamily: fontFamily,
    fontSize: 60,
    fontWeight: FontWeight.w300,
    letterSpacing: -0.5,
  );

  static TextStyle headline3 = TextStyle(
    fontFamily: fontFamily,
    fontSize: 48,
    fontWeight: FontWeight.w400,
  );

  static TextStyle headline4 = TextStyle(
    fontFamily: fontFamily,
    fontSize: 34,
    fontWeight: FontWeight.w400,
    letterSpacing: 0.25,
  );

  static TextStyle headline5 = TextStyle(
    fontFamily: fontFamily,
    fontSize: 24,
    fontWeight: FontWeight.w400,
  );

  static TextStyle headline6 = TextStyle(
    fontFamily: fontFamily,
    fontSize: 20,
    fontWeight: FontWeight.w500,
    letterSpacing: 0.15,
  );

  static TextStyle subtitle1 = TextStyle(
    fontFamily: fontFamily,
    fontSize: 16,
    fontWeight: FontWeight.w400,
    letterSpacing: 0.15,
  );

  static TextStyle subtitle2 = TextStyle(
    fontFamily: fontFamily,
    fontSize: 14,
    fontWeight: FontWeight.w500,
    letterSpacing: 0.1,
  );

  static TextStyle bodyText1 = TextStyle(
    fontFamily: fontFamily,
    fontSize: 16,
    fontWeight: FontWeight.w400,
    letterSpacing: 0.5,
  );

  static TextStyle bodyText2 = TextStyle(
    fontFamily: fontFamily,
    fontSize: 14,
    fontWeight: FontWeight.w400,
    letterSpacing: 0.25,
  );

  static TextStyle button = TextStyle(
    fontFamily: fontFamily,
    fontSize: 14,
    fontWeight: FontWeight.w500,
    letterSpacing: 1.25,
  );

  static TextStyle caption = TextStyle(
    fontFamily: fontFamily,
    fontSize: 12,
    fontWeight: FontWeight.w400,
    letterSpacing: 0.4,
  );

  static TextStyle overline = TextStyle(
    fontFamily: fontFamily,
    fontSize: 10,
    fontWeight: FontWeight.w400,
    letterSpacing: 1.5,
  );
}
