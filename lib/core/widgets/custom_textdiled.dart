import 'package:flutter/material.dart';

enum FieldType {
  email,
  password,
  search,
}

class CustomTextField extends StatelessWidget {
  final FieldType fieldType;
  final String hint;
  final double radius;
  final IconData? prefixIcon;
  final IconData? suffixIcon;
  final TextEditingController controller;
  final TextStyle textStyle;

  const CustomTextField({
    super.key,
    required this.fieldType,
    required this.hint,
    required this.radius,
    this.prefixIcon,
    this.suffixIcon,
    required this.controller,
    required this.textStyle,
  });

  String? _validate(String? value) {
    switch (fieldType) {
      case FieldType.email:
        if (value == null || value.isEmpty) return 'البريد الإلكتروني مطلوب';
        final emailRegex = RegExp(r'^[\w-\.]+@([\w-]+\.)+[\w-]{2,4}$');
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
    }
    return null;
  }

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      style: textStyle,
      textDirection: TextDirection.rtl,
      controller: controller,
      obscureText: fieldType == FieldType.password,
      validator: _validate,
      decoration: InputDecoration(
        hintTextDirection: TextDirection.rtl,
        hintText: hint,
        prefixIcon: prefixIcon != null ? Icon(prefixIcon) : null,
        suffixIcon: suffixIcon != null ? Icon(suffixIcon) : null,
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(radius),
        ),
      ),
    );
  }
}
