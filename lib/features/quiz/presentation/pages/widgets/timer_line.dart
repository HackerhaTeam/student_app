import 'package:flutter/material.dart';
import 'package:student_hackerha/features/quiz/presentation/pages/widgets/timer_empty_line.dart';
import 'package:student_hackerha/features/quiz/presentation/pages/widgets/timer_filling_line.dart';

class TimerLine extends StatelessWidget {
  const TimerLine({
    super.key, required this.filledValue,
  });
final double filledValue;
  @override
  Widget build(BuildContext context) {
    return TimerEmptyLine(
      child: Stack(
        children: [
          TimerFillingLine(),
        ],
      ),
    );
  }
}
