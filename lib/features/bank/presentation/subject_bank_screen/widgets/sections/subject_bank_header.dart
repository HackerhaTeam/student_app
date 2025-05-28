
import 'package:flutter/material.dart';
import 'package:student_hackerha/core/functions/get_responsive_size.dart';
import 'package:student_hackerha/core/themes/extentions/app_backgrounds.dart';
import 'package:student_hackerha/core/themes/extentions/app_content.dart';
import 'package:student_hackerha/core/themes/typoGraphy/app_text_styles.dart';
import 'package:student_hackerha/core/widgets/custom_circle_icon.dart';

class SubjectBankHeader extends StatelessWidget {
  const SubjectBankHeader({super.key});

  @override
  Widget build(BuildContext context) {
    final backgroundColor = Theme.of(context).extension<AppBackgrounds>()!;
    final contentColor = Theme.of(context).extension<AppContent>()!;
    return Row(
      children: [
        CustomCircleIcon(
          iconAsset: 'assets/images/icons/caret-right.svg',
          circleSize: 44.s(context),
          iconSize: 24.s(context),
          iconColor: contentColor.primary,
          backgroundColor: backgroundColor.onSurfaceSecondary,
          onTap: () {
            Navigator.pop(context);
          },
        ),
        SizedBox(width: 8.w(context)),
        Column(
          children: [
            Text(
              'البرمجة - 1',
              style: context.xHeadingLarge,
            ),
            SizedBox(height: 4.h(context)),
            Text(
              'قائمة بنك الأسئلة',
              style:
                  context.xLabelSmall.copyWith(color: contentColor.secondary),
            ),
          ],
        ),
        
        Spacer(),
        CustomCircleIcon(
          iconAsset: 'assets/images/icons/bookmark-simple.svg',
          circleSize: 44.s(context),
          iconSize: 24.s(context),
                  iconColor: contentColor.primary,
          backgroundColor: backgroundColor.onSurfaceSecondary,
        ),
      ],
    );
  }
}
