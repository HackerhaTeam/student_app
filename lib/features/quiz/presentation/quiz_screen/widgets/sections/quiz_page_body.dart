import 'package:flutter/material.dart';
import 'package:student_hackerha/core/functions/get_responsive_size.dart';
import 'package:student_hackerha/core/functions/set_up_server_locator.dart';
import 'package:student_hackerha/features/quiz/presentation/quiz_screen/widgets/builders/question_page_view_builder.dart';
import 'package:student_hackerha/features/quiz/presentation/shared/manager/quiz_session.dart';
import 'package:student_hackerha/features/quiz/presentation/quiz_screen/widgets/sections/question_header_info.dart';

class QuizPageBody extends StatelessWidget {
  const QuizPageBody({
    super.key,
    required this.pageController,
    required this.isCorrection,
  });
  final PageController pageController;
  final bool isCorrection;
  @override
  Widget build(BuildContext context) {
    Map<String, dynamic> quizData = getIt.get<QuizSessionManerger>().quizData!;
    return Padding(
      padding: EdgeInsets.only(top: 34.h(context)),
      child: Column(
        children: [
          QuestionHeaderInfo(
            quizTime: quizData['quizTime'],
            totalQuestions: quizData['questionsList'].length,
            isCorrection: isCorrection,
          ),
       
          SizedBox(height: 24.h(context)),
          QuestionPageViewBuilder(
            quizData: quizData,
            pageController: pageController,
            isCorrection: isCorrection,
          ),
        ],
      ),
    );
  }
}
