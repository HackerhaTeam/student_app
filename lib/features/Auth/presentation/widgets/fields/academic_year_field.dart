import 'package:flutter/material.dart';
import 'package:student_hackerha/core/functions/get_responsive_size.dart';
import 'package:student_hackerha/core/widgets/custom_text_field.dart';

class AcademicYearField extends StatelessWidget {
  const AcademicYearField({
    super.key,
    required this.numberController,
    required this.numUnyKey,
    required this.numUnySubmitted,
    this.focusNode,
  });

  final TextEditingController numberController;
  final GlobalKey<FormState> numUnyKey;
  final bool numUnySubmitted;
  final FocusNode? focusNode;
  @override
  Widget build(BuildContext context) {
    return Form(
      key: numUnyKey,
      autovalidateMode: numUnySubmitted
          ? AutovalidateMode.onUserInteraction
          : AutovalidateMode.disabled,
      child: SizedBox(
        height: 56,
        child: Center(
          child: CustomTextField(
            focusNode: focusNode,
            keyboardType: TextInputType.number,
            fieldType: FieldType.academicYear,
            label: "الرقم الجامعي",
            radius: 8.r(context),
            controller: numberController,
          ),
        ),
      ),
    );
  }
}
