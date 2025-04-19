// ignore_for_file: deprecated_member_use

import 'package:flutter/material.dart';
import 'package:student_hackerha/core/themes/colors/app_colors.dart';
import 'package:student_hackerha/core/themes/extentions/app_backgrounds.dart';
import 'package:student_hackerha/core/themes/extentions/app_borders.dart';
import 'package:student_hackerha/core/themes/typoGraphy/app_text_styles.dart';
import 'package:student_hackerha/core/themes/typoGraphy/app_typography.dart';

class AppTheme {
  static ThemeData light = ThemeData(
    brightness: Brightness.light,
    scaffoldBackgroundColor: AppColors.white,
    primaryColor: AppColors.grey800,
    fontFamily: AppTypography.arabicFontFamily,
    textTheme: const TextTheme(
      displayLarge: AppTextStyles.displayLarge,
      displayMedium: AppTextStyles.displayMedium,
      displaySmall: AppTextStyles.displaySmall,
      headlineLarge: AppTextStyles.headingLarge,
      headlineMedium: AppTextStyles.headingMedium,
      headlineSmall: AppTextStyles.headingSmall,
      titleLarge: AppTextStyles.labelLarge,
      titleMedium: AppTextStyles.labelMedium,
      titleSmall: AppTextStyles.labelSmall,
      bodyLarge: AppTextStyles.paragraphXLarge,
    ),
    extensions: <ThemeExtension<dynamic>>[
      AppBorders.light,
      AppBackgrounds.light,
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
    brightness: Brightness.dark,
    scaffoldBackgroundColor: AppColors.grey900,
    primaryColor: AppColors.grey50,
    fontFamily: AppTypography.arabicFontFamily,
    textTheme: const TextTheme(
      displayLarge: AppTextStyles.displayLarge,
      displayMedium: AppTextStyles.displayMedium,
      displaySmall: AppTextStyles.displaySmall,
      headlineLarge: AppTextStyles.headingLarge,
      headlineMedium: AppTextStyles.headingMedium,
      headlineSmall: AppTextStyles.headingSmall,
      titleLarge: AppTextStyles.labelLarge,
      titleMedium: AppTextStyles.labelMedium,
      titleSmall: AppTextStyles.labelSmall,
      bodyLarge: AppTextStyles.paragraphXLarge,
    ),
    extensions: <ThemeExtension<dynamic>>[
      AppBorders.dark,
      AppBackgrounds.dark,
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
