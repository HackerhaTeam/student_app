String getNextButtonText(
    {required bool isSelected, required bool isCorrection}) {
  if (isCorrection) {
    return _getCorrectionText();
  } else {
    return _getQuizText(isSelected);
  }
}

String _getCorrectionText() {
  return 'السؤال التالي';
}

String _getQuizText(bool isSelected) {
  if (isSelected) {
    return 'السؤال التالي';
  } else {
    return 'تخطي السؤال';
  }
}
