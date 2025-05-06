import 'package:flutter/material.dart';
import 'package:student_hackerha/core/functions/get_responsive_size.dart';
import 'package:student_hackerha/core/widgets/custom_text_field.dart';

class YearField extends StatelessWidget {
  const YearField({
    super.key,
    required this.yearController,
    this.onChanged,
  });

  final TextEditingController yearController;
  final void Function(String)? onChanged;
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 115.w(context),
      height: 59,
      child: Center(
        child: CustomTextField(
          onChanged: onChanged,
          keyboardType: TextInputType.number,
          fieldType: FieldType.year,
          label: "السنة",
          radius: 8.r(context),
          controller: yearController,
        ),
      ),
    );
  }
}
