

import 'dart:ui';

import 'package:student_hackerha/core/themes/extentions/app_backgrounds.dart';

Color getSubjectQuizIconColor({required int index,required AppBackgrounds backgroundColor}) {
  if (index > 5) {
    return backgroundColor.primaryBrand;
  } else {
    return backgroundColor.successStrong;
  }
}
