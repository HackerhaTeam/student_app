import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:student_hackerha/core/constants/assets_image.dart';
import 'package:student_hackerha/core/themes/extentions/app_content.dart';
import 'package:student_hackerha/core/themes/typoGraphy/app_text_styles.dart';
import 'package:student_hackerha/features/courses/presentation/widgets/courses_headdr.dart';

class NoCoursesFoundbody extends StatelessWidget {
  const NoCoursesFoundbody({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    final content = Theme.of(context).extension<AppContent>();
    final isDark = Theme.of(context).brightness == Brightness.dark;
    return Column(
      children: [
        CoursesPageHeader(),
        SizedBox(
          height: 160.54,
        ),
        SvgPicture.asset(
            isDark ? AppImages.noCoursesDarkImage : AppImages.noCoursesImage),
        Wrap(
          alignment: WrapAlignment.center,
          children: [
            Text(
              "لا دورات متاحة الآن",
              style: context.xDisplayLarge,
            ),
            SizedBox(
              width: double.infinity,
            ),
            Text(
              "ترقبوا! سيتم إضافة دورات جديدة قريبًا.",
              style: context.xParagraphLargeNormal
                  .copyWith(color: content!.tertiary),
            )
          ],
        )
      ],
    );
  }
}
