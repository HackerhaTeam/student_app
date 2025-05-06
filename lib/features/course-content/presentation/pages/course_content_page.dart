import 'package:flutter/material.dart';
import 'package:student_hackerha/core/functions/navigation.dart';
import 'package:student_hackerha/core/themes/extentions/app_backgrounds.dart';
import 'package:student_hackerha/core/widgets/buttons/big_next_button.dart';
import 'package:student_hackerha/features/course-content/presentation/pages/course_watch_page.dart';
import 'package:student_hackerha/features/course-content/presentation/widgets/course_content_page_body.dart';

class CourseContentPage extends StatelessWidget {
  const CourseContentPage({super.key});

  @override
  Widget build(BuildContext context) {
    final bgColor = Theme.of(context).extension<AppBackgrounds>()!;
    return Scaffold(
      floatingActionButton: BigNextButton(
        value: true,
        onPressed: () {
          context.navigateWithSlideTransition(CourseWatchPage(
            youtubeUrl: 'https://youtu.be/N2hgYTY1zCo?si=mvKXItdDm-NpZyfD',
          ));
        },
        text: "استأنف مسيرتك التعليمية",
      ),
      backgroundColor: bgColor.surfacePrimary,
      body: CourseContentPageBody(),
    );
  }
}
