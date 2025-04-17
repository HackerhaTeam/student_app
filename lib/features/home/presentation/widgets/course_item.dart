import 'package:flutter/material.dart';
import 'package:student_hackerha/core/constants/assets_image.dart';
import 'package:student_hackerha/core/functions/get_responsive_size.dart';
import 'package:student_hackerha/core/themes/extentions/app_backgrounds.dart';
import 'package:student_hackerha/core/themes/extentions/app_borders.dart';
import 'package:student_hackerha/core/widgets/custom_button.dart';
import 'package:student_hackerha/features/home/presentation/widgets/course_content.dart';
import 'package:student_hackerha/features/home/presentation/widgets/course_image.dart';
import 'package:student_hackerha/features/home/presentation/widgets/course_tags.dart';
import 'package:student_hackerha/features/home/presentation/widgets/courses_tag.dart';

class CourseItem extends StatelessWidget {
  final AppBorders border;
  final AppBackgrounds background;
  final String courseName;
  final String description;
  final List<String> tagsTitle;
  final bool isNew;

  const CourseItem({
    super.key,
    required this.border,
    required this.background,
    required this.courseName,
    required this.description,
    required this.tagsTitle,
    required this.isNew,
  });

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Container(
        margin: EdgeInsets.only(bottom: 8.h(context)),
        width: MediaQuery.of(context).size.width * 0.75,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(21.r(context)),
          border: Border.all(width: 1, color: border.secondary),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            CourseImage(
              border: border,
              background: background,
              isNew: isNew,
            ),
            CourseContent(
              border: border,
              background: background,
              courseName: courseName,
              description: description,
              tagsTitle: tagsTitle,
            ),
          ],
        ),
      ),
    );
  }
}
