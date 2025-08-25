import 'package:flutter/material.dart';
import 'package:student_hackerha/core/functions/get_responsive_size.dart';
import 'package:student_hackerha/core/widgets/text_field/custom_text_field.dart';
import 'package:student_hackerha/core/widgets/text_field/field_validators.dart';

class PasswordField extends StatelessWidget {
  const PasswordField({
    super.key,
    required this.passwordKey,
    required this.passwordSubmitted,
    required this.passwordFocusNode,
    required this.passwordController,
  });

  final GlobalKey<FormState> passwordKey;
  final bool passwordSubmitted;
  final FocusNode passwordFocusNode;
  final TextEditingController passwordController;

  @override
  Widget build(BuildContext context) {
    return Form(
      key: passwordKey,
      autovalidateMode: passwordSubmitted
          ? AutovalidateMode.onUserInteraction
          : AutovalidateMode.disabled,
      child: Center(
        child: CustomTextField(
          focusNode: passwordFocusNode,
          keyboardType: TextInputType.text,
          fieldType: FieldType.password,
          label: "كلمة المرور",
          radius: 8.r(context),
          controller: passwordController,
        ),
      ),
    );
  }
}
