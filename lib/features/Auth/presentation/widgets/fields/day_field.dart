import 'package:flutter/material.dart';
import 'package:student_hackerha/core/functions/get_responsive_size.dart';
import 'package:student_hackerha/core/widgets/text_field/custom_text_field.dart';
import 'package:student_hackerha/core/widgets/text_field/field_validators.dart';

class DayField extends StatelessWidget {
  const DayField({
    super.key,
    required this.dayController,
    required this.focusNode,
    this.onChanged,
    this.onSubmitted,
    required this.dayKey,
    required this.daySubmitted,
  });

  final TextEditingController dayController;
  final FocusNode focusNode;
  final void Function(String)? onChanged;
  final void Function(String)? onSubmitted;
  final GlobalKey<FormState> dayKey;
  final bool daySubmitted;
  @override
  Widget build(BuildContext context) {
    return Form(
      key: dayKey,
      autovalidateMode: daySubmitted
          ? AutovalidateMode.onUserInteraction
          : AutovalidateMode.disabled,
      child: SizedBox(
        width: 115.w(context),
        // height: 59,
        child: Center(
          child: CustomTextField(
            onFieldSubmitted: onSubmitted,
            onChanged: onChanged,
            focusNode: focusNode,
            keyboardType: TextInputType.number,
            fieldType: FieldType.day,
            label: "اليوم",
            radius: 8.r(context),
            controller: dayController,
          ),
        ),
      ),
    );
  }
}
