import 'package:flutter/material.dart';
import 'package:student_hackerha/core/functions/get_responsive_size.dart';
import 'package:student_hackerha/core/themes/extentions/app_content.dart';
import 'package:student_hackerha/core/themes/typoGraphy/app_text_styles.dart';
import 'package:student_hackerha/core/widgets/headers/custom_tabBar.dart';
import 'package:student_hackerha/features/Enroll-Course/presentation/widgets/course_information_buttons_header.dart';
import 'package:student_hackerha/features/Enroll-Course/presentation/widgets/course_information_image.dart';
import 'package:student_hackerha/features/Enroll-Course/presentation/widgets/courses_information_tags.dart';
import 'package:student_hackerha/features/Enroll-Course/presentation/widgets/floating_active_course_button.dart';
import 'package:student_hackerha/features/Enroll-Course/presentation/widgets/summary_text_course.dart';

class CourseInformationBody extends StatelessWidget {
  const CourseInformationBody({super.key});

  @override
  Widget build(BuildContext context) {
    final List<String> tags = [
      "مدرّس واحد",
      "دورة شاملة",
      "55 طالب",
    ];
    var content = Theme.of(context).extension<AppContent>()!;
    return Scaffold(
      body: Stack(
        children: [
          SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Stack(
                  children: [
                    CourseInformationImage(),
                    Padding(
                      padding: EdgeInsets.symmetric(
                          horizontal: 20.w(context), vertical: 60.h(context)),
                      child: CourseInformationButtonsHeader(),
                    ),
                  ],
                ),
                SizedBox(height: 16),
                Padding(
                  padding: EdgeInsets.only(right: 20.w(context)),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        "البرمجة (1)",
                        style: context.xHeadingLarge,
                      ),
                      SizedBox(height: 8),
                      Text(
                        "أساس البرمجة التي من خلالها ستبدأ رحلتك العلمية في عالم البرمجة الواسع.",
                        style: context.xParagraphMedium
                            .copyWith(color: content.secondary),
                      ),
                      SizedBox(height: 16),
                      CoursesInformationTags(tags: tags),
                    ],
                  ),
                ),
                Column(
                  children: [
                    SizedBox(height: 8),
                    CustomTabBar(tabs: [
                      "حول الدورة",
                      "المدرسين",
                      "محتويات الدورة",
                      "المراجعات",
                    ]),
                  ],
                ),
                Padding(
                  padding: EdgeInsets.symmetric(horizontal: 20.w(context)),
                  child: SummaryTextCourse(),
                ),
              ],
            ),
          ),
          FloatingActiveCourseButton(),
        ],
      ),
    );
  }
}
