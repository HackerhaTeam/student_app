import 'package:flutter/material.dart';
import 'package:phosphor_flutter/phosphor_flutter.dart';
import 'package:student_hackerha/core/functions/get_responsive_size.dart';
import 'package:student_hackerha/core/themes/extentions/app_backgrounds.dart';
import 'package:student_hackerha/core/themes/extentions/app_borders.dart';
import 'package:student_hackerha/core/themes/extentions/app_content.dart';
import 'package:student_hackerha/core/themes/typoGraphy/app_text_styles.dart';
import 'package:student_hackerha/core/widgets/custom_icon_button.dart';

class OptionBoxItem extends StatelessWidget {
  const OptionBoxItem({
    super.key,
    required this.isSelected,
  });
  final bool isSelected;
  @override
  Widget build(BuildContext context) {
    final contentColor = Theme.of(context).extension<AppContent>()!;

    return Padding(
      padding: EdgeInsets.only(right: 16.w(context)),
      child: Row(
        children: [
          PhosphorIcon(
fill: 1,
            textDirection: TextDirection.ltr,
            color: _getColor(isSelected,contentColor),
            _getIcon(isSelected),
            size: 16.w(context),
          ),
          SizedBox(
            width: 4.w(context),
          ),
          Text(
            'نص الخيار الأول هنا.',
            style: Theme.of(context).textTheme.xLabelLarge.copyWith(
              color: _getColor(isSelected, contentColor)
            ),
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
