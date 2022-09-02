import 'package:flutter/material.dart';
import 'app_colors.dart';

enum ApplicationTheme { lightTheme, darkTheme }

class Themes {
  static final appThemeData = {
    ApplicationTheme.lightTheme: ThemeData(
        brightness: Brightness.light,
        primaryColor: AppColors.primaryColor,
        colorScheme: ColorScheme.fromSwatch().copyWith(secondary: AppColors.accentColor),
    ),
    ApplicationTheme.darkTheme: ThemeData(
      brightness: Brightness.dark,
    )
  };
}
