import 'dart:ui';

import 'package:student_hackerha/core/themes/extentions/app_content.dart';

Color getProgressColor({required double t,required AppContent borderColor}) {
    if (t < 0.5) {
      return Color.lerp(borderColor.negative, borderColor.warning, t * 2)!;
    } else {
      return Color.lerp(
          borderColor.warning, borderColor.success, (t - 0.5) * 2)!;
    }
  }