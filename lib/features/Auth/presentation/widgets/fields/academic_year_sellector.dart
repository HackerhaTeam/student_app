import 'package:flutter/material.dart';
import 'package:student_hackerha/core/functions/get_responsive_size.dart';
import 'package:student_hackerha/core/widgets/custom_dropdownfield.dart';

class AcademicYearSellector extends StatelessWidget {
  const AcademicYearSellector({
    super.key,
    required this.selectedYear,
    required this.onChanged,
    required this.yearUnyKey,
    required this.yearUnySubmitted,
  });

  final String? selectedYear;
  final dynamic Function(String?) onChanged;
  final GlobalKey<FormState> yearUnyKey;
  final bool yearUnySubmitted;
  @override
  Widget build(BuildContext context) {
    return Form(
      key: yearUnyKey,
      autovalidateMode: yearUnySubmitted
          ? AutovalidateMode.onUserInteraction
          : AutovalidateMode.disabled,
      child: SizedBox(
        width: 372.w(context),
        height: 59,
        child: CustomDropdown(
          width: 372.w(context),
          height: 59,
          label: "السنة الدراسية",
          items: ["الأولى", "الثانية", "الثالثة", "الرابعة", "الخامسة"],
          selectedValue: selectedYear,
          onChanged: onChanged,
          type: DropdownType.academicYear,
        ),
      ),
    );
  }
}
