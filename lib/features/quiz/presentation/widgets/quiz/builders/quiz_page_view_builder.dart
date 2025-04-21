import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:student_hackerha/core/functions/get_responsive_size.dart';
import 'package:student_hackerha/features/quiz/presentation/manager/page_view_cubit/page_view_cubit.dart';
import 'package:student_hackerha/features/quiz/presentation/widgets/quiz/sections/quiz_body_section.dart';
import 'package:student_hackerha/features/quiz/presentation/widgets/quiz/sections/quiz_buttom_section.dart';
import 'package:student_hackerha/features/quiz/presentation/widgets/quiz/sections/quiz_top_section.dart';

class QuizPageViewBuilder extends StatefulWidget {
  const QuizPageViewBuilder({super.key});

  @override
  State<QuizPageViewBuilder> createState() => _QuizPageViewBuilderState();
}

class _QuizPageViewBuilderState extends State<QuizPageViewBuilder> {
  final PageController _pageController = PageController();

  @override
  Widget build(BuildContext context) {
    return BlocListener<PageViewCubit, int>(
      listener: (context, state) {
        _pageController.animateToPage(
          state,
          duration: const Duration(milliseconds: 300),
          curve: Curves.easeInOut,
        );
      },
      child: PageView.builder(
        physics: NeverScrollableScrollPhysics(),
        controller: _pageController,
   
        itemBuilder: (context, index) {
          return Padding(
            padding: EdgeInsets.symmetric(horizontal: 20.w(context)),
            child: Column(
              children: [
                SizedBox(height: 24.h(context)),
                QuizTopSection(questionNumber: index + 1),
                SizedBox(height: 24.h(context)),
                const Expanded(child: QuizBodySection()),
                QuizButtomSection(isFirstQuestion: index == 0),
              ],
            ),
          );
        },
      ),
    );
  }
}
