import 'package:flutter/material.dart';
import 'package:student_hackerha/core/functions/get_responsive_size.dart';
import 'package:student_hackerha/core/themes/extentions/app_backgrounds.dart';
import 'package:student_hackerha/core/themes/extentions/app_borders.dart';
import 'package:student_hackerha/core/themes/extentions/app_content.dart';
import 'package:student_hackerha/core/themes/typoGraphy/app_text_styles.dart';
import 'package:student_hackerha/core/widgets/custom_button.dart';
import 'package:student_hackerha/features/home/presentation/widgets/courses%20elements/course_tags.dart';

class CourseContent extends StatelessWidget {
  final AppBorders border;
  final AppBackgrounds background;
  final String courseName;
  final String description;
  final List<String> tagsTitle;

  const CourseContent({
    super.key,
    required this.border,
    required this.background,
    required this.courseName,
    required this.description,
    required this.tagsTitle,
  });

  @override
  Widget build(BuildContext context) {
    final appContent = Theme.of(context).extension<AppContent>();
    return Padding(
      padding: EdgeInsets.all(12.w(context)),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            courseName,
            maxLines: 1,
            overflow: TextOverflow.ellipsis,
            style: context.xHeadingMedium,
          ),
          SizedBox(height: 8.h(context)),
          Text(
            description,
            style:
                context.xParagraphMedium.copyWith(color: appContent!.secondary),
            maxLines: 1,
            overflow: TextOverflow.ellipsis,
          ),
          SizedBox(height: 12.h(context)),
          CourseTags(
            tags: tagsTitle,
            border: border,
            background: background,
          ),
          SizedBox(height: 12.h(context)),
          CustomButton(
            onPressed: () {},
            borderRadius: 12.r(context),
            color: border.primaryBrand,
            height: 38.h(context),
            width: double.infinity,
            child: Text(
              "عرض التفاصيل",
              style: context.xLabelSmall
                  .copyWith(color: appContent.primaryInverted),
            ),
          ),
        ],
      ),
    );
  }
}
