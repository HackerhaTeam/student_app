import 'package:flutter/material.dart';
import 'package:student_hackerha/core/Entities/course.dart';
import 'package:student_hackerha/core/functions/get_responsive_size.dart';
import 'package:student_hackerha/core/themes/extentions/app_backgrounds.dart';
import 'package:student_hackerha/core/themes/extentions/app_borders.dart';
import 'package:student_hackerha/features/home/presentation/widgets/courses%20elements/new_course_item.dart';

class NewCourseListSection extends StatelessWidget {
  final double height;
  final AppBorders border;
  final AppBackgrounds background;

  final List<Course> courses;
  const NewCourseListSection({
    super.key,
    required this.height,
    required this.border,
    required this.background,
    required this.courses,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: height,
      child: ListView.builder(
        scrollDirection: Axis.horizontal,
        itemCount: courses.length,
        itemBuilder: (context, index) => Padding(
          padding: EdgeInsets.only(
              left: index == 0 ? 1.w(context) : 10.w(context),
              right: 10.w(context)),
          child: NewCoursesItem(
            course: courses[index],
            border: border,
            background: background,
            tagsTitle: ["مدرّس 1", "دورة شاملة", " 22 طالب"],
          ),
        ),
      ),
    );
  }
}
