import 'dart:math';

import 'package:flutter/material.dart';
import 'package:student_hackerha/core/functions/get_responsive_size.dart';
import 'package:student_hackerha/core/functions/navigation.dart';
import 'package:student_hackerha/core/themes/extentions/app_backgrounds.dart';
import 'package:student_hackerha/core/themes/extentions/app_borders.dart';
import 'package:student_hackerha/core/themes/extentions/app_content.dart';
import 'package:student_hackerha/core/themes/typoGraphy/app_text_styles.dart';
import 'package:student_hackerha/core/widgets/buttons/custom_button.dart';
import 'package:student_hackerha/features/Enroll-Course/presentation/pages/course_inforamtion.dart';
import 'package:student_hackerha/core/widgets/course%20card/course_price.dart';
import 'package:student_hackerha/core/widgets/course%20card/course_tags.dart';
import 'package:student_hackerha/features/courses/domain/Entity/course.dart';
import 'package:student_hackerha/features/home/domain/Entity/course_entity.dart';

class CourseContent extends StatelessWidget {
  final AppBorders border;
  final AppBackgrounds background;
  final String courseName;
  final String description;
  final List<String> tagsTitle;
  final Course course;

  const CourseContent({
    super.key,
    required this.border,
    required this.background,
    required this.courseName,
    required this.description,
    required this.tagsTitle, required this.course,
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
            course.name,
            maxLines: 1,
            overflow: TextOverflow.ellipsis,
            style: context.xHeadingMedium,
          ),
          SizedBox(height: 8),
          Text(
            description,
            style:
                context.xParagraphMedium.copyWith(color: appContent!.secondary),
            maxLines: 1,
            overflow: TextOverflow.ellipsis,
          ),
          SizedBox(height: 12),
          CourseTags(
            tags: tagsTitle,
            border: border,
            background: background,
          ),
          SizedBox(height: 11),
          CoursePrice(newPrice:course.price,oldPrice: course.discount.dis?(course.price+ 1/course.discount.rate*course.price) :null),
          SizedBox(height: 8),
          CustomButton(
            onPressed: () {
              context.navigateWithSlideTransition(
                CourseInforamtion(),
              );
            },
            borderRadius: 12.r(context),
            color: border.primaryBrand,
            height: 38,
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
