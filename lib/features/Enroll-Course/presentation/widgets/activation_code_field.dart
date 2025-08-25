// ignore_for_file: use_build_context_synchronously

import 'package:flutter/material.dart';
import 'package:phosphor_flutter/phosphor_flutter.dart';
import 'package:student_hackerha/core/functions/get_responsive_size.dart';
import 'package:student_hackerha/core/themes/extentions/app_borders.dart';
import 'package:student_hackerha/core/widgets/text_field/custom_text_field.dart';
import 'package:student_hackerha/core/widgets/text_field/field_validators.dart';

class ActivationCodeField extends StatelessWidget {
  const ActivationCodeField({
    super.key,
    required this.codeFocusNode,
    required this.border,
    required this.numberController,
    required this.activeKey,
    required this.activeSubmitted,
  });

  final FocusNode codeFocusNode;
  final AppBorders border;
  final TextEditingController numberController;
  final GlobalKey<FormState> activeKey;
  final bool activeSubmitted;
  @override
  Widget build(BuildContext context) {
    return Center(
      child: Form(
        key: activeKey,
        autovalidateMode: activeSubmitted
            ? AutovalidateMode.onUserInteraction
            : AutovalidateMode.disabled,
        child: CustomTextField(
          focusNode: codeFocusNode,
          fieldType: FieldType.activationCode,
          keyboardType: TextInputType.text,
          label: "كود التفعيل",
          hint: "XX XXX XXX",
          suffix: Padding(
            padding: EdgeInsets.only(left: 0.w(context)),
            child: SizedBox(
              width: 50.w(context),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  Container(
                    width: 1,
                    height: 24.h(context),
                    color: border.secondary,
                  ),
                  Padding(
                    padding: EdgeInsets.only(
                        left: 16.w(context), right: 6.w(context)),
                    child: PhosphorIcon(
                      PhosphorIcons.numpad(),
                      size: 24.w(context),
                    ),
                  )
                ],
              ),
            ),
          ),
          radius: 8.r(context),
          controller: numberController,
          width: 372,
          // height: 57,
        ),
      ),
    );
  }
}
