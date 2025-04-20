import 'package:flutter/material.dart';

class AppColors {
  // Base
  static const white = Color(0xFFFFFFFF);
  static const black = Color(0xFF000000);

  // Grey Scale
  static const grey50 = Color(0xFFF7F7F7);
  static const grey100 = Color(0xFFDDDDDD);
  static const grey200 = Color(0xFFD4D4D4);
  static const grey300 = Color(0xFFACACAC);
  static const grey400 = Color(0xFF717171);
  static const grey500 = Color(0xFF525252);
  static const grey600 = Color(0xFF404040);
  static const grey700 = Color(0xFF252527);
  static const grey800 = Color(0xFF222222);
  static const grey900 = Color(0xFF1E1E1E);
  static const grey1000 = Color(0xFF171717);

  // Red
  static const red50 = Color(0xFFFEF2F2);
  static const red400 = Color(0xFFFF6467);
  static const red500 = Color(0xFFFB2C36);
  static const red1000 = Color(0xFF460809);

  // Green
  static const green50 = Color(0xFFF0FDF4);
  static const green500 = Color(0xFF00C950);
  static const green1000 = Color(0xFF032E15);

  // Yellow
  static const yellow50 = Color(0xFFFEFCE8);
  static const yellow500 = Color(0xFFF0B100);
  static const yellow1000 = Color(0xFF432004);

  // Brand - Navy Blue
  static const brandNavyBlue50 = Color(0xFFE6EAF0); // جديد
  static const brandNavyBlue100 = Color(0xFFB1BDD0);
  static const brandNavyBlue200 = Color(0xFF8B9DBA); // جديد
  static const brandNavyBlue500 = Color(0xFF022A68);

  // Brand - Blue
  static const brandBlue100 = Color(0xFFC1E4F6);
  static const brandBlue800 = Color(0xFF1E5D7C); // مستخدم في dark
  static const brandBlue500 = Color(0xFF36A9E1);

  // Brand - Green
  static const brandGreen500 = Color(0xFF60BA48);

  // Transparent colors
  static const transparentBlack10 = Color(0x1A000000);
  static const transparentWhite10 = Color(0x1AFFFFFF);
  static const transparentWhite64 = Color(0xA3FFFFFF);
  static const transparentBlack64 = Color(0xA3222222);

  // Disabled brand
  static const brandDisabledPrimaryLight = brandNavyBlue50;
  static const brandDisabledPrimaryDark = AppColors.black;
}
