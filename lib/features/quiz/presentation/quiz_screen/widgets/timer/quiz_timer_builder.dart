import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:student_hackerha/features/quiz/presentation/quiz_screen/handlers/shared/on_time_out_quiz.dart';
import 'package:student_hackerha/features/quiz/presentation/quiz_screen/helpers/timer/get_timer_format_duration.dart';
import 'package:student_hackerha/features/quiz/presentation/quiz_screen/manager/count_down_timer_cubit/count_down_timer_cubit.dart';
import 'package:student_hackerha/features/quiz/presentation/quiz_screen/manager/count_down_timer_cubit/count_down_timer_state.dart';
import 'package:student_hackerha/features/quiz/presentation/quiz_screen/widgets/timer/quiz_timer_card.dart';

class QuizTimerBuilder extends StatelessWidget {
  const QuizTimerBuilder({super.key, required this.isBank});
final bool isBank;
  @override
  Widget build(BuildContext context) {
    return BlocConsumer<CountdownTimerCubit, CountDownTimerState>(
      listener: (context, state) {
        if (state is TimeOutState) {
          onTimeOutQuiz(context: context,isBank: isBank);
        }
      },
      builder: (context, state) {
        final formatted = getTimerFormatDuration(state.duration);

        return QuizTimerCard(
          minutes: formatted['minutes']!,
          seconds: formatted['seconds']!,
        );
      },
    );
  }
}
