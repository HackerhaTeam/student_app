import 'package:flutter/material.dart';
import 'package:student_hackerha/core/functions/get_responsive_size.dart';
import 'package:student_hackerha/core/widgets/text_field/custom_text_field.dart';
import 'package:student_hackerha/core/widgets/text_field/field_validators.dart';

class YearField extends StatelessWidget {
  const YearField({
    super.key,
    required this.yearController,
    this.onChanged,
    this.focusNode,
    required this.yearKey,
    required this.yearSubmitted,
  });

  final TextEditingController yearController;
  final void Function(String)? onChanged;
  final FocusNode? focusNode;
  final GlobalKey<FormState> yearKey;
  final bool yearSubmitted;
  @override
  Widget build(BuildContext context) {
    return Form(
      key: yearKey,
      autovalidateMode: yearSubmitted
          ? AutovalidateMode.onUserInteraction
          : AutovalidateMode.disabled,
      child: SizedBox(
        width: 115.w(context),
        // height: 59,
        child: Center(
          child: CustomTextField(
            focusNode: focusNode,
            onChanged: onChanged,
            keyboardType: TextInputType.number,
            fieldType: FieldType.year,
            label: "السنة",
            radius: 8.r(context),
            controller: yearController,
          ),
        ),
      ),
    );
  }
}
