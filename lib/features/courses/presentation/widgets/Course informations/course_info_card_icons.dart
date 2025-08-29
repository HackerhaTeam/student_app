//-----------------------------
// Widget: CourseInformationBody
//-----------------------------

import 'package:flutter/material.dart';
import 'package:phosphor_flutter/phosphor_flutter.dart';
import 'package:student_hackerha/core/functions/get_responsive_size.dart';
import 'package:student_hackerha/features/courses/presentation/widgets/Course%20informations/course_information_body.dart';
import 'package:student_hackerha/features/courses/presentation/widgets/Course%20informations/custom_course_information_card_icon_text.dart';

class CourseInfoCardIcons extends StatelessWidget {
  const CourseInfoCardIcons(
      {super.key,
      required this.courseType,
      required this.studentCount,
      required this.teacherCount});
  final String courseType;
  final String studentCount;
  final String teacherCount;
  @override
  Widget build(BuildContext context) {
    return SliverToBoxAdapter(
      child: Padding(
        padding: EdgeInsets.symmetric(horizontal: 20.w(context)),
        child: Wrap(
          spacing: 16.w(context),
          runSpacing: 8,
          children: [
            CustomCourseInformationCardIconText(
              title: courseType,
              icon: PhosphorIcons.circlesFour(),
            ),
            CustomCourseInformationCardIconText(
              title: studentCount,
              icon: PhosphorIcons.student(),
            ),
            CustomCourseInformationCardIconText(
              title: teacherCount,
              icon: PhosphorIcons.chalkboardTeacher(),
            ),
          ],
        ),
      ),
    );
  }
}
