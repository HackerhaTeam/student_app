import 'package:flutter/material.dart';
import 'package:student_hackerha/features/quiz/presentation/shared/widgets/dialog/show_quiz_dialog.dart';
import 'package:student_hackerha/main.dart';

void onExitQuiz(BuildContext context) {
  showQuizDialog(
    context: context,
    title: 'هل تود أن إنهاء الامتحان؟',
    content: 'سيؤدي هذا إلى خروجك من الاختبار وفقدان البيانات التي أدخلتها.',
    leftActionText: 'الخروج على أي حال',
    rightActionText: 'العودة للاختبار',
    onLeftPressed: () {
      
      Navigator.pushReplacement(
        context,
        MaterialPageRoute(
          builder: (context) => HomePage(),
        ),
      );
    },
    onRightPressed: () {},
  );
}
