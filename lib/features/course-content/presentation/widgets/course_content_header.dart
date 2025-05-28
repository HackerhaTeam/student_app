import 'package:flutter/material.dart';
import 'package:student_hackerha/core/constants/assets_image.dart';
import 'package:student_hackerha/core/functions/get_responsive_size.dart';
import 'package:student_hackerha/core/functions/navigation.dart';
import 'package:student_hackerha/core/themes/extentions/app_backgrounds.dart';
import 'package:student_hackerha/core/themes/typoGraphy/app_text_styles.dart';
import 'package:student_hackerha/core/widgets/custom_circle_icon.dart';
import 'package:student_hackerha/features/courses/presentation/pages/search_page.dart';

class CourseContentHeader extends StatelessWidget {
  const CourseContentHeader({
    super.key,
    required this.styles,
  });

  final BuildContext styles;

  @override
  Widget build(BuildContext context) {
    final backgrounds = Theme.of(context).extension<AppBackgrounds>()!;
    return Row(
      mainAxisAlignment: MainAxisAlignment.start,
      children: [
        CustomCircleIcon(
          iconSize: 24.s(context),
          backgroundColor: backgrounds.onSurfaceSecondary,
          circleSize: 44.s(context),
          iconAsset: AppImages.carretRight,
        ),
        SizedBox(
          width: 8.w(context),
        ),
        Text(
          "البرمجة (1)",
          style: styles.xHeadingXLarge,
        ),
        Spacer(),
        CustomCircleIcon(
          iconSize: 24.s(context),
          circleSize: 44.s(context),
          backgroundColor: backgrounds.onSurfaceSecondary,
          iconAsset: AppImages.magnifyingGlass,
          onTap: () {
            context.navigateWithSlideTransition(SearchPage());
          },
        )
      ],
    );
  }
}
