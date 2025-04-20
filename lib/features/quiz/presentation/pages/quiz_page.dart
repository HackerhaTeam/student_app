import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:student_hackerha/features/quiz/presentation/pages/manager/animation_timer_cubit/animation_timer_cubit.dart';
import 'package:student_hackerha/features/quiz/presentation/pages/widgets/quiz_page_body.dart';

class QuizPage extends StatefulWidget {
  const QuizPage({super.key});

  @override
  State<QuizPage> createState() => _QuizPageState();
}

class _QuizPageState extends State<QuizPage>
    with SingleTickerProviderStateMixin {
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) =>
          AnimationTimerCubit(vsync: this, duration: Duration(seconds: 10)),
      child: SafeArea(
        child: Scaffold(
          body: QuizPageBody(),
        ),
      ),
    );
  }
}
