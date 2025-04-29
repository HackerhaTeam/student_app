import 'package:flutter/material.dart';
import 'package:student_hackerha/core/functions/get_responsive_size.dart';
import 'package:student_hackerha/core/widgets/custom_dropdownfield.dart';

class UniversitySellector extends StatelessWidget {
  const UniversitySellector({
    super.key,
    required this.selectedUniversity,
    required this.onChanged,
  });

  final String? selectedUniversity;
  final dynamic Function(String) onChanged;
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 59.h(context),
      child: Center(
        child: CustomDropdown(
          label: "الجامعة",
          items: ['جامعة حلب', 'جامعة قرطبة', 'جامعة إيبلا', 'جامعة الشهباء'],
          selectedItem: selectedUniversity,
          type: DropdownType.university,
          onChanged: onChanged,
        ),
      ),
    );
  }
}
