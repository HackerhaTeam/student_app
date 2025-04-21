import 'package:flutter/material.dart';
import 'package:student_hackerha/core/functions/get_responsive_size.dart';
import 'package:student_hackerha/core/themes/extentions/app_backgrounds.dart';
import 'package:student_hackerha/core/themes/extentions/app_borders.dart';
import 'package:student_hackerha/features/quiz/presentation/widgets/quiz/option/option_box_item.dart';

class OptionBox extends StatelessWidget {
  const OptionBox({
    super.key,
    required this.isSelected,
  });

  final bool isSelected;
  @override
  Widget build(BuildContext context) {
    final backgroundColor = Theme.of(context).extension<AppBackgrounds>()!;
    final borderColor = Theme.of(context).extension<AppBorders>()!;
    return Container(
      height: 52.h(context),
      width: double.infinity,
      decoration: BoxDecoration(
        color: backgroundColor.onSurfacePrimary,
          borderRadius: BorderRadius.circular(12.r(context)),
          border: Border.all(
              color:
                  _getBorderColor(isSelected, borderColor, backgroundColor))),
      child: OptionBoxItem(isSelected: isSelected),
    );
  }

  Color _getBorderColor(
      bool isSelected, AppBorders borderColor, AppBackgrounds backgroundColor) {
    if (isSelected) {
      return borderColor.primaryBrand;
    } else {
      return borderColor.transparent;
    }
  }
}
