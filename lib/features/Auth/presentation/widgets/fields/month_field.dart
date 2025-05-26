import 'package:flutter/material.dart';
import 'package:student_hackerha/core/functions/get_responsive_size.dart';
import 'package:student_hackerha/core/widgets/custom_text_field.dart';

class MonthField extends StatelessWidget {
  const MonthField({
    super.key,
    required this.monthController,
    this.focusNode,
    this.onChanged,
    this.onSubmitted,
    required this.monthKey,
    required this.monthSubmitted,
  });

  final TextEditingController monthController;
  final FocusNode? focusNode;
  final void Function(String)? onChanged;
  final void Function(String)? onSubmitted;
  final GlobalKey<FormState> monthKey;
  final bool monthSubmitted;
  @override
  Widget build(BuildContext context) {
    return Form(
      key: monthKey,
      autovalidateMode: monthSubmitted
          ? AutovalidateMode.onUserInteraction
          : AutovalidateMode.disabled,
      child: SizedBox(
        width: 115.w(context),
        height: 59,
        child: Center(
          child: CustomTextField(
            onFieldSubmitted: onSubmitted,
            onChanged: onChanged,
            focusNode: focusNode,
            keyboardType: TextInputType.number,
            fieldType: FieldType.month,
            label: "الشهر",
            radius: 8.r(context),
            controller: monthController,
          ),
        ),
      ),
    );
  }
}
