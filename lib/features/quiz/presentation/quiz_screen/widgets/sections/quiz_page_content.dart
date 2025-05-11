import 'package:flutter/material.dart';
import 'package:student_hackerha/core/functions/get_responsive_size.dart';
import 'package:student_hackerha/features/quiz/presentation/quiz_screen/widgets/sections/quiz_page_header.dart';
import 'package:student_hackerha/features/quiz/presentation/quiz_screen/widgets/builders/quiz_page_body_builder.dart';

class QuizPageContent extends StatelessWidget {
  const QuizPageContent({
    super.key, required this.isCorrection,
  });
  final bool isCorrection;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(top: 20.h(context), bottom: 16.h(context)),
      child: Column(
        children: [
          QuizPageHeader(isCorrection: isCorrection,),
          Expanded(child: QuizPageBodyBuilder(isCorrection: isCorrection,)),
        ],
      ),
    );
  }
}
