import 'package:flutter/material.dart';
import 'package:student_hackerha/core/Entities/course.dart';
import 'package:student_hackerha/core/functions/get_responsive_size.dart';
import 'package:student_hackerha/core/themes/extentions/app_backgrounds.dart';
import 'package:student_hackerha/core/themes/extentions/app_borders.dart';
import 'package:student_hackerha/features/home/presentation/widgets/courses%20elements/course_content.dart';
import 'package:student_hackerha/features/home/presentation/widgets/courses%20elements/course_image.dart';

class NewCoursesItem extends StatelessWidget {
  final AppBorders border;
  final AppBackgrounds background;

  final List<String> tagsTitle;

  final Course course;

  const NewCoursesItem({
    super.key,
    required this.course,
    required this.border,
    required this.background,
    required this.tagsTitle,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
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
            isNew: true,
          ),
          CourseContent(
            border: border,
            background: background,
            courseName: course.name,
            description: course.description,
            tagsTitle: tagsTitle,
          ),
        ],
      ),
    );
  }
}
