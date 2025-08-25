import 'package:flutter/material.dart';
import 'package:student_hackerha/core/themes/extentions/app_backgrounds.dart';
import 'package:student_hackerha/core/themes/extentions/app_borders.dart';
import 'package:student_hackerha/core/themes/extentions/app_content.dart';
import 'package:student_hackerha/core/themes/typoGraphy/app_text_styles.dart';
import 'package:phosphor_flutter/phosphor_flutter.dart';
import 'package:student_hackerha/core/widgets/text_field/field_validators.dart';

class CustomTextField extends StatefulWidget {
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
  final FocusNode? focusNode;
  final String? Function(String?)? customValidator;
  final void Function(String)? onFieldSubmitted;
  final void Function(String)? onChanged;

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
    this.focusNode,
    this.customValidator,
    this.onFieldSubmitted,
    this.onChanged,
  });

  @override
  State<CustomTextField> createState() => _CustomTextFieldState();
}

class _CustomTextFieldState extends State<CustomTextField> {
  late bool _obscureText;

  @override
  void initState() {
    super.initState();
    _obscureText =
        widget.fieldType == FieldType.password || widget.obscureOverride;
  }

  @override
  Widget build(BuildContext context) {
    final backgrounds = Theme.of(context).extension<AppBackgrounds>()!;
    final border = Theme.of(context).extension<AppBorders>()!;
    final content = Theme.of(context).extension<AppContent>()!;
    final styles = context;

    return SizedBox(
      width: widget.width,
      height: widget.height,
      child: TextFormField(
        // autovalidateMode: AutovalidateMode.onUserInteraction,
        onChanged: widget.onChanged,
        onFieldSubmitted: widget.onFieldSubmitted,
        focusNode: widget.focusNode,
        expands: false,
        textAlign: widget.fieldType == FieldType.phoneNumber ||
                widget.fieldType == FieldType.email ||
                widget.fieldType == FieldType.activationCode
            ? TextAlign.left
            : TextAlign.right,
        textDirection: widget.fieldType == FieldType.phoneNumber ||
                widget.fieldType == FieldType.email ||
                widget.fieldType == FieldType.activationCode
            ? TextDirection.ltr
            : TextDirection.rtl,
        keyboardType: widget.keyboardType,
        cursorColor: backgrounds.primaryBrand,
        controller: widget.controller,
        validator: widget.customValidator ??
            (value) => validateField(widget.fieldType, value),
        obscureText: widget.fieldType == FieldType.password
            ? _obscureText
            : widget.obscureOverride,
        style: styles.xLabelLarge,
        decoration: InputDecoration(
          isDense: true,
          helperText: '',
          helperStyle: TextStyle(height: 0.5, fontSize: 12),
          errorStyle: const TextStyle(
            fontSize: 12,
            color: Colors.red,
            height: 0.5,
          ),
          contentPadding: widget.contentPadding ??
              const EdgeInsets.symmetric(horizontal: 16, vertical: 16),
          labelText: widget.label,
          labelStyle: styles.xLabelSmall,
          hintText: widget.hint,
          hintTextDirection: TextDirection.rtl,
          hintStyle: styles.xParagraphLargeNormal,
          prefixIcon: widget.prefix,
          suffixIcon: widget.fieldType == FieldType.password
              ? IconButton(
                  icon: Icon(
                    _obscureText
                        ? PhosphorIcons.eyeSlash()
                        : PhosphorIcons.eye(),
                    color: content.primary,
                  ),
                  onPressed: () {
                    setState(() {
                      _obscureText = !_obscureText;
                    });
                  },
                )
              : widget.suffix,
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(widget.radius),
            borderSide: BorderSide(color: backgrounds.primaryBrand),
          ),
          enabledBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(widget.radius),
            borderSide: BorderSide(color: border.secondary),
          ),
          focusedBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(widget.radius),
            borderSide: BorderSide(color: backgrounds.primaryBrand, width: 2),
          ),
        ),
      ),
    );
  }
}
