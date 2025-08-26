import 'package:flutter/material.dart';

import 'app_typography.dart';

extension CustomTextStyles on BuildContext {
  // Display
  TextStyle get xDisplayLarge => TextStyle(
        fontFamily: AppTypography.arabicFontFamily,
        fontSize: AppTypography.fontSize700(this),
        height: AppTypography.lineHeight1000(this) /
            AppTypography.fontSize700(this),
        fontWeight: AppTypography.regular,
        
      );

  TextStyle get xDisplayMedium => TextStyle(
        fontFamily: AppTypography.arabicFontFamily,
        fontSize: AppTypography.fontSize400(this),
        height:
            AppTypography.lineHeight600(this) / AppTypography.fontSize400(this),
        fontWeight: AppTypography.regular,
      );

  TextStyle get xDisplaySmall => TextStyle(
        fontFamily: AppTypography.arabicFontFamily,
        fontSize: AppTypography.fontSize300(this),
        height:
            AppTypography.lineHeight500(this) / AppTypography.fontSize300(this),
        fontWeight: AppTypography.regular,
      );

  // Heading
  TextStyle get xHeadingXLarge => TextStyle(
        fontFamily: AppTypography.arabicFontFamily,
        fontSize: AppTypography.fontSize700(this),
        height: AppTypography.lineHeight1000(this) /
            AppTypography.fontSize700(this),
        fontWeight: AppTypography.regular,
      );

  TextStyle get xHeadingLarge => TextStyle(
        fontFamily: AppTypography.arabicFontFamily,
        fontSize: AppTypography.fontSize500(this),
        height:
            AppTypography.lineHeight700(this) / AppTypography.fontSize500(this),
        fontWeight: AppTypography.regular,
      );

  TextStyle get xHeadingMedium => TextStyle(
        fontFamily: AppTypography.arabicFontFamily,
        fontSize: AppTypography.fontSize400(this),
        height:
            AppTypography.lineHeight600(this) / AppTypography.fontSize400(this),
        fontWeight: AppTypography.regular,
      );

  TextStyle get xHeadingSmall => TextStyle(
        fontFamily: AppTypography.arabicFontFamily,
        fontSize: AppTypography.fontSize300(this),
        height:
            AppTypography.lineHeight500(this) / AppTypography.fontSize300(this),
        fontWeight: AppTypography.light,
      );

  // Label
  TextStyle get xLabelXLarge => TextStyle(
        fontFamily: AppTypography.arabicFontFamily,
        fontSize: AppTypography.fontSize500(this),
        height:
            AppTypography.lineHeight700(this) / AppTypography.fontSize500(this),
        fontWeight: AppTypography.regular,
      );

  TextStyle get xLabelLarge => TextStyle(
        fontFamily: AppTypography.arabicFontFamily,
        fontSize: AppTypography.fontSize300(this),
        height:
            AppTypography.lineHeight500(this) / AppTypography.fontSize300(this),
        fontWeight: AppTypography.light,
      );

  TextStyle get xLabelMedium => TextStyle(
        fontFamily: AppTypography.arabicFontFamily,
        fontSize: AppTypography.fontSize200(this),
        height:
            AppTypography.lineHeight300(this) / AppTypography.fontSize200(this),
        fontWeight: AppTypography.light,
      );

  TextStyle get xLabelSmall => TextStyle(
        fontFamily: AppTypography.arabicFontFamily,
        fontSize: AppTypography.fontSize100(this),
        height:
            AppTypography.lineHeight200(this) / AppTypography.fontSize100(this),
        fontWeight: AppTypography.light,
      );

  // Paragraph
  TextStyle get xParagraphXLarge => TextStyle(
        fontFamily: AppTypography.arabicFontFamily,
        fontSize: AppTypography.fontSize400(this),
        height:
            AppTypography.lineHeight800(this) / AppTypography.fontSize400(this),
        fontWeight: AppTypography.regular,
      );

  TextStyle get xParagraphLargeLose => TextStyle(
        fontFamily: AppTypography.arabicFontFamily,
        fontSize: AppTypography.fontSize300(this),
        height:
            AppTypography.lineHeight600(this) / AppTypography.fontSize300(this),
        fontWeight: AppTypography.light,
      );

  TextStyle get xParagraphLargeNormal => TextStyle(
        fontFamily: AppTypography.arabicFontFamily,
        fontSize: AppTypography.fontSize300(this),
        height:
            AppTypography.lineHeight500(this) / AppTypography.fontSize300(this),
        fontWeight: AppTypography.light,
      );

  TextStyle get xParagraphMedium => TextStyle(
        fontFamily: AppTypography.arabicFontFamily,
        fontSize: AppTypography.fontSize200(this),
        height:
            AppTypography.lineHeight400(this) / AppTypography.fontSize200(this),
        fontWeight: AppTypography.light,
      );

  TextStyle get xParagraphSmall => TextStyle(
        fontFamily: AppTypography.arabicFontFamily,
        fontSize: AppTypography.fontSize100(this),
        height:
            AppTypography.lineHeight200(this) / AppTypography.fontSize100(this),
        fontWeight: AppTypography.light,
      );
}
