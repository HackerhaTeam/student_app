import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:student_hackerha/core/DI/%20service_locator.dart';
import 'package:student_hackerha/core/Entities/course.dart';
import 'package:student_hackerha/features/courses/presentation/manager/cubit/search_courses/search_courses_cubit.dart';

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
  final Widget? prefixWidget;
  final Widget? suffixWidget;
  final TextEditingController? controller;
  final TextStyle? textStyle;
  final bool autoFocus;
  final TextInputAction? textInputAction;
  final ValueChanged<String>? onChanged;
  final ValueChanged<String>? onSubmitted;
  final FocusNode? focusNode;
  final bool showClearButton;
  final String? initialValue;
  final bool readOnly;
  final int? maxLines;

  const CustomTextField({
    super.key,
    required this.fieldType,
    required this.hint,
    this.radius = 8.0,
    this.prefixIcon,
    this.suffixIcon,
    this.prefixWidget,
    this.suffixWidget,
    this.controller,
    this.textStyle,
    this.autoFocus = false,
    this.textInputAction,
    this.onChanged,
    this.onSubmitted,
    this.focusNode,
    this.showClearButton = false,
    this.initialValue,
    this.readOnly = false,
    this.maxLines = 1,
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
    final effectiveController =
        controller ?? TextEditingController(text: initialValue);
    final effectiveFocusNode = focusNode ?? FocusNode();
    final effectiveStyle = textStyle ?? Theme.of(context).textTheme.bodyMedium;

    return TextFormField(
      controller: effectiveController,
      focusNode: effectiveFocusNode,
      style: effectiveStyle,
      obscureText: fieldType == FieldType.password,
      validator: _validate,
      autofocus: autoFocus,
      textInputAction: textInputAction,
      readOnly: readOnly,
      maxLines: maxLines,
      onChanged: (value) {
        if (onChanged != null) {
          onChanged!(value);
        }

        if (fieldType == FieldType.search) {
          final courses = locator.get<List<Course>>(instanceName: 'courses');
          BlocProvider.of<SearchCoursesCubit>(context)
              .searchCourses(value, courses);
        }
      },
      onFieldSubmitted: onSubmitted,
      decoration: InputDecoration(
        hintText: hint,
        prefixIcon:
            prefixWidget ?? (prefixIcon != null ? Icon(prefixIcon) : null),
        suffixIcon: _buildSuffixIcon(effectiveController),
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(radius),
        ),
        contentPadding:
            const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
      ),
    );
  }

  Widget? _buildSuffixIcon(TextEditingController controller) {
    if (suffixWidget != null) return suffixWidget;
    if (suffixIcon != null) return Icon(suffixIcon);
    if (showClearButton && controller.text.isNotEmpty) {
      return IconButton(
        icon: const Icon(Icons.clear),
        onPressed: () {
          controller.clear();
          if (onChanged != null) {
            onChanged!('');
          }
        },
      );
    }
    return null;
  }
}
