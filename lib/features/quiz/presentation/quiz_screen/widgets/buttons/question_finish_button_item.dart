
import 'package:flutter/material.dart';
import 'package:student_hackerha/core/themes/extentions/app_content.dart';
import 'package:student_hackerha/core/themes/typoGraphy/app_text_styles.dart';

class QuestionFinishButtonItem extends StatelessWidget {
  const QuestionFinishButtonItem({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    final contentColor = Theme.of(context).extension<AppContent>()!;

    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Text(
          'إنهاء الاختبار',
          style: context
              .xLabelLarge
              .copyWith(color: contentColor.primaryInverted),
        ),
      ],
    );
  }
}
