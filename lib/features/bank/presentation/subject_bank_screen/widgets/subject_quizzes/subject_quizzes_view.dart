import 'package:flutter/material.dart';
import 'package:student_hackerha/core/functions/get_responsive_size.dart';
import 'package:student_hackerha/features/bank/presentation/subject_bank_screen/widgets/subject_quizzes/subject_quiz.dart';

class SubjectQuizzesView extends StatelessWidget {
  const SubjectQuizzesView({
    super.key,
  });

  @override
  Widget build(BuildContext context) {

    return ListView.builder(
      physics: BouncingScrollPhysics(),
      itemCount: 10,
      itemBuilder: (context, index) {
        return Padding(
          padding: EdgeInsets.only(bottom: 16.h(context)),
          child: SubjectQuiz(index: index,),
        );
      },
    );
  }
}
