import 'package:flutter/material.dart';
import 'package:student_hackerha/core/themes/colors/app_colors.dart';

class AppBackgrounds extends ThemeExtension<AppBackgrounds> {
  final Color surfacePrimary;
  final Color onSurfacePrimary;
  final Color onSurfaceSecondary;
  final Color onSurfaceTransparent;
  final Color containerStatic;
  final Color fill;
  final Color primaryBrand;
  final Color secondaryBrand;
  final Color negativeStrong;
  final Color negativeSoft;
  final Color successStrong;
  final Color successSoft;
  final Color warningStrong;
  final Color warningSoft;
  final Color brandDisabledPrimary;
  final Color disabled;

  AppBackgrounds({
    required this.disabled,
    required this.brandDisabledPrimary,
    required this.surfacePrimary,
    required this.onSurfacePrimary,
    required this.onSurfaceSecondary,
    required this.onSurfaceTransparent,
    required this.containerStatic,
    required this.fill,
    required this.primaryBrand,
    required this.secondaryBrand,
    required this.negativeStrong,
    required this.negativeSoft,
    required this.successStrong,
    required this.successSoft,
    required this.warningStrong,
    required this.warningSoft,
  });

  static AppBackgrounds light = AppBackgrounds(
    surfacePrimary: AppColors.white,
    onSurfacePrimary: AppColors.white,
    onSurfaceSecondary: AppColors.grey50,
    onSurfaceTransparent: AppColors.transparentWhite64,
    containerStatic: AppColors.grey50,
    fill: AppColors.grey50,
    primaryBrand: AppColors.brandNavyBlue500,
    secondaryBrand: AppColors.brandGreen500,
    negativeStrong: AppColors.red500,
    negativeSoft: AppColors.red50,
    successStrong: AppColors.green500,
    successSoft: AppColors.green50,
    warningStrong: AppColors.yellow500,
    warningSoft: AppColors.yellow50,
    brandDisabledPrimary: AppColors.brandNavyBlue200,
    disabled: AppColors.grey300,
  );

  static AppBackgrounds dark = AppBackgrounds(
    surfacePrimary: AppColors.grey1000,
    onSurfacePrimary: AppColors.grey900,
    onSurfaceSecondary: AppColors.grey900,
    onSurfaceTransparent: AppColors.transparentBlack64,
    containerStatic: AppColors.grey50,
    fill: AppColors.grey600,
    primaryBrand: AppColors.brandBlue500,
    secondaryBrand: AppColors.brandGreen500,
    negativeStrong: AppColors.red400,
    negativeSoft: AppColors.red1000,
    successStrong: AppColors.green500,
    successSoft: AppColors.green1000,
    warningStrong: AppColors.yellow500,
    warningSoft: AppColors.yellow1000,
    brandDisabledPrimary: AppColors.brandBlue800,
    disabled: AppColors.brandBlue500,
  );

  @override
  AppBackgrounds lerp(ThemeExtension<AppBackgrounds>? other, double t) {
    if (other is! AppBackgrounds) return this;
    return AppBackgrounds(
      surfacePrimary: Color.lerp(surfacePrimary, other.surfacePrimary, t)!,
      onSurfacePrimary:
          Color.lerp(onSurfacePrimary, other.onSurfacePrimary, t)!,
      onSurfaceSecondary:
          Color.lerp(onSurfaceSecondary, other.onSurfaceSecondary, t)!,
      onSurfaceTransparent:
          Color.lerp(onSurfaceTransparent, other.onSurfaceTransparent, t)!,
      containerStatic: Color.lerp(containerStatic, other.containerStatic, t)!,
      fill: Color.lerp(fill, other.fill, t)!,
      primaryBrand: Color.lerp(primaryBrand, other.primaryBrand, t)!,
      secondaryBrand: Color.lerp(secondaryBrand, other.secondaryBrand, t)!,
      negativeStrong: Color.lerp(negativeStrong, other.negativeStrong, t)!,
      negativeSoft: Color.lerp(negativeSoft, other.negativeSoft, t)!,
      successStrong: Color.lerp(successStrong, other.successStrong, t)!,
      successSoft: Color.lerp(successSoft, other.successSoft, t)!,
      warningStrong: Color.lerp(warningStrong, other.warningStrong, t)!,
      warningSoft: Color.lerp(warningSoft, other.warningSoft, t)!,
      brandDisabledPrimary:
          Color.lerp(brandDisabledPrimary, other.brandDisabledPrimary, t)!,
      disabled: Color.lerp(disabled, other.disabled, t)!,
    );
  }

  @override
  AppBackgrounds copyWith(
      {Color? surfacePrimary,
      Color? onSurfacePrimary,
      Color? onSurfaceSecondary,
      Color? onSurfaceTransparent,
      Color? containerStatic,
      Color? fill,
      Color? primaryBrand,
      Color? secondaryBrand,
      Color? negativeStrong,
      Color? negativeSoft,
      Color? successStrong,
      Color? successSoft,
      Color? warningStrong,
      Color? warningSoft,
      Color? disabled,
      Color? brandDisabledPrimary,
      RadialGradient? radialSurfaceStart,
      RadialGradient? radialSurfaceEnd}) {
    return AppBackgrounds(
      surfacePrimary: surfacePrimary ?? this.surfacePrimary,
      onSurfacePrimary: onSurfacePrimary ?? this.onSurfacePrimary,
      onSurfaceSecondary: onSurfaceSecondary ?? this.onSurfaceSecondary,
      onSurfaceTransparent: onSurfaceTransparent ?? this.onSurfaceTransparent,
      containerStatic: containerStatic ?? this.containerStatic,
      fill: fill ?? this.fill,
      primaryBrand: primaryBrand ?? this.primaryBrand,
      secondaryBrand: secondaryBrand ?? this.secondaryBrand,
      negativeStrong: negativeStrong ?? this.negativeStrong,
      negativeSoft: negativeSoft ?? this.negativeSoft,
      successStrong: successStrong ?? this.successStrong,
      successSoft: successSoft ?? this.successSoft,
      warningStrong: warningStrong ?? this.warningStrong,
      warningSoft: warningSoft ?? this.warningSoft,
      brandDisabledPrimary: brandDisabledPrimary ?? this.brandDisabledPrimary,
      disabled: disabled ?? this.disabled,
    );
  }
}
