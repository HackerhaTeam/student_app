  import 'dart:ui';

import 'package:student_hackerha/core/themes/extentions/app_backgrounds.dart';

Color getTimerCardBackgroundColor(
      {required int minutes, required AppBackgrounds backgroundColor}) {
    if (minutes < 2) {
      return backgroundColor.negativeSoft;
    } else {
      return backgroundColor.onSurfaceSecondary;
    }
  }