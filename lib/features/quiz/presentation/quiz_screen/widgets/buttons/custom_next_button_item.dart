import 'package:flutter/material.dart';
import 'package:phosphor_flutter/phosphor_flutter.dart';
import 'package:student_hackerha/core/functions/get_responsive_size.dart';
import 'package:student_hackerha/core/themes/extentions/app_content.dart';
import 'package:student_hackerha/core/themes/typoGraphy/app_text_styles.dart';

class CustomNextButtonItem extends StatelessWidget {
  const CustomNextButtonItem({
    super.key,
    required this.isSelected,
  });

  final bool isSelected;
  @override
  Widget build(BuildContext context) {
    final contentColor = Theme.of(context).extension<AppContent>()!;
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Text(
          _getText(isSelected),
          style: context
              .xLabelLarge
              .copyWith(color: contentColor.primaryInverted),
        ),
        SizedBox(
          width: 4.w(context),
        ),
        PhosphorIcon(
          _getIcon(isSelected),
          color: contentColor.primaryInverted,
          size: 24.s(context),
        )
      ],
    );
  }

  String _getText(bool isSelected) {
    if (isSelected) {
      return 'السؤال التالي';
    } else {
      return 'تخطي السؤال';
    }
  }

  IconData _getIcon(bool isSelected) {
    if (isSelected) {
      return PhosphorIcons.caretRight();
    } else {
      return PhosphorIcons.caretDoubleRight();
    }
  }
}
