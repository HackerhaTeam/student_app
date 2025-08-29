//-----------------------------
// Widget: CourseInformationBody
//-----------------------------

import 'package:flutter/material.dart';
import 'package:student_hackerha/core/functions/get_responsive_size.dart';
import 'package:student_hackerha/core/themes/extentions/app_content.dart';
import 'package:student_hackerha/core/themes/typoGraphy/app_text_styles.dart';

class CourseInfoSummaryText extends StatelessWidget {
  const CourseInfoSummaryText({super.key, required this.description});
  final String description;
  @override
  Widget build(BuildContext context) {
    final content = Theme.of(context).extension<AppContent>()!;
    return SliverToBoxAdapter(
      child: Padding(
        padding: EdgeInsets.symmetric(horizontal: 20.w(context)),
        child: Text(
         description,
          style: context.xParagraphMedium.copyWith(color: content.secondary),
        ),
      ),
    );
  }
}
