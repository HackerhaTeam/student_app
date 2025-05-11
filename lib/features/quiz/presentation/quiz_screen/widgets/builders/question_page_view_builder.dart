
import 'package:flutter/material.dart';
import 'package:student_hackerha/core/functions/get_responsive_size.dart';
import 'package:student_hackerha/features/quiz/presentation/quiz_screen/widgets/sections/question_body_section.dart';
import 'package:student_hackerha/features/quiz/presentation/quiz_screen/widgets/sections/question_navigation_bar.dart';

class QuestionPageViewBuilder extends StatelessWidget {
  const QuestionPageViewBuilder({
    super.key,
    required this.quizData,
    required this.pageController,
    required this.isCorrection,
  });

  final Map<String, dynamic> quizData;
  final PageController pageController;
  final bool isCorrection;

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: PageView.builder(
        itemCount: (quizData['questionsList'] as List).length,
        physics: NeverScrollableScrollPhysics(),
        controller: pageController,
        itemBuilder: (context, index) {
          return Padding(
            padding: EdgeInsets.symmetric(horizontal: 20.w(context)),
            child: Column(
              children: [
                Expanded(
                  child: QuestionBodySection(
                    note:  quizData['questionsList'][index]['note'],
                    isCorrection: isCorrection,
                    questionText: quizData['questionsList'][index]['title'],
                    listChoices: quizData['questionsList'][index]
                        ['listChoices'],
                    questionIndex: index,
                  ),
                ),
                SizedBox(height: 16.h(context)),
                QuestionNavigationBar(
                  questionIndex: index,
                  totalQuestions: quizData['questionsList'].length,
                  isCorrection: isCorrection,
                ),
              ],
            ),
          );
        },
      ),
    );
  }
}
