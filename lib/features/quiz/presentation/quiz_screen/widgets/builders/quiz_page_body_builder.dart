import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:student_hackerha/features/quiz/presentation/quiz_screen/handlers/shared/on_finish.dart';
import 'package:student_hackerha/features/quiz/presentation/quiz_screen/manager/page_view_cubit/page_view_cubit.dart';
import 'package:student_hackerha/features/quiz/presentation/quiz_screen/manager/page_view_cubit/page_view_state.dart';
import 'package:student_hackerha/features/quiz/presentation/quiz_screen/widgets/sections/quiz_page_body.dart';

class QuizPageBodyBuilder extends StatefulWidget {
  const QuizPageBodyBuilder({
    super.key,
    required this.isCorrection,
    required this.isBank,
  });
  final bool isBank;
  final bool isCorrection;

  @override
  State<QuizPageBodyBuilder> createState() => _QuizPageBodyBuilderState();
}

class _QuizPageBodyBuilderState extends State<QuizPageBodyBuilder> {
  final PageController _pageController = PageController();

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<PageViewCubit, PageViewState>(
      listener: (context, state) {
        if (state is LastQState) {
          onFinish(
              context: context,
              isCorrection: widget.isCorrection,
              isBank: widget.isBank);
        } else {
          _pageController.animateToPage(
            state.questionIndex,
            duration: const Duration(milliseconds: 300),
            curve: Curves.easeInOut,
          );
        }
      },
      builder: (context, state) {
        return QuizPageBody(
          isBank: widget.isBank,
          isCorrection: widget.isCorrection,
          pageController: _pageController,
        );
      },
    );
  }
}
