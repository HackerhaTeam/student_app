// ignore_for_file: use_build_context_synchronously

import 'package:flutter/material.dart';

import 'package:student_hackerha/features/quiz/presentation/quiz_screen/handlers/dialog/show_quiz_dialog.dart';
import 'package:student_hackerha/features/quiz/presentation/quiz_screen/handlers/shared/submit_quiz_result_and_navigate.dart';

void onTimeOutQuiz({required BuildContext context, required bool isBank}) {
  final navigator = Navigator.of(context, rootNavigator: true);

  ModalRoute<dynamic>? currentRoute = ModalRoute.of(context);
  if (currentRoute?.isCurrent == false && navigator.canPop()) {
    navigator.pop();
  }
  Future.delayed(Duration(milliseconds: 180), () {
    showQuizDialog(
      canPop: false,
      context: context,
      title: 'انتهت مدة الامتحان!',
      content:
          'يبدو أن وقت الامتحان (30 دقيقة) قد انتهى، يمكنك الآن الاطلاع على النتائج التي حققتها ...',
      leftActionText: 'عرض النتائج',
      rightActionText: 'العودة لقائمة الدورة',
      onLeftPressed: () {
        submitQuizResultAndNavigate(context: context, isBank: isBank);
      },
      onRightPressed: () {
        if (Scaffold.of(context).isDrawerOpen) {
          Navigator.pop(context);
        }
        Navigator.pop(context);
      },
    );
  });
}
