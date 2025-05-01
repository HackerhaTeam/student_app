// ignore_for_file: use_build_context_synchronously

import 'package:flutter/material.dart';
import 'package:student_hackerha/core/constants/assets_image.dart';
import 'package:student_hackerha/core/functions/navigation.dart';
import 'package:student_hackerha/core/widgets/custom_success_dialog.dart';
import 'package:student_hackerha/features/Auth/presentation/widgets/buttons/floating_next_button.dart';

class FloatNextButtonWithDialog extends StatelessWidget {
  const FloatNextButtonWithDialog({
    super.key,
    required this.formKey,
    required this.title,
    required this.subtitle,
    required this.nextPage,
    this.buttonText,
    this.width,
  });

  final GlobalKey<FormState> formKey;
  final String title;
  final String subtitle;
  final Widget nextPage;
  final String? buttonText;
  final double? width;
  @override
  Widget build(BuildContext context) {
    return FloatingNextButton(
      width: width,
      buttonText: buttonText,
      formKey: formKey,
      onNext: () async {
        if (formKey.currentState!.validate()) {
          showDialog(
            context: context,
            barrierDismissible: false,
            builder: (context) => CustomSuccessDialog(
              svgAssetPath: AppImages.successImage,
              title: title,
              subtitle: subtitle,
            ),
          );
          await Future.delayed(
            const Duration(seconds: 3),
          );

          Navigator.of(context).pop();
          context.navigateWithSlideTransition(nextPage);
        }
      },
    );
  }
}
