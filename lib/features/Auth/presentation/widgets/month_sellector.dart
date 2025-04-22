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
  final dynamic Function(String) onChanged;
  @override
  Widget build(BuildContext context) {
    return Center(
      child: SizedBox(
        width: 118.w(context),
        height: 53.h(context),
        child: CustomDropdown(
          label: "الشهر",
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
          selectedItem: selectedMonth,
          onChanged: onChanged,
          type: DropdownType.month,
        ),
      ),
    );
  }
}
