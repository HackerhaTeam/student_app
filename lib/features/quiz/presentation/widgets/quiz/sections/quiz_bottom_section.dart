import 'package:flutter/material.dart';
import 'package:student_hackerha/core/functions/get_responsive_size.dart';
import 'package:student_hackerha/features/quiz/presentation/widgets/quiz/buttons/question_back_button.dart';
import 'package:student_hackerha/features/quiz/presentation/widgets/quiz/buttons/question_finish_button.dart';
import 'package:student_hackerha/features/quiz/presentation/widgets/quiz/buttons/question_next_button_builder.dart';

class QuizBottomSection extends StatelessWidget {
  const QuizBottomSection({
    super.key,
    required this.questionIndex,
    required this.totalQuestions,
  });

  final int questionIndex;
  final int totalQuestions;

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
              ? const QuestionFinishButton()
              : const QuestionNextButtonBuilder(),
        ),
      ],
    );
  }
}
