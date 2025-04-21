import 'package:flutter/material.dart';
import 'package:pin_code_fields/pin_code_fields.dart';

class OTPInput extends StatelessWidget {
  final void Function(String)? onCompleted;
  final Color borderColor;
  final Color focusedBorderColor;
  final TextEditingController controller;

  const OTPInput({
    super.key,
    required this.controller,
    this.onCompleted,
    this.borderColor = Colors.grey,
    this.focusedBorderColor = Colors.blue,
  });

  @override
  Widget build(BuildContext context) {
    return PinCodeTextField(
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
        fieldHeight: 55,
        fieldWidth: 50,
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
