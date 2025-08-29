import 'package:flutter/material.dart';
import 'package:student_hackerha/features/courses/domain/Entity/course.dart';
import 'package:student_hackerha/features/courses/presentation/widgets/Course%20informations/course_information_body.dart';

class CourseInforamtion extends StatelessWidget {
  const CourseInforamtion({super.key, required this.course});
  final Course course;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: CourseInformationBody(course: course,),
    );
  }
}
