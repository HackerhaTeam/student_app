

import 'dart:ui';

import 'package:student_hackerha/core/themes/extentions/app_backgrounds.dart';

Color? getBackgroundColor(
    {required bool isSelected, required AppBackgrounds backgroundColor}) {
  if (isSelected) {
    return backgroundColor.primaryBrand;
  } else {
    return null;
  }
}
