String getFinishButtonText({required bool isCorrection}) {
  if (isCorrection) {
    return 'إنهاء عرض التصحيح';
  } else {
    return 'إنهاء الاختبار';
  }
}
