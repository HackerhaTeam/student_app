
import 'package:flutter/material.dart';
import 'package:student_hackerha/core/functions/get_responsive_size.dart';
import 'package:student_hackerha/core/themes/extentions/app_content.dart';
import 'package:student_hackerha/core/themes/typoGraphy/app_text_styles.dart';

class SubjectQuizDetails extends StatelessWidget {
  const SubjectQuizDetails({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    final contentColor = Theme.of(context).extension<AppContent>()!;

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          'دورة 2018 كاملة',
          style: context.xHeadingSmall,
        ),
        SizedBox(height: 4.h(context)),
        Text(
          'قائمة',
          style: context.xLabelSmall.copyWith(color: contentColor.secondary),
        ),
      ],
    );
  }
}
