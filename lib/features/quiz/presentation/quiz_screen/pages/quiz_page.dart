import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:student_hackerha/features/quiz/presentation/quiz_screen/handlers/on_exit_quiz.dart';
import 'package:student_hackerha/core/functions/set_up_server_locator.dart';
import 'package:student_hackerha/features/quiz/presentation/quiz_screen/manager/animation_timer_cubit/animation_timer_cubit.dart';
import 'package:student_hackerha/features/quiz/presentation/quiz_screen/manager/count_down_timer_cubit/count_down_timer_cubit.dart';
import 'package:student_hackerha/features/quiz/presentation/quiz_screen/manager/option_cubit.dart/option_cubit.dart';
import 'package:student_hackerha/features/quiz/presentation/quiz_screen/manager/page_view_cubit/page_view_cubit.dart';
import 'package:student_hackerha/features/quiz/presentation/shared/manager/quiz_session.dart';
import 'package:student_hackerha/features/quiz/presentation/quiz_screen/manager/switch_icon_cubit/switch_icon_cubit.dart';
import 'package:student_hackerha/features/quiz/presentation/quiz_screen/widgets/drawer/quiz_drawer.dart';
import 'package:student_hackerha/features/quiz/presentation/quiz_screen/widgets/sections/quiz_page_content.dart';

class QuizPage extends StatefulWidget {
  const QuizPage({
    super.key,
  });

  @override
  State<QuizPage> createState() => _QuizPageState();
}

class _QuizPageState extends State<QuizPage> with TickerProviderStateMixin {
  late AnimationController _animationController;
  late Map<String, dynamic> quizData;
  final sessionManager = getIt.get<QuizSessionManerger>();
  @override
  void initState() {
    quizData = sessionManager.quizData!;

    _animationController =
        AnimationController(vsync: this, duration: Duration(milliseconds: 500));
    super.initState();
  }

  @override
  void dispose() {
    _animationController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(create: (context) => AnimationTimerCubit(vsync: this)),
        BlocProvider(create: (context) => OptionCubit()),
        BlocProvider(create: (context) => CountdownTimerCubit()),
        BlocProvider(create: (context) => PageViewCubit()),
        BlocProvider(
            create: (context) =>
                SwitchIconCubit(controller: _animationController))
      ],
      child: Builder(builder: (context) {
        return PopScope(
          onPopInvoked: (didPop) {
            onExitQuiz(context);
          },
          canPop: false,
          child: SafeArea(
            child: Builder(
              builder: (context) {
                return Scaffold(
                  onDrawerChanged: (isOpened) {
                    context.read<SwitchIconCubit>().toggleAnimation();
                  },
                  drawer: QuizDrawer(),
                  body: QuizPageContent(),
                );
              },
            ),
          ),
        );
      }),
    );
  }
}
