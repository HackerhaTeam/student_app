import 'package:flutter/material.dart';
import 'package:student_hackerha/core/functions/get_responsive_size.dart';
import 'package:student_hackerha/core/themes/typoGraphy/app_text_styles.dart';
import 'package:student_hackerha/features/quiz/presentation/quiz_screen/widgets/timer/quiz_timer_builder.dart';
import 'package:student_hackerha/features/quiz/presentation/quiz_screen/widgets/progress/linear_progress.dart';

class QuizTopSection extends StatelessWidget {
  const QuizTopSection({super.key, required this.questionNumber, required this.totalQuestions, required this.quizTime});
  final int totalQuestions;
  final int questionNumber;
  final int quizTime;
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text('$questionNumber / $totalQuestions',
                style: context.xLabelLarge),
            // QuizTimerBuilder()
          ],
        ),
        SizedBox(height: 8.h(context)),
        LinearProgress(),
      ],
    );
  }
}
