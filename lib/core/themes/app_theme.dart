// ignore_for_file: deprecated_member_use

import 'package:flutter/material.dart';
import 'package:student_hackerha/core/themes/colors/app_colors.dart';
import 'package:student_hackerha/core/themes/extentions/app_backgrounds.dart';
import 'package:student_hackerha/core/themes/extentions/app_borders.dart';
import 'package:student_hackerha/core/themes/extentions/app_content.dart';
import 'package:student_hackerha/core/themes/typoGraphy/app_typography.dart';

class AppTheme {
  static ThemeData light = ThemeData(
    textSelectionTheme: TextSelectionThemeData(
      selectionColor: Color(0xff022A68).withOpacity(0.3),
      selectionHandleColor: Color(0xff022A68),
      cursorColor: Color(0xff022A68),
    ),
    brightness: Brightness.light,
    scaffoldBackgroundColor: AppColors.white,
    primaryColor: AppColors.grey800,
    fontFamily: AppTypography.arabicFontFamily,
    extensions: <ThemeExtension<dynamic>>[
      AppBorders.light,
      AppBackgrounds.light,
      AppContent.light
    ],
    colorScheme: ColorScheme.light(
      primary: AppColors.grey800,
      onPrimary: AppColors.white,
      secondary: AppColors.grey400,
      onSecondary: AppColors.grey100,
      tertiary: AppColors.brandNavyBlue100,
      onTertiary: AppColors.brandBlue100,
      error: AppColors.red500,
      onError: AppColors.red50,
      background: AppColors.white,
      onBackground: AppColors.grey800,
      surface: AppColors.white,
      onSurface: AppColors.grey800,
    ),
  );

  static ThemeData dark = ThemeData(
    textSelectionTheme: TextSelectionThemeData(
      selectionColor: Color(0xff36A9E1).withOpacity(0.3),
      selectionHandleColor: Color(0xff36A9E1),
      cursorColor: Color(0xff36A9E1),
    ),
    brightness: Brightness.dark,
    scaffoldBackgroundColor: AppColors.grey900,
    primaryColor: AppColors.grey50,
    fontFamily: AppTypography.arabicFontFamily,
    extensions: <ThemeExtension<dynamic>>[
      AppBorders.dark,
      AppBackgrounds.dark,
      AppContent.dark
    ],
    colorScheme: ColorScheme.dark(
      primary: AppColors.grey50,
      onPrimary: AppColors.grey800,
      secondary: AppColors.grey300,
      onSecondary: AppColors.grey800,
      tertiary: AppColors.brandBlue100,
      onTertiary: AppColors.brandNavyBlue100,
      error: AppColors.red400,
      onError: AppColors.red1000,
      background: AppColors.grey900,
      onBackground: AppColors.grey50,
      surface: AppColors.grey800,
      onSurface: AppColors.grey50,
    ),
  );
}
