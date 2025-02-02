import 'package:flutter/material.dart';
import 'package:uptask/core/style/pallet.dart';
import 'package:uptask/core/style/typography.dart';

final ThemeData lightTheme = ThemeData.light().copyWith(
  scaffoldBackgroundColor: AppColor.lightModeBackgroundColor,
  primaryColor: AppColor.lightModePrimaryColor,
  textTheme: _buildTextTheme(AppColor.lightModePrimaryColor),
);

final ThemeData darkTheme = ThemeData.dark().copyWith(
  scaffoldBackgroundColor: AppColor.darkModeBackgroundColor,
  primaryColor: AppColor.darkModePrimaryColor,
  textTheme: _buildTextTheme(AppColor.darkModePrimaryColor),
);

TextTheme _buildTextTheme(Color primaryColor) {
  return TextTheme(
    displayLarge: AppTypography.headline1.copyWith(color: primaryColor),
    displayMedium: AppTypography.headline2.copyWith(color: primaryColor),
    displaySmall: AppTypography.headline3.copyWith(color: primaryColor),
  );
}
