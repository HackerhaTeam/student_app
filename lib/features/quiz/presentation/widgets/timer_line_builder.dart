import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:student_hackerha/features/quiz/presentation/manager/animation_timer_cubit/animation_timer_cubit.dart';
import 'package:student_hackerha/features/quiz/presentation/widgets/timer_line.dart';

class TimerLineBuilder extends StatelessWidget {
  const TimerLineBuilder({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<AnimationTimerCubit, double>(
      builder: (context, filledValue) {
        return TimerLine(filledValue: filledValue);
      },
    );
  }
}
