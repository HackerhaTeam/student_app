import 'package:flutter/material.dart';
import 'package:student_hackerha/core/functions/get_responsive_size.dart';
import 'package:student_hackerha/core/themes/extentions/app_backgrounds.dart';
import 'package:student_hackerha/core/themes/extentions/app_content.dart';
import 'package:student_hackerha/core/themes/typoGraphy/app_text_styles.dart';
import 'package:student_hackerha/core/widgets/custom_circle_icon.dart';

class ActionsGridViewItem extends StatelessWidget {
  const ActionsGridViewItem(
      {super.key, required this.iconAsset, required this.text});

  final String iconAsset;

  final String text;
  @override
  Widget build(BuildContext context) {
    final backgroundColor = Theme.of(context).extension<AppBackgrounds>()!;
        final contentColor = Theme.of(context).extension<AppContent>()!;

    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        CustomCircleIcon(
          circleSize: 44.s(context),
          iconSize: 24.s(context),
          backgroundColor: backgroundColor.onSurfaceSecondary,
          iconColor: contentColor.primary,
          iconAsset: iconAsset,
        ),
        SizedBox(height: 8.h(context)),
        Text(text, style: context.xLabelSmall),
      ],
    );
  }
}
