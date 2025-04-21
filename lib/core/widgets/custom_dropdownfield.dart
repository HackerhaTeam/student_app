import 'package:flutter/material.dart';
import 'package:student_hackerha/core/themes/extentions/app_backgrounds.dart';
import 'package:student_hackerha/core/themes/extentions/app_content.dart';
import 'package:student_hackerha/core/themes/typoGraphy/app_text_styles.dart';

enum DropdownType {
  university,
  academicYear,
  month,
  gender,
}

class CustomDropdownField extends StatelessWidget {
  final DropdownType type;
  final String? label;
  final double radius;
  final String? value;
  final void Function(String?)? onChanged;
  final List<String> items;
  final double? width;
  final double? height;

  const CustomDropdownField({
    super.key,
    required this.type,
    this.label,
    required this.radius,
    required this.value,
    required this.onChanged,
    required this.items,
    this.width,
    this.height,
  });

  String? _validate(String? value) {
    if (value == null || value.isEmpty) {
      switch (type) {
        case DropdownType.university:
          return 'يرجى اختيار الجامعة';
        case DropdownType.academicYear:
          return 'يرجى اختيار السنة الدراسية';
        case DropdownType.month:
          return 'يرجى اختيار الشهر';
        case DropdownType.gender:
          return 'يرجى اختيار الجنس';
      }
    }
    return null;
  }

  @override
  Widget build(BuildContext context) {
    final backgrounds = Theme.of(context).extension<AppBackgrounds>()!;

    final content = Theme.of(context).extension<AppContent>()!;
    final styles = Theme.of(context).textTheme;

    return SizedBox(
      width: width,
      height: height,
      child: DropdownButtonFormField<String>(
        value: value,
        isExpanded: true,
        validator: _validate,
        icon: const Icon(Icons.arrow_drop_down, color: Colors.black),
        decoration: InputDecoration(
          errorStyle: TextStyle(
            fontSize: 12,
            color: Colors.red,
            height: 0.06,
          ),
          labelText: label,
          floatingLabelBehavior: FloatingLabelBehavior.auto,
          // alignLabelWithHint: true,
          labelStyle: styles.xLabelSmall.copyWith(
            color: content.primary,
            fontSize: 14,
          ),
          contentPadding:
              const EdgeInsets.symmetric(horizontal: 16, vertical: 18),
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(radius),
            borderSide: BorderSide(color: backgrounds.primaryBrand),
          ),
          enabledBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(radius),
            borderSide: BorderSide(color: backgrounds.primaryBrand),
          ),
          focusedBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(radius),
            borderSide: BorderSide(color: backgrounds.primaryBrand, width: 2),
          ),
          errorBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(radius),
            borderSide: const BorderSide(color: Colors.red),
          ),
          focusedErrorBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(radius),
            borderSide: const BorderSide(color: Colors.red, width: 2),
          ),
        ),
        dropdownColor: backgrounds.onSurfacePrimary,
        style: styles.xParagraphLargeNormal.copyWith(color: content.primary),
        onChanged: onChanged,
        items: items.map((item) {
          return DropdownMenuItem<String>(
            value: item,
            child: Text(
              item,
              textDirection: TextDirection.rtl,
              style: styles.xParagraphLargeNormal,
            ),
          );
        }).toList(),
      ),
    );
  }
}
