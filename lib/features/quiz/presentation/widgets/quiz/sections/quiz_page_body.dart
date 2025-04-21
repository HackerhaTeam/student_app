import 'package:flutter/material.dart';
import 'package:student_hackerha/core/functions/get_responsive_size.dart';
import 'package:student_hackerha/features/quiz/presentation/widgets/quiz/sections/quiz_page_header.dart';
import 'package:student_hackerha/features/quiz/presentation/widgets/quiz/builders/quiz_page_view_builder.dart';

class QuizPageBody extends StatelessWidget {
  const QuizPageBody({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(vertical: 20.h(context)),
      child: Column(
        children: [
          QuizPageHeader(),
          Expanded(child: QuizPageViewBuilder()),
        ],
      ),
    );
  }
}

