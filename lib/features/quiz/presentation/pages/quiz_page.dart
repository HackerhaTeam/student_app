import 'package:flutter/material.dart';
import 'package:student_hackerha/features/quiz/presentation/pages/widgets/quiz_page_body.dart';

class QuizPage extends StatelessWidget {
  const QuizPage({super.key});

  @override
  Widget build(BuildContext context) {
    return  SafeArea(
      child: Scaffold(
        body: QuizPageBody(),
      ),
    );
  }
}