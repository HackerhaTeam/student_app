import 'package:flutter/material.dart';
import 'package:phosphor_flutter/phosphor_flutter.dart';

IconData getNextButtonIcon(
    {required bool isSelected, required bool isCorrection}) {
  if (isCorrection) {
    return _getCorrectionIcon();
  } else {
    return _getQuizIcon(isSelected);
  }
}

PhosphorIconData _getCorrectionIcon() {
  return PhosphorIcons.caretRight();
}

PhosphorIconData _getQuizIcon(bool isSelected) {
  if (isSelected) {
    return PhosphorIcons.caretRight();
  } else {
    return PhosphorIcons.caretDoubleRight();
  }
}
