
    import 'dart:ui';

import 'package:student_hackerha/core/themes/extentions/app_content.dart';

Color getTimerTextColor(
      {required int minutes, required AppContent contentColor}) {
    if (minutes < 2) {
      return contentColor.negative;
    } else {
      return contentColor.primary;
    }
  }