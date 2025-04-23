import 'package:flutter/material.dart';
import 'package:student_hackerha/features/Enroll-Course/presentation/widgets/enroll_course_page_body.dart';

class EnrollCoursePage extends StatelessWidget {
  const EnrollCoursePage({super.key, required this.onNext});
  final VoidCallback onNext;
  @override
  Widget build(BuildContext context) {
    return EnrollCoursePageBody(
      onNext: onNext,
    );
  }
}
