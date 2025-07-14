import 'package:flutter/material.dart';
import 'package:student_hackerha/core/functions/navigation.dart';
import 'package:student_hackerha/core/themes/extentions/app_backgrounds.dart';
import 'package:student_hackerha/core/widgets/buttons/big_next_button.dart';
import 'package:student_hackerha/features/course-content/presentation/pages/course_watch_page.dart';
import 'package:student_hackerha/features/course-content/presentation/widgets/course_content_page_body.dart';
import 'package:student_hackerha/features/course-content/presentation/widgets/video_player/course_watch_page_body.dart';
import 'package:student_hackerha/features/course-content/presentation/widgets/video_player/video_quality_option.dart';

class CourseContentPage extends StatelessWidget {
  const CourseContentPage({super.key});

  @override
  Widget build(BuildContext context) {
    final bgColor = Theme.of(context).extension<AppBackgrounds>()!;
    return Scaffold(
      floatingActionButton: BigNextButton(
        value: true,
        onPressed: () {
          context.navigateWithSlideTransition(
            CourseWatchPageBody(
              qualityOptions: [
                VideoQualityOption(
                    label: 'HD',
                    url:
                        'https://flutter.github.io/assets-for-api-docs/assets/videos/bee.mp4'),
              ],
            ),
          );
        },
        text: "استأنف مسيرتك التعليمية",
      ),
      backgroundColor: bgColor.surfacePrimary,
      body: CourseContentPageBody(),
    );
  }
}
