List<String> generateQuestionsList(int count) {
  return List.generate(count, (index) => 'السؤال ${_convertToArabicNumber(index + 1)}');
}

String _convertToArabicNumber(int number) {
  const Map<int, String> units = {
    1: 'الأول',
    2: 'الثاني',
    3: 'الثالث',
    4: 'الرابع',
    5: 'الخامس',
    6: 'السادس',
    7: 'السابع',
    8: 'الثامن',
    9: 'التاسع',
    10: 'العاشر',
    11: 'الحادي عشر',
    12: 'الثاني عشر',
    13: 'الثالث عشر',
    14: 'الرابع عشر',
    15: 'الخامس عشر',
    16: 'السادس عشر',
    17: 'السابع عشر',
    18: 'الثامن عشر',
    19: 'التاسع عشر',
  };

  const Map<int, String> tens = {
    20: 'العشرون',
    30: 'الثلاثون',
    40: 'الأربعون',
    50: 'الخمسون',
    60: 'الستون',
    70: 'السبعون',
  };

  if (number <= 19) {
    return units[number]!;
  } else if (number % 10 == 0 && number <= 70) {
    return tens[number]!;
  } else if (number < 70) {
    int unit = number % 10;
    int ten = number - unit;
    String unitStr = _convertUnitOrdinal(unit);
    String tenStr = tens[ten]!;
    return '$unitStr و$tenStr';
  } else {
    return '$number'; // fallback إذا أكثر من 70
  }
}

String _convertUnitOrdinal(int number) {
  const unitOrdinals = {
    1: 'الأول',
    2: 'الثاني',
    3: 'الثالث',
    4: 'الرابع',
    5: 'الخامس',
    6: 'السادس',
    7: 'السابع',
    8: 'الثامن',
    9: 'التاسع',
  };
  return unitOrdinals[number] ?? '$number';
}
