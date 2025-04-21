import 'package:flutter/material.dart';
import 'package:student_hackerha/core/functions/get_responsive_size.dart';
import 'package:student_hackerha/core/widgets/custom_text_field.dart';

class DayField extends StatelessWidget {
  const DayField({
    super.key,
    required this.dayController,
  });

  final TextEditingController dayController;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 115.w(context),
      height: 67.h(context),
      child: Center(
        child: CustomTextField(
          keyboardType: TextInputType.number,
          fieldType: FieldType.day,
          label: "اليوم",
          radius: 8.r(context),
          controller: dayController,
        ),
      ),
    );
  }
}
