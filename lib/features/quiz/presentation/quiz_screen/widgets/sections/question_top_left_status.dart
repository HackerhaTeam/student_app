import 'package:flutter/material.dart';
import 'package:student_hackerha/features/quiz/presentation/quiz_screen/widgets/shared/status_question_card.dart';
import 'package:student_hackerha/features/quiz/presentation/quiz_screen/widgets/timer/quiz_timer_builder.dart';

class QuestionTopLeftStatus extends StatelessWidget {
  const QuestionTopLeftStatus(
      {super.key, required this.isCorrection, required this.currentIndex, required this.isBank});
  final bool isCorrection;
  final int currentIndex;
  final bool isBank;
  @override
  Widget build(BuildContext context) {
    return isCorrection
        ? StatusQuestionCard(currentIndex: currentIndex, isCorrection: true)
        :  QuizTimerBuilder(isBank: isBank);
  }
}
