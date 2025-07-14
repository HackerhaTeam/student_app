import 'package:flutter/material.dart';
import 'package:student_hackerha/core/constants/assets_image.dart';
import 'package:student_hackerha/core/functions/get_responsive_size.dart';
import 'package:student_hackerha/core/helpers/tags/get_theme_icon.dart';
import 'package:student_hackerha/core/themes/extentions/app_backgrounds.dart';
import 'package:student_hackerha/core/themes/typoGraphy/app_text_styles.dart';
import 'package:student_hackerha/core/widgets/custom_circle_icon.dart';

class NotificationsHeader extends StatelessWidget {
  const NotificationsHeader({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    final backgrounds = Theme.of(context).extension<AppBackgrounds>()!;
    return Row(
      children: [
        CustomCircleIcon(
          iconSize: 24.s(context),
          backgroundColor: backgrounds.onSurfaceSecondary,
          circleSize: 44.s(context),
          iconAsset: getThemeIcon(
              context, AppImages.carretRightDark, AppImages.carretRightLight),
          onTap: () => Navigator.pop(context),
        ),
        SizedBox(
          width: 8.w(context),
        ),
        Text(
          "الإشعارات",
          style: context.xHeadingXLarge,
        )
      ],
    );
  }
}
