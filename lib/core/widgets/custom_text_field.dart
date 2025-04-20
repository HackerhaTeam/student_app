import 'package:flutter/material.dart';
import 'package:student_hackerha/core/themes/extentions/app_backgrounds.dart';
import 'package:student_hackerha/core/themes/extentions/app_borders.dart';
import 'package:student_hackerha/core/themes/typoGraphy/app_text_styles.dart';

enum FieldType {
  email,
  password,
  search,
  name,
  phoneNumber,
}

class CustomTextField extends StatelessWidget {
  final FieldType fieldType;
  final String? label;
  final String? hint;
  final double radius;
  final Widget? prefix;
  final Widget? suffix;
  final TextInputType? keyboardType;
  final TextEditingController controller;
  final double? width;
  final double? height;
  final EdgeInsetsGeometry? contentPadding;
  final bool obscureOverride;

  const CustomTextField({
    super.key,
    required this.fieldType,
    this.label,
    this.hint,
    required this.radius,
    this.prefix,
    this.suffix,
    required this.controller,
    this.width,
    this.height,
    this.contentPadding,
    this.obscureOverride = false,
    this.keyboardType,
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

      case FieldType.name:
        if (value == null || value.trim().isEmpty) return 'الاسم مطلوب';
        if (value.length < 2) return 'الاسم يجب أن يكون على الأقل حرفين';
        final nameRegex = RegExp(r'^[\u0600-\u06FFa-zA-Z\s]+$');
        if (!nameRegex.hasMatch(value)) {
          return 'الاسم يحتوي على رموز غير مسموحة';
        }
        break;

      case FieldType.phoneNumber:
        if (value == null || value.trim().isEmpty) return 'رقم الهاتف مطلوب';
        final phoneRegex = RegExp(r'^9\d{8}$');

        if (!phoneRegex.hasMatch(value)) {
          return 'رقم الهاتف غير صحيح. مثال: 9XXXXXXXX';
        }
        break;
    }
    return null;
  }

  @override
  Widget build(BuildContext context) {
    final backgrounds = Theme.of(context).extension<AppBackgrounds>()!;
    final border = Theme.of(context).extension<AppBorders>()!;
    final styles = Theme.of(context).textTheme;

    return SizedBox(
      width: width,
      height: height,
      child: TextFormField(
        expands: false,
        textAlign: fieldType == FieldType.phoneNumber
            ? TextAlign.left
            : TextAlign.right,
        textDirection: fieldType == FieldType.phoneNumber
            ? TextDirection.ltr
            : TextDirection.rtl,
        keyboardType: keyboardType,
        cursorColor: backgrounds.primaryBrand,
        controller: controller,
        validator: _validate,
        obscureText: fieldType == FieldType.password || obscureOverride,
        style: styles.bodyLarge,
        decoration: InputDecoration(
          errorStyle: TextStyle(
            fontSize: 12,
            color: Colors.red,
            height: 0.5, // ارتفاع طبيعي للخطأ بدون يأثر على ارتفاع الحقل
          ),
          contentPadding: contentPadding ??
              const EdgeInsets.symmetric(horizontal: 12, vertical: 16),
          labelText: label,
          labelStyle: styles.xLabelSmall,
          hintText: hint,
          hintTextDirection: TextDirection.rtl,
          hintStyle: styles.xParagraphLargeNormal,
          prefixIcon: prefix,
          suffixIcon: suffix,
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(radius),
            borderSide: BorderSide(color: backgrounds.primaryBrand),
          ),
          enabledBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(radius),
            borderSide: BorderSide(color: border.secondary),
          ),
          focusedBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(radius),
            borderSide: BorderSide(color: backgrounds.primaryBrand, width: 2),
          ),
        ),
      ),
    );
  }
}
