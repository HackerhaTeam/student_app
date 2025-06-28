import 'package:flutter/material.dart';
import 'package:student_hackerha/core/constants/assets_image.dart';
import 'package:student_hackerha/core/functions/get_responsive_size.dart';
import 'package:student_hackerha/core/themes/extentions/app_backgrounds.dart';
import 'package:student_hackerha/core/themes/extentions/app_content.dart';
import 'package:student_hackerha/core/themes/typoGraphy/app_text_styles.dart';
import 'package:student_hackerha/core/widgets/custom_circle_icon.dart';

class BankPageHeader extends StatelessWidget {
  const BankPageHeader({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    final backgroundColor = Theme.of(context).extension<AppBackgrounds>()!;
    final contentColor = Theme.of(context).extension<AppContent>()!;

    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 20.w(context)),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text('بنك الأسئلة', style: context.xHeadingXLarge),
          CustomCircleIcon(
            iconColor: contentColor.primary,
            iconAsset: AppImages.magnifyingGlass,
            circleSize: 44.s(context),
            backgroundColor: backgroundColor.onSurfaceSecondary,
            iconSize: 24.s(context),
          )
        ],
      ),
    );
  }
}
