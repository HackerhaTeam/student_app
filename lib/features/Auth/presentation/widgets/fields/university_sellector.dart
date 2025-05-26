import 'package:flutter/material.dart';
import 'package:student_hackerha/core/functions/get_responsive_size.dart';
import 'package:student_hackerha/core/widgets/custom_dropdownfield.dart';

class UniversitySellector extends StatelessWidget {
  const UniversitySellector({
    super.key,
    required this.selectedUniversity,
    required this.onChanged,
    required this.unyKey,
    required this.unySubmitted,
  });

  final String? selectedUniversity;
  final dynamic Function(String?) onChanged;
  final GlobalKey<FormState> unyKey;
  final bool unySubmitted;
  @override
  Widget build(BuildContext context) {
    return Form(
      key: unyKey,
      autovalidateMode: unySubmitted
          ? AutovalidateMode.onUserInteraction
          : AutovalidateMode.disabled,
      child: SizedBox(
        width: 372.w(context),
        height: 59,
        child: CustomDropdown(
          width: 372.w(context),
          height: 59,
          label: "الجامعة",
          items: ['جامعة حلب', 'جامعة قرطبة', 'جامعة إيبلا', 'جامعة الشهباء'],
          selectedValue: selectedUniversity,
          onChanged: onChanged,
          type: DropdownType.university,
        ),
      ),
    );
  }
}
