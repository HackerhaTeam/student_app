import 'package:flutter/material.dart';
import 'package:student_hackerha/core/functions/get_responsive_size.dart';
import 'package:student_hackerha/features/quiz/presentation/widgets/quiz/buttons/question_back_button.dart';
import 'package:student_hackerha/features/quiz/presentation/widgets/quiz/buttons/question_next_button_builder.dart';

class QuizButtomSection extends StatelessWidget {
  const QuizButtomSection({
    super.key,
    required this.isFirstQuestion,
  });
  final bool isFirstQuestion;
  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        if (!isFirstQuestion) Expanded(child: QuestionBackButton()),
        SizedBox(
          width: 16.w(context),
        ),
        Expanded(child: QuestionNextButtonBuilder()),
      ],
    );
  }
}
