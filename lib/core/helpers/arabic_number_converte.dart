class ArabicNumberConverter {
  /// دالة عامة: ترجع نص مثل "الدرس الأول" أو "الدرس المئة والخامس عشر"
  static String getLessonTitle(int index) {
    int number = index + 1; // لأنه يبدأ من صفر
    return "الدرس ${_convertNumberToArabic(number)}";
  }

  /// الدالة الأساسية لتحويل رقم إلى نص عربي (1 → الأول، 2 → الثاني ...)
  static String _convertNumberToArabic(int number) {
    if (number < 1 || number > 999) {
      throw ArgumentError("الرقم يجب أن يكون بين 1 و 999");
    }

    final units = [
      "",
      "الأول",
      "الثاني",
      "الثالث",
      "الرابع",
      "الخامس",
      "السادس",
      "السابع",
      "الثامن",
      "التاسع"
    ];

    final tens = [
      "",
      "العاشر",
      "العشرون",
      "الثلاثون",
      "الأربعون",
      "الخمسون",
      "الستون",
      "السبعون",
      "الثمانون",
      "التسعون"
    ];

    final teens = [
      "الحادي عشر",
      "الثاني عشر",
      "الثالث عشر",
      "الرابع عشر",
      "الخامس عشر",
      "السادس عشر",
      "السابع عشر",
      "الثامن عشر",
      "التاسع عشر"
    ];

    final hundreds = [
      "",
      "المئة",
      "المئتان",
      "الثلاثمئة",
      "الأربعمئة",
      "الخمسمئة",
      "الستمئة",
      "السبعمئة",
      "الثمانمئة",
      "التسعمئة"
    ];

    if (number <= 9) {
      return units[number];
    }

    if (number == 10) {
      return tens[1];
    }

    if (number > 10 && number < 20) {
      return teens[number - 11];
    }

    if (number < 100) {
      int ten = number ~/ 10;
      int unit = number % 10;

      if (unit == 0) {
        return tens[ten];
      } else {
        return "${units[unit]} و${tens[ten]}";
      }
    }

    // من 100 إلى 999
    int hundred = number ~/ 100;
    int remainder = number % 100;

    String hundredWord = hundreds[hundred];
    if (remainder == 0) {
      return hundredWord;
    }

    return "$hundredWord و${_convertNumberToArabic(remainder)}";
  }
}
