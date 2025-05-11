import 'package:flutter/material.dart';
import 'package:student_hackerha/features/quiz/presentation/quiz_screen/handlers/dialog/show_quiz_dialog.dart';
import 'package:student_hackerha/main.dart';

void onExitQuiz({
  required BuildContext context,
}) {
  showQuizDialog(
    context: context,
    title: 'هل تود أن إنهاء الامتحان؟',
    content: 'سيؤدي هذا إلى خروجك من الاختبار وفقدان البيانات التي أدخلتها.',
    leftActionText: 'الخروج على أي حال',
    rightActionText: 'العودة للاختبار',
    onLeftPressed: () {
      Navigator.pushReplacement(context, MaterialPageRoute(builder: (builder) {
        return HomePage();
      }));
    },
    onRightPressed: () {},
  );
}
