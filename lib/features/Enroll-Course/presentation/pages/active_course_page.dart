import 'package:flutter/material.dart';
import 'package:student_hackerha/features/Enroll-Course/presentation/widgets/active_course_page_body.dart';

class ActiveCoursePage extends StatelessWidget {
  const ActiveCoursePage({super.key, required this.onNext});
  final VoidCallback onNext;
  @override
  Widget build(BuildContext context) {
    return ActiveCoursePageBody(
      onNext: onNext,
    );
  }
}
