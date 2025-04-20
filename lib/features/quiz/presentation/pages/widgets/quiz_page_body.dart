import 'package:flutter/material.dart';
import 'package:student_hackerha/core/functions/get_responsive_size.dart';
import 'package:student_hackerha/core/themes/typoGraphy/app_text_styles.dart';
import 'package:student_hackerha/features/quiz/presentation/pages/widgets/quiz_page_header.dart';
import 'package:student_hackerha/features/quiz/presentation/pages/widgets/quiz_timer.dart';
import 'package:student_hackerha/features/quiz/presentation/pages/widgets/timer_line.dart';
import 'package:student_hackerha/features/quiz/presentation/pages/widgets/timer_line_builder.dart';

class QuizPageBody extends StatelessWidget {
  const QuizPageBody({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(
          horizontal: 20.w(context), vertical: 10.h(context)),
      child: Column(
        children: [
          QuizPageHeader(),
          SizedBox(height: 24.w(context)),
          Column(
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text('1 / 10',
                      style: Theme.of(context).textTheme.xLabelLarge),
                  QuizTimer()
                ],
              ),
              SizedBox(height: 8.h(context)),
              TimerLineBuilder(),
            ],
          )
        ],
      ),
    );
  }
}
