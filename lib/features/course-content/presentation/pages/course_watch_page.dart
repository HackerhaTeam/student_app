import 'package:flutter/material.dart';
import 'package:student_hackerha/features/course-content/presentation/widgets/video_player/basic/video_quality_option.dart';
import 'package:student_hackerha/features/course-content/presentation/widgets/video_player/player/course_watch_page_body.dart';

class CourseWatchPage extends StatelessWidget {
  const CourseWatchPage({super.key, required this.url, required this.lable});

  final String lable;
  final String url;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: CourseWatchPageBody(
        qualityOptions: [
          VideoQualityOption(label: lable, url: url),
        ],
      ),
    );
  }
}
