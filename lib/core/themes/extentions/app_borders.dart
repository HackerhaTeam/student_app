import 'package:flutter/material.dart';
import 'package:student_hackerha/core/themes/colors/app_colors.dart';

class AppBorders extends ThemeExtension<AppBorders> {
  final Color primary;
  final Color transparent;
  final Color transparentStatic;
  final Color primaryBrand;
  final Color negative;
  final Color secondary;
  final Color disabled;
  final Color success;
  final Color containerOutlineStart;
  final Color containerOutlineEnd;
  AppBorders({
    required this.containerOutlineStart,
    required this.containerOutlineEnd,
    required this.primary,
    required this.transparent,
    required this.transparentStatic,
    required this.primaryBrand,
    required this.negative,
    required this.secondary,
    required this.disabled,
    required this.success,
  });

  static AppBorders light = AppBorders(
    primary: AppColors.grey800,
    transparent: AppColors.transparentBlack10,
    transparentStatic: AppColors.transparentBlack10,
    primaryBrand: AppColors.brandNavyBlue500,
    negative: AppColors.red500,
    secondary: AppColors.grey400,
    disabled: AppColors.grey300,
    success: AppColors.green500,
    containerOutlineStart: AppColors.fakeBlue,
    containerOutlineEnd: AppColors.brandNavyBlue700,
  );

  static AppBorders dark = AppBorders(
    primary: AppColors.grey50,
    transparent: AppColors.transparentWhite10,
    transparentStatic: AppColors.transparentBlack10,
    primaryBrand: AppColors.brandBlue500,
    negative: AppColors.red400,
    secondary: AppColors.grey200,
    disabled: AppColors.grey400,
    success: AppColors.green500,
    containerOutlineStart: AppColors.brandBlue200,
    containerOutlineEnd: AppColors.brandBlue500,
  );

  @override
  AppBorders copyWith({
    Color? primary,
    Color? transparent,
    Color? transparentStatic,
    Color? primaryBrand,
    Color? negative,
    Color? secondary,
    Color? disabled,
    Color? success,
    Color? containerOutlineStart,
    Color? containerOutlineEnd,
  }) {
    return AppBorders(
      primary: primary ?? this.primary,
      transparent: transparent ?? this.transparent,
      transparentStatic: transparentStatic ?? this.transparentStatic,
      primaryBrand: primaryBrand ?? this.primaryBrand,
      negative: negative ?? this.negative,
      secondary: secondary ?? this.secondary,
      disabled: disabled ?? this.disabled,
      success: success ?? this.success,
      containerOutlineStart:
          containerOutlineStart ?? this.containerOutlineStart,
      containerOutlineEnd: containerOutlineEnd ?? this.containerOutlineEnd,
    );
  }

  @override
  AppBorders lerp(ThemeExtension<AppBorders>? other, double t) {
    if (other is! AppBorders) return this;
    return AppBorders(
      primary: Color.lerp(primary, other.primary, t)!,
      transparent: Color.lerp(transparent, other.transparent, t)!,
      transparentStatic:
          Color.lerp(transparentStatic, other.transparentStatic, t)!,
      primaryBrand: Color.lerp(primaryBrand, other.primaryBrand, t)!,
      negative: Color.lerp(negative, other.negative, t)!,
      secondary: Color.lerp(secondary, other.secondary, t)!,
      disabled: Color.lerp(disabled, other.disabled, t)!,
      success: Color.lerp(success, other.success, t)!,
      containerOutlineStart:
          Color.lerp(containerOutlineStart, other.containerOutlineStart, t)!,
      containerOutlineEnd:
          Color.lerp(containerOutlineEnd, other.containerOutlineEnd, t)!,
    );
  }
}
