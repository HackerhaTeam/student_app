import 'package:flutter/material.dart';
import 'package:student_hackerha/core/functions/get_responsive_size.dart';
import 'package:student_hackerha/core/functions/set_up_server_locator.dart';
import 'package:student_hackerha/features/quiz/presentation/shared/manager/quiz_session.dart';
import 'package:student_hackerha/features/quiz/presentation/quiz_screen/widgets/sections/quiz_body_section.dart';
import 'package:student_hackerha/features/quiz/presentation/quiz_screen/widgets/sections/quiz_bottom_section.dart';
import 'package:student_hackerha/features/quiz/presentation/quiz_screen/widgets/sections/quiz_top_section.dart';

class QuizPageViewBuilder extends StatelessWidget {
  const QuizPageViewBuilder({
    super.key,
    required this.pageController,
  });
  final PageController pageController;
  @override
  Widget build(BuildContext context) {
    Map<String, dynamic> quizData = getIt.get<QuizSessionManerger>().quizData!;
    return PageView.builder(
      itemCount: (quizData['questionsList'] as List).length,
      physics: NeverScrollableScrollPhysics(),
      controller: pageController,
      itemBuilder: (context, index) {
        return Padding(
          padding: EdgeInsets.symmetric(horizontal: 20.w(context)),
          child: Column(
            children: [
              SizedBox(height: 24.h(context)),
              QuizTopSection(
                quizTime: quizData['quizTime'],
                questionNumber: index + 1,
                totalQuestions: quizData['questionsList'].length,
              ),
              SizedBox(height: 24.h(context)),
              Expanded(
                  child: QuizBodySection(
                questionText: quizData['questionsList'][index]['title'],
                listChoices: quizData['questionsList'][index]['listChoices'],
              )),
              QuizBottomSection(
                questionIndex: index,
                totalQuestions: quizData['questionsList'].length,
              ),
            ],
          ),
        );
      },
    );
  }
}
