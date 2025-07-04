import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:student_hackerha/core/Entities/course.dart';
import 'package:student_hackerha/core/constants/assets_image.dart';
import 'package:student_hackerha/core/functions/get_responsive_size.dart';
import 'package:student_hackerha/core/functions/navigation.dart';
import 'package:student_hackerha/core/themes/extentions/app_backgrounds.dart';
import 'package:student_hackerha/core/themes/extentions/app_content.dart';
import 'package:student_hackerha/core/themes/typoGraphy/app_text_styles.dart';
import 'package:student_hackerha/core/widgets/buttons/custom_button.dart';
import 'package:student_hackerha/features/course-content/presentation/pages/course_content_page.dart';
import 'package:student_hackerha/features/home/domain/Entity/course_entity.dart';

class MyCourseCard extends StatelessWidget {
  final String imageUrl;
  final double progress;
  final CourseEntity course;

  const MyCourseCard({
    super.key,
    required this.imageUrl,
    required this.progress,
    required this.course,
  });

  @override
  Widget build(BuildContext context) {
    final textTheme = Theme.of(context).textTheme;
    final content = Theme.of(context).extension<AppContent>();
    final background = Theme.of(context).extension<AppBackgrounds>();

    return Padding(
      padding: EdgeInsets.all(12.r(context)),
      child: Column(
        children: [
          Row(
            children: [
              _buildRigthSideContent(textTheme, context),
              Spacer(),
              _buildLeftSideContent(textTheme, context, content)
            ],
          ),
          SizedBox(height: 12.h(context)),
          _buildCustomButton(background, context, content),
          SizedBox(height: 12.h(context)),
        ],
      ),
    );
  }

  CustomButton _buildCustomButton(
      AppBackgrounds? background, BuildContext context, AppContent? content) {
    return CustomButton(
      onPressed: () {
        context.navigateWithSlideTransition(CourseContentPage());
      },
      color: background!.primaryBrand,
      width: 274.w(context),
      height: 38.h(context),
      child: Text(
        "استأنف الدورة",
        style: context.xLabelSmall.copyWith(color: content!.primaryInverted),
      ),
    );
  }

  Column _buildLeftSideContent(
      TextTheme textTheme, BuildContext context, AppContent? content) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Text(
          "\t\t\t\tالتقدم",
          style: context.xLabelMedium,
        ),
        SizedBox(height: 4.h(context)),
        Row(
          children: [
            Text(
              "$progress % ",
              style: context.xLabelMedium,
            ),
            SizedBox(width: 4.w(context)),
            SizedBox(
              height: 16.h(context),
              width: 16.w(context),
              child: Stack(
                alignment: Alignment.center,
                children: [
                  SvgPicture.asset(AppImages.progressImageIcon),
                  CircularProgressIndicator(
                    strokeWidth: 2,
                    backgroundColor: const Color(0xffD9D9D9),
                    color: content!.success,
                    value: progress / 100,
                  ),
                ],
              ),
            ),
          ],
        ),
      ],
    );
  }

  Column _buildRigthSideContent(TextTheme textTheme, BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          course.name,
          style: context.xHeadingLarge,
        ),
        SizedBox(height: 4.h(context)),
        Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              "بإشراف",
              style: context.xParagraphMedium,
            ),
            SizedBox(width: 4.w(context)),
            CircleAvatar(
              radius: 10,
              backgroundColor: Colors.transparent,
              child: Image.asset(
                imageUrl,
                fit: BoxFit.cover,
                height: 24.h(context),
                width: 24.w(context),
              ),
            ),
            SizedBox(width: 4.w(context)),
            Text(
              "${course.teachers![0].name} ",
              style: context.xParagraphMedium,
            ),
          ],
        ),
      ],
    );
  }
}
