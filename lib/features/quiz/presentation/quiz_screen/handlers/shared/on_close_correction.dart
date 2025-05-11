
import 'package:flutter/material.dart';
import 'package:student_hackerha/features/quiz/presentation/quiz_screen/handlers/dialog/show_quiz_dialog.dart';

void onCloseCorrection({required BuildContext context}) {
  showQuizDialog(
    context: context,
    title: 'إنهاء عرض التصحيح',
    content:
        'هل ترغب في إنهاء عرض تصحيح إجاباتك؟ تذكر أنه يمكنك العودة في أي وقت لرؤية نتائجك.',
    leftActionText: 'إنهاء عرض التصحيح',
    rightActionText: 'لا، ليس بعد',
    onLeftPressed: () {
     Navigator.pop(context);
    },
    onRightPressed: () {},
  );
}
