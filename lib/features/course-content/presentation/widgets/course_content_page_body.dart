import 'package:flutter/material.dart';
import 'package:phosphor_flutter/phosphor_flutter.dart';
import 'package:student_hackerha/core/functions/get_responsive_size.dart';

import 'package:student_hackerha/core/themes/extentions/app_content.dart';
import 'package:student_hackerha/core/themes/typoGraphy/app_text_styles.dart';
import 'package:student_hackerha/features/course-content/presentation/widgets/section_card_builder.dart';

import 'package:student_hackerha/features/course-content/presentation/widgets/course_content_header.dart';
import 'package:student_hackerha/features/course-content/presentation/widgets/progress_container.dart';

class CourseContentPageBody extends StatelessWidget {
  const CourseContentPageBody({super.key});

  @override
  Widget build(BuildContext context) {
    final content = Theme.of(context).extension<AppContent>()!;
    final styles = context;
    return SafeArea(
      child: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.symmetric(
              horizontal: 20.w(context), vertical: 16.w(context)),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              CourseContentHeader(styles: styles),
              Padding(
                padding: EdgeInsets.only(top: 24),
                child: Text(
                  "الإنجازات",
                  style:
                      styles.xHeadingSmall.copyWith(color: content.secondary),
                ),
              ),
              SizedBox(
                height: 12,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  ProgressContainer(
                    progress: 30,
                    icon: PhosphorIcons.video(),
                    title: 'المقاطع',
                  ),
                  ProgressContainer(
                    progress: 50,
                    icon: PhosphorIcons.exam(),
                    title: 'كويزات',
                  ),
                  ProgressContainer(
                    progress: 90,
                    icon: PhosphorIcons.clock(),
                    title: 'الكلي',
                  ),
                ],
              ),
              SizedBox(
                height: 24,
              ),
              Padding(
                padding: EdgeInsets.only(
                    left: 5.w(context), right: 5.w(context), bottom: 12),
                child: Row(
                  children: [
                    Text(
                      "محتويات الدورة",
                      style: styles.xHeadingSmall
                          .copyWith(color: content.secondary),
                    ),
                    Spacer(),
                    Text(
                      "تحميل كل المقاطع",
                      style: styles.xLabelMedium.copyWith(
                          color: content.brandPrimary,
                          fontWeight: FontWeight.bold),
                    )
                  ],
                ),
              ),
              SizedBox(
                height: MediaQuery.of(context).size.height * 0.54.h(context),
                child: SectionCardBuilder(),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
