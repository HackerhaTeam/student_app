import 'package:flutter/material.dart';
import 'package:student_hackerha/core/themes/extentions/app_content.dart';

Color getDrawerQuestionTitleColor(
    {required int selectedIndex,
    required int currentIndex,
    required int lastIndexAccess,
    required bool isCorrection,
    required AppContent contentColor}) {
  if (isCorrection) {
    return _getCorrectionTitleColor(selectedIndex, currentIndex, contentColor);
  } else {
    return _getQuizTitleColor(
        lastIndexAccess, currentIndex, contentColor, selectedIndex);
  }
}

Color _getCorrectionTitleColor(
    int selectedIndex, int currentIndex, AppContent contentColor) {
  if (selectedIndex == currentIndex) {
    return contentColor.brandPrimary;
  } else {
    return contentColor.primary;
  }
}

Color _getQuizTitleColor(int lastIndexAccess, int currentIndex,
    AppContent contentColor, int selectedIndex) {
  if (lastIndexAccess < currentIndex) {
    return contentColor.disabled;
  } else {
    if (selectedIndex == currentIndex) {
      return contentColor.brandPrimary;
    } else {
      return contentColor.primary;
    }
  }
}
