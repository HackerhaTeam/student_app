import 'package:flutter/material.dart';
import 'package:student_hackerha/core/functions/get_responsive_size.dart';
import 'package:student_hackerha/core/widgets/custom_text_field.dart';

class AcademicYearField extends StatelessWidget {
  const AcademicYearField({
    super.key,
    required this.numberController,
  });

  final TextEditingController numberController;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 56.h(context),
      child: Center(
        child: CustomTextField(
          keyboardType: TextInputType.number,
          fieldType: FieldType.academicYear,
          label: "الرقم الجامعي",
          radius: 8.r(context),
          controller: numberController,
        ),
      ),
    );
  }
}
