import 'package:flutter/material.dart';
import 'package:student_hackerha/core/functions/get_responsive_size.dart';
import 'package:student_hackerha/core/widgets/custom_dropdownfield.dart';

class GenderSellector extends StatelessWidget {
  const GenderSellector({
    super.key,
    required this.selectedGender,
    required this.onChanged,
    required this.genderKey,
    required this.genderSubmitted,
  });

  final String? selectedGender;
  final dynamic Function(String?) onChanged;
  final GlobalKey<FormState> genderKey;
  final bool genderSubmitted;
  @override
  Widget build(BuildContext context) {
    return Form(
      key: genderKey,
      autovalidateMode: genderSubmitted
          ? AutovalidateMode.onUserInteraction
          : AutovalidateMode.disabled,
      child: Center(
        child: SizedBox(
          width: 365.w(context),
          height: 61,
          child: CustomDropdown(
            label: "الجنس",
            items: ["ذكر", "أنثى"],
            selectedValue: selectedGender,
            onChanged: onChanged,
            type: DropdownType.gender,
          ),
        ),
      ),
    );
  }
}
