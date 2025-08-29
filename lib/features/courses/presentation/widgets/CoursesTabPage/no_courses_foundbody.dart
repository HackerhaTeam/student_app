import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:student_hackerha/core/constants/assets_image.dart';
import 'package:student_hackerha/core/functions/get_responsive_size.dart';
import 'package:student_hackerha/core/helpers/tags/get_theme_icon.dart';
import 'package:student_hackerha/core/themes/extentions/app_content.dart';
import 'package:student_hackerha/core/themes/typoGraphy/app_text_styles.dart';
import 'package:student_hackerha/core/widgets/animation/fade_widget.dart';
import 'package:student_hackerha/features/courses/presentation/widgets/CoursesTabPage/courses_headdr.dart';

class NoCoursesFoundbody extends StatelessWidget {
  const NoCoursesFoundbody({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    final content = Theme.of(context).extension<AppContent>();

    return FadeInWidget(
      child: Column(
        children: [
       
          SizedBox(height: 80.h(context),),
          SvgPicture.asset(
            getThemeIcon(context, AppImages.noCoursesImageDark, AppImages.noCoursesImageLight)),
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
              ),
              Spacer()
            ],
          )
        ],
      ),
    );
  }
}
