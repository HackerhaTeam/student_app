import 'package:flutter/material.dart';
import 'app_typography.dart';

extension CustomTextTheme on TextTheme {
  // Display
  TextStyle get displayLarge => TextStyle(
        fontFamily: AppTypography.arabicFontFamily,
        fontSize: AppTypography.fontSize700,
        height: AppTypography.lineHeight1000 / AppTypography.fontSize700,
        fontWeight: AppTypography.regular,
      );

  TextStyle get displayMedium => TextStyle(
        fontFamily: AppTypography.arabicFontFamily,
        fontSize: AppTypography.fontSize400,
        height: AppTypography.lineHeight600 / AppTypography.fontSize400,
        fontWeight: AppTypography.regular,
      );

  TextStyle get displaySmall => TextStyle(
        fontFamily: AppTypography.arabicFontFamily,
        fontSize: AppTypography.fontSize300,
        height: AppTypography.lineHeight500 / AppTypography.fontSize300,
        fontWeight: AppTypography.regular,
      );

  // Heading
  TextStyle get headingXLarge => TextStyle(
        fontFamily: AppTypography.arabicFontFamily,
        fontSize: AppTypography.fontSize700,
        height: AppTypography.lineHeight1000 / AppTypography.fontSize700,
        fontWeight: AppTypography.regular,
      );

  TextStyle get headingLarge => TextStyle(
        fontFamily: AppTypography.arabicFontFamily,
        fontSize: AppTypography.fontSize500,
        height: AppTypography.lineHeight700 / AppTypography.fontSize500,
        fontWeight: AppTypography.regular,
      );

  TextStyle get headingMedium => TextStyle(
        fontFamily: AppTypography.arabicFontFamily,
        fontSize: AppTypography.fontSize400,
        height: AppTypography.lineHeight600 / AppTypography.fontSize400,
        fontWeight: AppTypography.regular,
      );

  TextStyle get headingSmall => TextStyle(
        fontFamily: AppTypography.arabicFontFamily,
        fontSize: AppTypography.fontSize300,
        height: AppTypography.lineHeight500 / AppTypography.fontSize300,
        fontWeight: AppTypography.regular,
      );

  // Label
  TextStyle get labelXLarge => TextStyle(
        fontFamily: AppTypography.arabicFontFamily,
        fontSize: AppTypography.fontSize500,
        height: AppTypography.lineHeight700 / AppTypography.fontSize500,
        fontWeight: AppTypography.regular,
      );

  TextStyle get labelLarge => TextStyle(
        fontFamily: AppTypography.arabicFontFamily,
        fontSize: AppTypography.fontSize300,
        height: AppTypography.lineHeight500 / AppTypography.fontSize300,
        fontWeight: AppTypography.light,
      );

  TextStyle get labelMedium => TextStyle(
        fontFamily: AppTypography.arabicFontFamily,
        fontSize: AppTypography.fontSize200,
        height: AppTypography.lineHeight300 / AppTypography.fontSize200,
        fontWeight: AppTypography.light,
      );

  TextStyle get labelSmall => TextStyle(
        fontFamily: AppTypography.arabicFontFamily,
        fontSize: AppTypography.fontSize100,
        height: AppTypography.lineHeight200 / AppTypography.fontSize100,
        fontWeight: AppTypography.light,
      );

  // Paragraph
  TextStyle get paragraphXLarge => TextStyle(
        fontFamily: AppTypography.arabicFontFamily,
        fontSize: AppTypography.fontSize400,
        height: AppTypography.lineHeight800 / AppTypography.fontSize400,
        fontWeight: AppTypography.regular,
      );

  TextStyle get paragraphLarge => TextStyle(
        fontFamily: AppTypography.arabicFontFamily,
        fontSize: AppTypography.fontSize300,
        height: AppTypography.lineHeight600 / AppTypography.fontSize300,
        fontWeight: AppTypography.light,
      );

  TextStyle get paragraphMedium => TextStyle(
        fontFamily: AppTypography.arabicFontFamily,
        fontSize: AppTypography.fontSize200,
        height: AppTypography.lineHeight400 / AppTypography.fontSize200,
        fontWeight: AppTypography.light,
      );

  TextStyle get paragraphSmall => TextStyle(
        fontFamily: AppTypography.arabicFontFamily,
        fontSize: AppTypography.fontSize100,
        height: AppTypography.lineHeight200 / AppTypography.fontSize100,
        fontWeight: AppTypography.light,
      );
}
