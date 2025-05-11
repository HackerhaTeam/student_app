import 'package:flutter/material.dart';

import 'package:student_hackerha/features/quiz/presentation/quiz_screen/handlers/dialog/show_quiz_dialog.dart';
import 'package:student_hackerha/features/quiz/presentation/quiz_screen/handlers/shared/submit_quiz_result_and_navigate.dart';
import 'package:student_hackerha/main.dart';

void onTimeOutQuiz(BuildContext context) {
  while (Navigator.canPop(context)) {
    Navigator.pop(context);
  }
  showQuizDialog(
    canPop: false,
    context: context,
    title: 'انتهت مدة الامتحان!',
    content:
        'يبدو أن وقت الامتحان (30 دقيقة) قد انتهى، يمكنك الآن الاطلاع على النتائج التي حققتها ...',
    leftActionText: 'عرض النتائج',
    rightActionText: 'العودة لقائمة الدورة',
    onLeftPressed: () {
      submitQuizResultAndNavigate(context);
    },
    onRightPressed: () {
      Navigator.pushReplacement(context, MaterialPageRoute(builder: (builder) {
        return HomePage();
      }));
    },
  );
}
