import 'package:flutter/material.dart';
import 'package:pin_code_fields/pin_code_fields.dart';
import 'package:student_hackerha/core/functions/get_responsive_size.dart';

class OTPInput extends StatelessWidget {
  final void Function(String)? onCompleted;
  final Color borderColor;
  final Color focusedBorderColor;
  final TextEditingController controller;
  final FocusNode? focusNode;
  const OTPInput({
    super.key,
    required this.controller,
    this.onCompleted,
    this.borderColor = Colors.grey,
    this.focusedBorderColor = Colors.blue,
    this.focusNode,
  });

  @override
  Widget build(BuildContext context) {
    return PinCodeTextField(
      focusNode: focusNode,
      appContext: context,
      length: 5,
      controller: controller,
      textStyle: const TextStyle(fontSize: 18),
      obscureText: false,
      animationType: AnimationType.fade,
      keyboardType: TextInputType.number,
      enableActiveFill: false,
      pinTheme: PinTheme(
        shape: PinCodeFieldShape.box,
        borderRadius: BorderRadius.circular(12),
        fieldHeight: 68.h(context),
        fieldWidth: 68.w(context),
        activeColor: focusedBorderColor,
        selectedColor: focusedBorderColor,
        inactiveColor: borderColor,
        activeFillColor: Colors.transparent,
        selectedFillColor: Colors.transparent,
        inactiveFillColor: Colors.transparent,
      ),
      onCompleted: onCompleted,
      onChanged: (_) {},
    );
  }
}
