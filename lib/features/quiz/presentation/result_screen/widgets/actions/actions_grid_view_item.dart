import 'package:flutter/material.dart';
import 'package:student_hackerha/core/functions/get_responsive_size.dart';
import 'package:student_hackerha/core/themes/extentions/app_backgrounds.dart';
import 'package:student_hackerha/core/themes/typoGraphy/app_text_styles.dart';
import 'package:student_hackerha/core/widgets/custom_circle_icon_button.dart';

class ActionsGridViewItem extends StatelessWidget {
  const ActionsGridViewItem(
      {super.key, required this.icon, required this.text});

  final IconData icon;

  final String text;
  @override
  Widget build(BuildContext context) {
    final backgroundColor = Theme.of(context).extension<AppBackgrounds>()!;
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        CustomCircleIconButton(
          backgrounds: backgroundColor,
          iconDataPhosphor: icon,
          size: 24.s(context),
        ),
        SizedBox(height: 8.h(context)),
        Text(text, style: context.xLabelSmall),
      ],
    );
  }
}
