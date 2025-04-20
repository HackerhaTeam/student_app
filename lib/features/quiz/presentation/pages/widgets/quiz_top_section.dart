import 'package:flutter/material.dart';
import 'package:student_hackerha/core/functions/get_responsive_size.dart';
import 'package:student_hackerha/core/themes/typoGraphy/app_text_styles.dart';
import 'package:student_hackerha/features/quiz/presentation/pages/widgets/quiz_timer.dart';
import 'package:student_hackerha/features/quiz/presentation/pages/widgets/quiz_timer_builder.dart';
import 'package:student_hackerha/features/quiz/presentation/pages/widgets/timer_line_builder.dart';

class QuizTopSection extends StatelessWidget {
  const QuizTopSection({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text('1 / 10', style: Theme.of(context).textTheme.xLabelLarge),
            QuizTimerBuilder()
          
         
          ],
        ),
        SizedBox(height: 8.h(context)),
        TimerLineBuilder(),
      ],
    );
  }
}
