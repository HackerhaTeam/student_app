import 'package:flutter/material.dart';

import 'package:student_hackerha/features/quiz/presentation/shared/widgets/dialog/show_quiz_dialog.dart';
import 'package:student_hackerha/features/quiz/presentation/quiz_screen/handlers/submit_quiz_result_and_navigate.dart';


void onTimeOutQuiz(BuildContext context) {
  showQuizDialog(
    context: context,
    title: 'انتهت مدة الامتحان!',
    content:
        'يبدو أن وقت الامتحان (30 دقيقة) قد انتهى، يمكنك الآن الاطلاع على النتائج التي حققتها ...',
    leftActionText: 'عرض النتائج',
    rightActionText: 'العودة لقائمة الدورة',
    onLeftPressed: () {
     submitQuizResultAndNavigate(context);
    },
    onRightPressed: () {},
  );
}
