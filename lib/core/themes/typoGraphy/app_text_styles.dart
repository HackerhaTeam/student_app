import 'package:flutter/material.dart';
import 'app_typography.dart';

extension CustomTextTheme on TextTheme {
  // Display
  TextStyle get xDisplayLarge => TextStyle(
        fontFamily: AppTypography.arabicFontFamily,
        fontSize: AppTypography.fontSize700,
        height: AppTypography.lineHeight1000 / AppTypography.fontSize700,
        fontWeight: AppTypography.regular,
      );

  TextStyle get xDisplayMedium => TextStyle(
        fontFamily: AppTypography.arabicFontFamily,
        fontSize: AppTypography.fontSize400,
        height: AppTypography.lineHeight600 / AppTypography.fontSize400,
        fontWeight: AppTypography.regular,
      );

  TextStyle get xDisplaySmall => TextStyle(
        fontFamily: AppTypography.arabicFontFamily,
        fontSize: AppTypography.fontSize300,
        height: AppTypography.lineHeight500 / AppTypography.fontSize300,
        fontWeight: AppTypography.regular,
      );

  // Heading
  TextStyle get xHeadingXLarge => TextStyle(
        fontFamily: AppTypography.arabicFontFamily,
        fontSize: AppTypography.fontSize700,
        height: AppTypography.lineHeight1000 / AppTypography.fontSize700,
        fontWeight: AppTypography.regular,
      );

  TextStyle get xHeadingLarge => TextStyle(
        fontFamily: AppTypography.arabicFontFamily,
        fontSize: AppTypography.fontSize500,
        height: AppTypography.lineHeight700 / AppTypography.fontSize500,
        fontWeight: AppTypography.regular,
      );

  TextStyle get xHeadingMedium => TextStyle(
        fontFamily: AppTypography.arabicFontFamily,
        fontSize: AppTypography.fontSize400,
        height: AppTypography.lineHeight600 / AppTypography.fontSize400,
        fontWeight: AppTypography.regular,
      );

  TextStyle get xHeadingSmall => TextStyle(
        fontFamily: AppTypography.arabicFontFamily,
        fontSize: AppTypography.fontSize300,
        height: AppTypography.lineHeight500 / AppTypography.fontSize300,
        fontWeight: AppTypography.regular,
      );

  // Label
  TextStyle get xLabelXLarge => TextStyle(
        fontFamily: AppTypography.arabicFontFamily,
        fontSize: AppTypography.fontSize500,
        height: AppTypography.lineHeight700 / AppTypography.fontSize500,
        fontWeight: AppTypography.regular,
      );

  TextStyle get xLabelLarge => TextStyle(
        fontFamily: AppTypography.arabicFontFamily,
        fontSize: AppTypography.fontSize300,
        height: AppTypography.lineHeight500 / AppTypography.fontSize300,
        fontWeight: AppTypography.light,
      );

  TextStyle get xLabelMedium => TextStyle(
        fontFamily: AppTypography.arabicFontFamily,
        fontSize: AppTypography.fontSize200,
        height: AppTypography.lineHeight300 / AppTypography.fontSize200,
        fontWeight: AppTypography.light,
      );

  TextStyle get xLabelSmall => TextStyle(
        fontFamily: AppTypography.arabicFontFamily,
        fontSize: AppTypography.fontSize100,
        height: AppTypography.lineHeight200 / AppTypography.fontSize100,
        fontWeight: AppTypography.light,
      );

  // Paragraph
  TextStyle get xParagraphXLarge => TextStyle(
        fontFamily: AppTypography.arabicFontFamily,
        fontSize: AppTypography.fontSize400,
        height: AppTypography.lineHeight800 / AppTypography.fontSize400,
        fontWeight: AppTypography.regular,
      );

  TextStyle get xParagraphLarge => TextStyle(
        fontFamily: AppTypography.arabicFontFamily,
        fontSize: AppTypography.fontSize300,
        height: AppTypography.lineHeight600 / AppTypography.fontSize300,
        fontWeight: AppTypography.light,
      );

  TextStyle get xParagraphMedium => TextStyle(
        fontFamily: AppTypography.arabicFontFamily,
        fontSize: AppTypography.fontSize200,
        height: AppTypography.lineHeight400 / AppTypography.fontSize200,
        fontWeight: AppTypography.light,
      );

  TextStyle get xParagraphSmall => TextStyle(
        fontFamily: AppTypography.arabicFontFamily,
        fontSize: AppTypography.fontSize100,
        height: AppTypography.lineHeight200 / AppTypography.fontSize100,
        fontWeight: AppTypography.light,
      );
}
