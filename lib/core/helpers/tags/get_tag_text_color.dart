import 'dart:ui';

import 'package:student_hackerha/core/themes/extentions/app_content.dart';

Color getTagTextColor(
    {required bool isSelected, required AppContent contentColor}) {
  if (isSelected) {
    return contentColor.primaryInverted;
  } else {
    return contentColor.secondary;
  }
}