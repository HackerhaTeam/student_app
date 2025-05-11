import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:student_hackerha/core/functions/get_responsive_size.dart';
import 'package:student_hackerha/core/themes/typoGraphy/app_text_styles.dart';
import 'package:student_hackerha/features/quiz/presentation/quiz_screen/manager/page_view_cubit/page_view_cubit.dart';
import 'package:student_hackerha/features/quiz/presentation/quiz_screen/widgets/sections/question_top_left_status.dart';
import 'package:student_hackerha/features/quiz/presentation/quiz_screen/widgets/progress/linear_progress.dart';

class QuestionHeaderInfo extends StatelessWidget {
  const QuestionHeaderInfo({
    super.key,
    required this.totalQuestions,
    required this.quizTime,
    required this.isCorrection,
  });
  final int totalQuestions;
  final int quizTime;
  final bool isCorrection;

  @override
  Widget build(BuildContext context) {
    int currentIndex = context.read<PageViewCubit>().state.questionIndex;

    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 20.w(context)),
      child: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text('${currentIndex + 1} / $totalQuestions',
                  style: context.xLabelLarge),
              QuestionTopLeftStatus(
                  isCorrection: isCorrection, currentIndex: currentIndex)
            ],
          ),
          SizedBox(height: 8.h(context)),
          LinearProgress(),
        ],
      ),
    );
  }
}
