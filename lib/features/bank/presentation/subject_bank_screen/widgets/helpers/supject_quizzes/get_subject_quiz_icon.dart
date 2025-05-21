
import 'package:flutter/material.dart';
import 'package:phosphor_flutter/phosphor_flutter.dart';

IconData getSubjectQuizIcon({required int index}) {
  if (index > 5) {
    return PhosphorIcons.student();
  } else {
    return PhosphorIcons.check();
  }
}