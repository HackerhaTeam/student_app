import 'package:flutter/material.dart';
import 'package:student_hackerha/features/quiz/presentation/quiz_screen/widgets/drawer/drawer_scrollbar.dart';

class QuizDrawerBody extends StatelessWidget {
  const QuizDrawerBody({
    super.key,
    required this.isCorrection,
  });
  final bool isCorrection;
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Expanded(
          child: Drawercrollbar(isCorrection: isCorrection),
        )
      ],
    );
  }
}
