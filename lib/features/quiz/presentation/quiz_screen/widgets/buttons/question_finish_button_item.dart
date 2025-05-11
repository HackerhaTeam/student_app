import 'package:flutter/material.dart';
import 'package:student_hackerha/core/themes/extentions/app_content.dart';
import 'package:student_hackerha/core/themes/typoGraphy/app_text_styles.dart';
import 'package:student_hackerha/features/quiz/presentation/quiz_screen/helpers/buttons/get_finish_button_text.dart';

class QuestionFinishButtonItem extends StatelessWidget {
  const QuestionFinishButtonItem({
    super.key,
    required this.isCorrection,
  });

  final bool isCorrection;
  @override
  Widget build(BuildContext context) {
    final contentColor = Theme.of(context).extension<AppContent>()!;

    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Text(
          getFinishButtonText(isCorrection: isCorrection),
          style:
              context.xLabelLarge.copyWith(color: contentColor.primaryInverted),
        ),
      ],
    );
  }
}
