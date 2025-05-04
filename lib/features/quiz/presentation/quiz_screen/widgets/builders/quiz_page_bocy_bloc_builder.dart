import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:student_hackerha/features/quiz/presentation/quiz_screen/handlers/on_finish_quiz.dart';
import 'package:student_hackerha/features/quiz/presentation/quiz_screen/manager/page_view_cubit/page_view_cubit.dart';
import 'package:student_hackerha/features/quiz/presentation/quiz_screen/manager/page_view_cubit/page_view_state.dart';
import 'package:student_hackerha/features/quiz/presentation/quiz_screen/widgets/builders/quiz_page_view_builder.dart';

class QuizPageBodyBlocBuilder extends StatefulWidget {
  const QuizPageBodyBlocBuilder({
    super.key,
  });

  @override
  State<QuizPageBodyBlocBuilder> createState() =>
      _QuizPageBodyBlocBuilderState();
}

class _QuizPageBodyBlocBuilderState extends State<QuizPageBodyBlocBuilder> {
  final PageController _pageController = PageController();

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<PageViewCubit, PageViewState>(
      listener: (context, state) {
        if (state is LastQState) {
          onFinishQuiz(context);
        } else {
          _pageController.animateToPage(
            state.questionIndex,
            duration: const Duration(milliseconds: 300),
            curve: Curves.easeInOut,
          );
        }
      },
      builder: (context, state) {
        return QuizPageViewBuilder(
          pageController: _pageController,
        );
      },
    );
  }
}
