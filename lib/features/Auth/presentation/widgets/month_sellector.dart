import 'package:flutter/material.dart';
import 'package:student_hackerha/core/functions/get_responsive_size.dart';
import 'package:student_hackerha/core/widgets/custom_dropdownfield.dart';

class MonthSellector extends StatelessWidget {
  const MonthSellector({
    super.key,
    required this.selectedMonth,
    required this.onChanged,
  });

  final String? selectedMonth;
  final void Function(String?)? onChanged;
  @override
  Widget build(BuildContext context) {
    return Center(
      child: SizedBox(
        width: 118.w(context),
        height: 53.h(context),
        child: CustomDropdownField(
          type: DropdownType.month,
          label: "الشهر",
          radius: 8,
          value: selectedMonth,
          items: [
            "1",
            "2",
            "3",
            "4",
            "5",
            "6",
            "7",
            "8",
            "9",
            "10",
            "11",
            "12"
          ],
          onChanged: onChanged,
        ),
      ),
    );
  }
}
