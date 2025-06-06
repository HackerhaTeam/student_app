import 'package:flutter/material.dart';
import 'package:phosphor_flutter/phosphor_flutter.dart';
import 'package:student_hackerha/core/functions/get_responsive_size.dart';
import 'package:student_hackerha/core/themes/extentions/app_content.dart';
import 'package:student_hackerha/core/themes/typoGraphy/app_text_styles.dart';
import 'package:student_hackerha/features/quiz/presentation/quiz_screen/handlers/shared/on_finish_quiz.dart';

class QuizDrawerBottom extends StatelessWidget {
  const QuizDrawerBottom({
    super.key, required this.isBank,
  });
final bool isBank;
  @override
  Widget build(BuildContext context) {
    final contentColor = Theme.of(context).extension<AppContent>()!;

    return GestureDetector(
      onTap: () => onFinishQuiz(context: context, isBank: isBank),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.end,
        children: [
          PhosphorIcon(
            PhosphorIcons.power(),
            size: 24.s(context),
            color: contentColor.negative,
          ),
          SizedBox(width: 8.w(context)),
          Text(
            'إنهاء الاختبار',
            style: context.xLabelLarge.copyWith(
              color: contentColor.negative,
            ),
          )
        ],
      ),
    );
  }
}
