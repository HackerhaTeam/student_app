import 'package:flutter/material.dart';
import 'package:student_hackerha/core/functions/get_responsive_size.dart';
import 'package:student_hackerha/features/quiz/presentation/quiz_screen/widgets/buttons/question_back_button.dart';
import 'package:student_hackerha/features/quiz/presentation/quiz_screen/widgets/buttons/question_finish_button.dart';
import 'package:student_hackerha/features/quiz/presentation/quiz_screen/widgets/buttons/question_next_button_builder.dart';

class QuestionNavigationBar extends StatelessWidget {
  const QuestionNavigationBar({
    super.key,
    required this.questionIndex,
    required this.totalQuestions,
    required this.isCorrection,
  });

  final int questionIndex;
  final int totalQuestions;
  final bool isCorrection;
  @override
  Widget build(BuildContext context) {
    final spacing = SizedBox(width: 16.w(context));

    final bool isFirst = questionIndex == 0;
    final bool isLast = questionIndex == totalQuestions - 1;

    return Row(
      children: [
        if (!isFirst) ...[
          const Expanded(child: QuestionBackButton()),
          spacing,
        ],
        Expanded(
          child: isLast
              ?  QuestionFinishButton(isCorrection: isCorrection)
              : QuestionNextButtonBuilder(
                  isCorrection: isCorrection, questionIndex: questionIndex,
                ),
        ),
      ],
    );
  }
}
