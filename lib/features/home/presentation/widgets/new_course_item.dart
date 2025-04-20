import 'package:flutter/material.dart';
import 'package:student_hackerha/core/functions/get_responsive_size.dart';
import 'package:student_hackerha/core/themes/extentions/app_backgrounds.dart';
import 'package:student_hackerha/core/themes/extentions/app_borders.dart';
import 'package:student_hackerha/features/home/presentation/widgets/course_content.dart';
import 'package:student_hackerha/features/home/presentation/widgets/course_image.dart';

class NewCoursesItem extends StatelessWidget {
  final AppBorders border;
  final AppBackgrounds background;
  final String courseName;
  final String description;
  final List<String> tagsTitle;
  final bool isNew;

  const NewCoursesItem({
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
        width: MediaQuery.of(context).size.width * 0.75,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(21.r(context)),
          border: Border.all(width: 1, color: border.transparent),
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
