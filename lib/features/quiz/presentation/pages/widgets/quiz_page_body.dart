import 'package:flutter/material.dart';
import 'package:student_hackerha/core/functions/get_responsive_size.dart';
import 'package:student_hackerha/features/quiz/presentation/pages/widgets/quiz_body_section.dart';
import 'package:student_hackerha/features/quiz/presentation/pages/widgets/quiz_buttom_section.dart';
import 'package:student_hackerha/features/quiz/presentation/pages/widgets/quiz_page_header.dart';
import 'package:student_hackerha/features/quiz/presentation/pages/widgets/quiz_top_section.dart';

class QuizPageBody extends StatelessWidget {
  const QuizPageBody({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(
          horizontal: 20.w(context), vertical: 20.h(context)),
      child: Column(
        children: [
          QuizPageHeader(),
          SizedBox(height: 24.h(context)),
          QuizTopSection(),
          SizedBox(height: 24.h(context)),
          Expanded(child: QuizBodySection()),
          QuizButtomSection(),
      
        ],
      ),
    );
  }
}
