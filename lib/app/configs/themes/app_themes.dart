import 'package:flutter/material.dart';

import '../../utils/constants/app_colors.dart';

class AppThemes {
  static ThemeData lightTheme = ThemeData.light(useMaterial3: true).copyWith(
    brightness: Brightness.light,colorScheme: ColorScheme.light(
      primary: AppColorsLith.primaryColor,
      secondary: AppColorsLith.secondaryColor,
      background: AppColorsLith.background,
      onBackground: AppColorsLith.buttonColor,
      error: AppColorsLith.errorColor,
      onPrimary: AppColorsLith.primaryColorText,
      onSecondary: AppColorsLith.secundaryColorText,
      secondaryContainer: AppColorsLith.sucessColor
    )
  );
  static ThemeData darkTheme = ThemeData.dark(useMaterial3: true).copyWith(
    brightness: Brightness.dark, colorScheme: ColorScheme.dark(
      primary: AppDarkColors.primaryColor,
      secondary: AppDarkColors.secondaryColor,
      background: AppDarkColors.background,
      onBackground: AppDarkColors.buttonColor,
      error: AppDarkColors.errorColor,
      onPrimary: AppDarkColors.primaryColorText,
      onSecondary: AppDarkColors.secondaryColorText,
      secondaryContainer: AppDarkColors.successColor
    )
  );
}