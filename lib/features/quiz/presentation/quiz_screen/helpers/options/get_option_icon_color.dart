import 'dart:ui';

import 'package:student_hackerha/core/themes/extentions/app_backgrounds.dart';
import 'package:student_hackerha/core/themes/extentions/app_content.dart';

Color? getOptionIconColor(
    {required bool isSelected,
    required AppBackgrounds backgroundColor,
    required AppContent contentColor}) {
  if (isSelected) {
    return backgroundColor.primaryBrand;
  } else {
    return contentColor.primaryInverted;
  }
}
