// core/validation/field_validator.dart
enum FieldType {
  email,
  password,
  search,
  name,
  phoneNumber,
  academicYear,
  day,
  month,
  year,
  activationCode
}

String? validateField(FieldType type, String? value) {
  final unsafeRegex = RegExp(
    r'''[<>;"'`]|--|\bor\b|\band\b''',
    caseSensitive: false,
  );

  if (value != null && value.isNotEmpty && type != FieldType.email) {
    if (unsafeRegex.hasMatch(value)) {
      return "النص يحتوي على رموز غير مسموحة";
    }
  }

  switch (type) {
    case FieldType.email:
      if (value == null || value.isEmpty) return 'البريد الإلكتروني مطلوب';
      final emailRegex = RegExp(r'^[\w\.-]+@([\w-]+\.)+[\w-]{2,}$');
      if (!emailRegex.hasMatch(value)) {
        return 'صيغة البريد الإلكتروني غير صحيحة';
      }
      break;

    case FieldType.password:
      if (value == null || value.isEmpty) return 'كلمة المرور مطلوبة';
      if (value.length < 6) return 'كلمة المرور يجب أن تكون 6 أحرف على الأقل';
      break;

    case FieldType.search:
      if (value == null || value.isEmpty) return 'يرجى كتابة كلمة للبحث';
      break;

    case FieldType.name:
      if (value == null || value.trim().isEmpty) return 'الاسم مطلوب';
      if (value.trim().length < 2) return 'الاسم يجب أن يكون على الأقل حرفين';
      final nameRegex = RegExp(r'^[\u0600-\u06FFa-zA-Z\s]+$');
      if (!nameRegex.hasMatch(value.trim())) {
        return 'الاسم يحتوي على رموز غير مسموحة';
      }
      break;

    case FieldType.phoneNumber:
      if (value == null || value.trim().isEmpty) return 'رقم الهاتف مطلوب';
      final phoneRegex = RegExp(r'^9\d{8}$');
      if (!phoneRegex.hasMatch(value.trim())) {
        return 'رقم الهاتف غير صحيح. مثال: 9XXXXXXXX';
      }
      break;

    case FieldType.academicYear:
      if (value == null || value.trim().isEmpty) return "الرقم الجامعي مطلوب";
      break;

    case FieldType.day:
      if (value == null || value.trim().isEmpty) return "أدخل اليوم";
      final day = int.tryParse(value.trim());
      if (day == null || day <= 0 || day > 31) return "قيمة خاطئة";
      break;

    case FieldType.month:
      if (value == null || value.trim().isEmpty) return "أدخل الشهر";
      final month = int.tryParse(value.trim());
      if (month == null || month <= 0 || month > 12) return "قيمة خاطئة";
      break;

    case FieldType.year:
      if (value == null || value.trim().isEmpty) return "أدخل السنة";
      final year = int.tryParse(value.trim());
      if (year == null || year < 1900 || year > DateTime.now().year) {
        return "قيمة خاطئة";
      }
      break;

    case FieldType.activationCode:
      final codeRegex = RegExp(r'^[a-zA-Z0-9]+$');

      if (value == null || value.isEmpty) {
        return "الرجاء إدخال رمز التفعيل.";
      }

      if (!codeRegex.hasMatch(value)) {
        return "رمز غير صالح،يجب أن يحوي فقط أحرف وأرقام إنكليزية.";
      }

      return null;
  }

  return null;
}
