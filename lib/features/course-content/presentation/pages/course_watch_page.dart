import 'package:flutter/material.dart';
import 'package:student_hackerha/features/course-content/presentation/widgets/course_watch_page_body.dart';

class CourseWatchPage extends StatelessWidget {
  const CourseWatchPage({super.key, required this.youtubeUrl});
  final String youtubeUrl;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: CourseWatchPageBody(youtubeUrl: youtubeUrl),
    );
  }
}
