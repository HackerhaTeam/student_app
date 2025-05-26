import 'package:flutter/material.dart';
import 'package:student_hackerha/core/functions/get_responsive_size.dart';
import 'package:student_hackerha/core/widgets/custom_text_field.dart';

class EmailField extends StatelessWidget {
  const EmailField({
    super.key,
    required this.emailKey,
    required this.emailSubmitted,
    required this.passwordFocusNode,
    required this.emailFocusNode,
    required this.emailController,
  });

  final GlobalKey<FormState> emailKey;
  final bool emailSubmitted;
  final FocusNode passwordFocusNode;
  final FocusNode emailFocusNode;
  final TextEditingController emailController;

  @override
  Widget build(BuildContext context) {
    return Form(
      key: emailKey,
      autovalidateMode: emailSubmitted
          ? AutovalidateMode.onUserInteraction
          : AutovalidateMode.disabled,
      child: Center(
        child: CustomTextField(
          onFieldSubmitted: (_) => passwordFocusNode.requestFocus(),
          focusNode: emailFocusNode,
          keyboardType: TextInputType.emailAddress,
          fieldType: FieldType.email,
          label: "البريد الإلكتروني",
          radius: 8.r(context),
          controller: emailController,
        ),
      ),
    );
  }
}
