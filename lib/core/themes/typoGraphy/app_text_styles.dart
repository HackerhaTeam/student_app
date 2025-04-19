import 'package:flutter/material.dart';
import 'app_typography.dart';

class AppTextStyles {
  // Display
  static const TextStyle displayLarge = TextStyle(
    fontFamily: AppTypography.arabicFontFamily,
    fontSize: AppTypography.fontSize700,
    height: AppTypography.lineHeight1000 / AppTypography.fontSize700,
    fontWeight: AppTypography.regular,
  );

  static const TextStyle displayMedium = TextStyle(
    fontFamily: AppTypography.arabicFontFamily,
    fontSize: AppTypography.fontSize400,
    height: AppTypography.lineHeight600 / AppTypography.fontSize400,
    fontWeight: AppTypography.regular,
  );

  static const TextStyle displaySmall = TextStyle(
    fontFamily: AppTypography.arabicFontFamily,
    fontSize: AppTypography.fontSize300,
    height: AppTypography.lineHeight500 / AppTypography.fontSize300,
    fontWeight: AppTypography.regular,
  );

  // Heading
  static const TextStyle headingXLarge = TextStyle(
    fontFamily: AppTypography.arabicFontFamily,
    fontSize: AppTypography.fontSize700,
    height: AppTypography.lineHeight1000 / AppTypography.fontSize700,
    fontWeight: AppTypography.regular,
  );

  static const TextStyle headingLarge = TextStyle(
    fontFamily: AppTypography.arabicFontFamily,
    fontSize: AppTypography.fontSize500,
    height: AppTypography.lineHeight700 / AppTypography.fontSize500,
    fontWeight: AppTypography.regular,
  );

  static const TextStyle headingMedium = TextStyle(
    fontFamily: AppTypography.arabicFontFamily,
    fontSize: AppTypography.fontSize400,
    height: AppTypography.lineHeight600 / AppTypography.fontSize400,
    fontWeight: AppTypography.regular,
  );

  static const TextStyle headingSmall = TextStyle(
    fontFamily: AppTypography.arabicFontFamily,
    fontSize: AppTypography.fontSize300,
    height: AppTypography.lineHeight500 / AppTypography.fontSize300,
    fontWeight: AppTypography.regular,
  );

  // Label
  static const TextStyle labelXLarge = TextStyle(
    fontFamily: AppTypography.arabicFontFamily,
    fontSize: AppTypography.fontSize500,
    height: AppTypography.lineHeight700 / AppTypography.fontSize500,
    fontWeight: AppTypography.regular,
  );

  static const TextStyle labelLarge = TextStyle(
    fontFamily: AppTypography.arabicFontFamily,
    fontSize: AppTypography.fontSize300,
    height: AppTypography.lineHeight500 / AppTypography.fontSize300,
    fontWeight: AppTypography.light,
  );

  static const TextStyle labelMedium = TextStyle(
    fontFamily: AppTypography.arabicFontFamily,
    fontSize: AppTypography.fontSize200,
    height: AppTypography.lineHeight300 / AppTypography.fontSize200,
    fontWeight: AppTypography.light,
  );

  static const TextStyle labelSmall = TextStyle(
    fontFamily: AppTypography.arabicFontFamily,
    fontSize: AppTypography.fontSize100,
    height: AppTypography.lineHeight200 / AppTypography.fontSize100,
    fontWeight: AppTypography.light,
  );

  // Paragraph
  static const TextStyle paragraphXLarge = TextStyle(
    fontFamily: AppTypography.arabicFontFamily,
    fontSize: AppTypography.fontSize400,
    height: AppTypography.lineHeight800 / AppTypography.fontSize400,
    fontWeight: AppTypography.regular,
  );

  static const TextStyle paragraphLarge = TextStyle(
    fontFamily: AppTypography.arabicFontFamily,
    fontSize: AppTypography.fontSize300,
    height: AppTypography.lineHeight600 / AppTypography.fontSize300,
    fontWeight: AppTypography.light,
  );

  static const TextStyle paragraphMedium = TextStyle(
    fontFamily: AppTypography.arabicFontFamily,
    fontSize: AppTypography.fontSize200,
    height: AppTypography.lineHeight400 / AppTypography.fontSize200,
    fontWeight: AppTypography.light,
  );

  static const TextStyle paragraphSmall = TextStyle(
    fontFamily: AppTypography.arabicFontFamily,
    fontSize: AppTypography.fontSize100,
    height: AppTypography.lineHeight200 / AppTypography.fontSize100,
    fontWeight: AppTypography.light,
  );
}
