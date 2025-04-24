import 'package:flutter/material.dart';
import 'package:student_hackerha/core/functions/get_responsive_size.dart';
import 'package:student_hackerha/core/widgets/Custom_DropdownField.dart';

class AcademicYearSellector extends StatelessWidget {
  const AcademicYearSellector({
    super.key,
    required this.selectedYear,
    required this.onChanged,
  });

  final String? selectedYear;
  final dynamic Function(String) onChanged;
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 59.h(context),
      child: Center(
        child: CustomDropdown(
          label: "السنة الدراسية",
          items: ["الأولى", "الثانية", "الثالثة", "الرابعة", "الخامسة"],
          selectedItem: selectedYear,
          type: DropdownType.academicYear,
          onChanged: onChanged,
        ),
      ),
    );
  }
}
