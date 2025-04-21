import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:student_hackerha/core/widgets/custom_alert_dialog.dart';
import 'package:student_hackerha/features/quiz/presentation/pages/manager/count_down_timer_cubit/count_down_timer_cubit.dart';
import 'package:student_hackerha/features/quiz/presentation/pages/manager/count_down_timer_cubit/count_down_timer_state.dart';
import 'package:student_hackerha/features/quiz/presentation/pages/widgets/quiz_timer.dart';
import 'package:student_hackerha/features/quiz/presentation/pages/widgets/time_out_quiz_dialog_actions.dart';

class QuizTimerBuilder extends StatelessWidget {
  const QuizTimerBuilder({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<CountdownTimerCubit, CountDownTimerState>(
      listener: (context, state) {
        if (state is CountdownTimerTimeOutState) {
          showDialog(
            context: context,
            builder: (BuildContext context) {
              return CustomAlertDialog(
                canPop: false,
                actions: [
                  TimeOutQuizDialogActions(),
                ],
                title: 'انتهت مدة الامتحان!',
                content:
                    'يبدو أن وقت الامتحان (30 دقيقة) قد انتهى، يمكنك الآن الاطلاع على النتائج التي حققتها ...',
              );
            },
          );
        }
      },
      builder: (context, state) {
        final minutes =
            state.duration.inMinutes.remainder(60).toString().padLeft(2, '0');
        final seconds =
            state.duration.inSeconds.remainder(60).toString().padLeft(2, '0');

        return QuizTimer(
          minutes: minutes,
          seconds: seconds,
        );
      },
    );
  }
}
