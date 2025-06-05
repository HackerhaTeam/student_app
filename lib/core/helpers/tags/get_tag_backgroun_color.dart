

import 'dart:ui';

import 'package:student_hackerha/core/themes/extentions/app_backgrounds.dart';

Color? getTagBackgroundColor(
    {required bool isSelected, required AppBackgrounds backgroundColor}) {
  if (isSelected) {
    return backgroundColor.primaryBrand;
  } else {
    return null;
  }
}
