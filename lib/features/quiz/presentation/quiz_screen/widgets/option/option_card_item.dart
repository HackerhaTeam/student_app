import 'package:flutter/material.dart';
import 'package:phosphor_flutter/phosphor_flutter.dart';
import 'package:student_hackerha/core/functions/get_responsive_size.dart';

import 'package:student_hackerha/core/themes/extentions/app_content.dart';
import 'package:student_hackerha/core/themes/typoGraphy/app_text_styles.dart';

class OptionCardItem extends StatelessWidget {
  const OptionCardItem({
    super.key,
    required this.isSelected,
    required this.choiceText,
  });
  final String choiceText;
  final bool isSelected;
  @override
  Widget build(BuildContext context) {
    final contentColor = Theme.of(context).extension<AppContent>()!;

    return Padding(
      padding: EdgeInsets.only(right: 16.w(context)),
      child: Row(
        children: [
          PhosphorIcon(
            textDirection: TextDirection.ltr,
            color: _getColor(isSelected, contentColor),
            _getIcon(isSelected),
            size: 16.w(context),
          ),
          SizedBox(width: 4.w(context)),
          Text(
            choiceText,
            style: context.xLabelLarge
                .copyWith(color: _getColor(isSelected, contentColor)),
          ),
        ],
      ),
    );
  }

  IconData _getIcon(bool isSelected) {
    if (isSelected) {
      return PhosphorIcons.radioButton(PhosphorIconsStyle.fill);
    } else {
      return PhosphorIcons.circle();
    }
  }

  Color? _getColor(bool isSelected, AppContent contentColor) {
    if (isSelected) {
      return contentColor.brandPrimary;
    } else {
      return null;
    }
  }
}
