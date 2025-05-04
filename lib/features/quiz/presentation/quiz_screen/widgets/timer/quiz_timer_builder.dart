import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:student_hackerha/features/quiz/presentation/quiz_screen/handlers/on_time_out_quiz.dart';
import 'package:student_hackerha/features/quiz/presentation/quiz_screen/manager/count_down_timer_cubit/count_down_timer_cubit.dart';
import 'package:student_hackerha/features/quiz/presentation/quiz_screen/manager/count_down_timer_cubit/count_down_timer_state.dart';
import 'package:student_hackerha/features/quiz/presentation/quiz_screen/widgets/timer/quiz_timer_card.dart';

class QuizTimerBuilder extends StatelessWidget {
  const QuizTimerBuilder({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<CountdownTimerCubit, CountDownTimerState>(
      listener: (context, state) {
        if (state is TimeOutState) {
          while (Navigator.canPop(context)) {
            Navigator.pop(context);
          }
          onTimeOutQuiz(context);
        }
      },
      builder: (context, state) {
        final minutes =
            state.duration.inMinutes.remainder(60).toString().padLeft(2, '0');
        final seconds =
            state.duration.inSeconds.remainder(60).toString().padLeft(2, '0');

        return QuizTimerCard(
          minutes: minutes,
          seconds: seconds,
        );
      },
    );
  }
}
