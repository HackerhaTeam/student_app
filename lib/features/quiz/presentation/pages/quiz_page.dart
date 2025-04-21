import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:student_hackerha/features/quiz/presentation/manager/animation_timer_cubit/animation_timer_cubit.dart';
import 'package:student_hackerha/features/quiz/presentation/manager/count_down_timer_cubit/count_down_timer_cubit.dart';
import 'package:student_hackerha/features/quiz/presentation/manager/option_cubit.dart/option_cubit.dart';
import 'package:student_hackerha/features/quiz/presentation/widgets/quiz_page_body.dart';

class QuizPage extends StatefulWidget {
  const QuizPage({super.key});

  @override
  State<QuizPage> createState() => _QuizPageState();
}

class _QuizPageState extends State<QuizPage>
    with SingleTickerProviderStateMixin {
  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(
          create: (context) =>
              AnimationTimerCubit(vsync: this, duration: Duration(seconds: 6)),
        ),
          BlocProvider(
          create: (context) =>
              OptionCubit()
        ),
            BlocProvider(
          create: (context) =>
              CountdownTimerCubit(initialDuration: Duration(seconds: 5))
        )
      ],
      child: SafeArea(
        child: Scaffold(
          body: QuizPageBody(),
        ),
      ),
    );
  }
}
