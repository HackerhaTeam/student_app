import 'package:flutter/material.dart';
import 'package:student_hackerha/core/functions/get_responsive_size.dart';
import 'package:student_hackerha/core/widgets/custom_dropdownfield.dart';

class GenderSellector extends StatelessWidget {
  const GenderSellector({
    super.key,
    required this.selectedGender,
    required this.onChanged,
  });

  final String? selectedGender;
  final dynamic Function(String) onChanged;
  @override
  Widget build(BuildContext context) {
    return Center(
      child: SizedBox(
        width: 365.w(context),
        height: 61.h(context),
        child: CustomDropdown(
          label: "الجنس",
          items: ["ذكر", "أنثى"],
          selectedItem: selectedGender,
          onChanged: onChanged,
          type: DropdownType.gender,
        ),
      ),
    );
  }
}
