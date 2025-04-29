import 'package:flutter/material.dart';
import 'package:student_hackerha/core/themes/colors/app_colors.dart';

class AppContent extends ThemeExtension<AppContent> {
  final Color primary;
  final Color secondary;
  final Color tertiary;
  final Color onPrimary;
  final Color onSecondary;
  final Color onTertiary;
  final Color brandPrimary;
  final Color brandDisabledPrimary;
  final Color brandSecondary;
  final Color disabled;
  final Color negative;
  final Color success;
  final Color warning;
  final Color warningSoft;
  final Color primaryStatic;
  final Color primaryInverted;

  AppContent({
    required this.primary,
    required this.secondary,
    required this.tertiary,
    required this.onPrimary,
    required this.onSecondary,
    required this.onTertiary,
    required this.brandPrimary,
    required this.brandDisabledPrimary,
    required this.brandSecondary,
    required this.disabled,
    required this.negative,
    required this.success,
    required this.warning,
    required this.warningSoft,
    required this.primaryStatic,
    required this.primaryInverted,
  });

  static AppContent light = AppContent(
    primary: AppColors.grey800,
    secondary: AppColors.grey400,
    tertiary: AppColors.brandNavyBlue100,
    onPrimary: AppColors.white,
    onSecondary: AppColors.white,
    onTertiary: AppColors.white,
    brandPrimary: AppColors.brandNavyBlue500,
    brandDisabledPrimary: AppColors.brandNavyBlue50,
    brandSecondary: AppColors.green500,
    disabled: AppColors.grey300,
    negative: AppColors.red500,
    success: AppColors.green500,
    warning: AppColors.yellow500,
    warningSoft: AppColors.yellow50,
    primaryStatic: AppColors.grey800,
    primaryInverted: AppColors.grey50,
  );

  static AppContent dark = AppContent(
    primary: AppColors.grey50,
    secondary: AppColors.grey300,
    tertiary: AppColors.brandBlue100,
    onPrimary: AppColors.grey900,
    onSecondary: AppColors.grey900,
    onTertiary: AppColors.grey900,
    brandPrimary: AppColors.brandBlue500,
    brandDisabledPrimary: AppColors.black,
    brandSecondary: AppColors.green500,
    disabled: AppColors.grey400,
    negative: AppColors.red400,
    success: AppColors.green500,
    warning: AppColors.yellow500,
    warningSoft: AppColors.yellow1000,
    primaryStatic: AppColors.grey800,
    primaryInverted: AppColors.black,
  );

  get backgroundPrimary => null;

  @override
  AppContent copyWith({
    Color? primary,
    Color? secondary,
    Color? tertiary,
    Color? onPrimary,
    Color? onSecondary,
    Color? onTertiary,
    Color? brandPrimary,
    Color? brandDisabledPrimary,
    Color? brandSecondary,
    Color? disabled,
    Color? negative,
    Color? success,
    Color? warning,
    Color? warningSoft,
    Color? primaryStatic,
    Color? primaryInverted,
  }) {
    return AppContent(
        primary: primary ?? this.primary,
        secondary: secondary ?? this.secondary,
        tertiary: tertiary ?? this.tertiary,
        onPrimary: onPrimary ?? this.onPrimary,
        onSecondary: onSecondary ?? this.onSecondary,
        onTertiary: onTertiary ?? this.onTertiary,
        brandPrimary: brandPrimary ?? this.brandPrimary,
        brandDisabledPrimary: brandDisabledPrimary ?? this.brandDisabledPrimary,
        brandSecondary: brandSecondary ?? this.brandSecondary,
        disabled: disabled ?? this.disabled,
        negative: negative ?? this.negative,
        success: success ?? this.success,
        warning: warning ?? this.warning,
        warningSoft: warningSoft ?? this.warningSoft,
        primaryStatic: primaryStatic ?? this.primaryStatic,
        primaryInverted: primaryInverted ?? this.primaryInverted);
  }

  @override
  AppContent lerp(ThemeExtension<AppContent>? other, double t) {
    if (other is! AppContent) return this;
    return AppContent(
      primary: Color.lerp(primary, other.primary, t)!,
      secondary: Color.lerp(secondary, other.secondary, t)!,
      tertiary: Color.lerp(tertiary, other.tertiary, t)!,
      onPrimary: Color.lerp(onPrimary, other.onPrimary, t)!,
      onSecondary: Color.lerp(onSecondary, other.onSecondary, t)!,
      onTertiary: Color.lerp(onTertiary, other.onTertiary, t)!,
      brandPrimary: Color.lerp(brandPrimary, other.brandPrimary, t)!,
      brandDisabledPrimary:
          Color.lerp(brandDisabledPrimary, other.brandDisabledPrimary, t)!,
      brandSecondary: Color.lerp(brandSecondary, other.brandSecondary, t)!,
      disabled: Color.lerp(disabled, other.disabled, t)!,
      negative: Color.lerp(negative, other.negative, t)!,
      success: Color.lerp(success, other.success, t)!,
      warning: Color.lerp(warning, other.warning, t)!,
      warningSoft: Color.lerp(warningSoft, other.warningSoft, t)!,
      primaryStatic: Color.lerp(primaryStatic, other.primaryStatic, t)!,
      primaryInverted: Color.lerp(primaryInverted, other.primaryInverted, t)!,
    );
  }
}
