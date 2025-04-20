import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:student_hackerha/features/quiz/presentation/pages/manager/count_down_timer_cubit/count_down_timer_cubit.dart';
import 'package:student_hackerha/features/quiz/presentation/pages/widgets/quiz_timer.dart';

class QuizTimerBuilder extends StatelessWidget {
  const QuizTimerBuilder({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<CountdownTimerCubit, Duration>(
      builder: (context, state) {
        final minutes =
            state.inMinutes.remainder(60).toString().padLeft(2, '0');
        final seconds =
            state.inSeconds.remainder(60).toString().padLeft(2, '0');

        return QuizTimer(minutes: minutes, seconds: seconds);
      },
    );
  }
}
