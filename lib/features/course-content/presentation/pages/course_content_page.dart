import 'package:flutter/material.dart';
import 'package:student_hackerha/core/themes/extentions/app_backgrounds.dart';
import 'package:student_hackerha/features/course-content/presentation/widgets/course_content_page_body.dart';

class CourseContentPage extends StatelessWidget {
  const CourseContentPage({super.key});

  @override
  Widget build(BuildContext context) {
    final bgColor = Theme.of(context).extension<AppBackgrounds>()!;
    return Scaffold(
      backgroundColor: bgColor.surfacePrimary,
      body: CourseContentPageBody(),
    );
  }
}
