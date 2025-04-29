import 'package:flutter/material.dart';
import 'package:student_hackerha/core/functions/get_responsive_size.dart';

class AppTypography {
  // Font Families
  static const String arabicFontFamily = 'Montserrat-Arabic';

  // Font Sizes (Responsive)
  static double fontSize100(BuildContext context) => 12.fs(context);
  static double fontSize200(BuildContext context) => 14.fs(context);
  static double fontSize300(BuildContext context) => 16.fs(context);
  static double fontSize400(BuildContext context) => 18.fs(context);
  static double fontSize500(BuildContext context) => 20.fs(context);
  static double fontSize600(BuildContext context) => 22.fs(context);
  static double fontSize700(BuildContext context) => 24.fs(context);
  static double fontSize800(BuildContext context) => 26.fs(context);
  static double fontSize900(BuildContext context) => 28.fs(context);
  static double fontSize1000(BuildContext context) => 32.fs(context);

  // Line Heights (Responsive)
  static double lineHeight100(BuildContext context) => 16.fs(context);
  static double lineHeight200(BuildContext context) => 18.fs(context);
  static double lineHeight300(BuildContext context) => 20.fs(context);
  static double lineHeight400(BuildContext context) => 22.fs(context);
  static double lineHeight500(BuildContext context) => 24.fs(context);
  static double lineHeight600(BuildContext context) => 26.fs(context);
  static double lineHeight700(BuildContext context) => 30.fs(context);
  static double lineHeight800(BuildContext context) => 32.fs(context);
  static double lineHeight900(BuildContext context) => 40.fs(context);
  static double lineHeight1000(BuildContext context) => 44.fs(context);

  // Font Weights
  static const FontWeight light = FontWeight.w300;
  static const FontWeight regular = FontWeight.w400;
  static const FontWeight bold = FontWeight.w700;

  // Line Heights
  static const double lineHeight100 = 16;
  static const double lineHeight200 = 18;
  static const double lineHeight300 = 20;
  static const double lineHeight400 = 22;
  static const double lineHeight500 = 24;
  static const double lineHeight600 = 26;
  static const double lineHeight700 = 30;
  static const double lineHeight800 = 32;
  static const double lineHeight900 = 40;
  static const double lineHeight1000 = 44;
}
