import 'package:flutter/material.dart';
import 'package:student_hackerha/core/functions/get_responsive_size.dart';
import 'package:student_hackerha/core/functions/get_screen_width.dart';
import 'package:student_hackerha/features/quiz/presentation/widgets/quiz/timer/timer_empty_line.dart';
import 'package:student_hackerha/features/quiz/presentation/widgets/quiz/timer/timer_filling_line.dart';

class TimerLine extends StatelessWidget {
  const TimerLine({
    super.key,
    required this.filledValue,
  });
  final double filledValue;
  @override
  Widget build(BuildContext context) {
    return TimerEmptyLine(
      child: Stack(
        children: [
          TimerFillingLine(
            filledValue:
                (getScreenWidth(context) - 40.w(context)) * filledValue,
          ),
        ],
      ),
    );
  }
}
