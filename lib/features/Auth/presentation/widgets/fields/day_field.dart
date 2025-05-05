import 'package:flutter/material.dart';
import 'package:student_hackerha/core/functions/get_responsive_size.dart';
import 'package:student_hackerha/core/widgets/custom_text_field.dart';

class DayField extends StatelessWidget {
  const DayField({
    super.key,
    required this.dayController,
    required this.focusNode,
  });

  final TextEditingController dayController;
  final FocusNode focusNode;
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 115.w(context),
      height: 59,
      child: Center(
        child: CustomTextField(
          focusNode: focusNode,
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
