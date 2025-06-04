import 'package:flutter/material.dart';
import 'package:student_hackerha/features/quiz/presentation/quiz_screen/handlers/dialog/alert_dialog_actions.dart';
import 'package:student_hackerha/features/quiz/presentation/quiz_screen/handlers/dialog/custom_alert_dialog.dart';

void showQuizDialog({
  required BuildContext context,
  required String title,
  required String content,
  required String leftActionText,
  required String rightActionText,
  required VoidCallback onLeftPressed,
  required VoidCallback onRightPressed,
   bool canPop=true,
}) {
  showDialog(
    context: context,
    builder: (BuildContext dialogContext) {
      return CustomAlertDialog(
        canPop: canPop,
        title: title,
        content: content,
        actions: [
          AlertDialogActions(
            leftActionText: leftActionText,
            rightActionText: rightActionText,
            leftOnPressed: () {
              Navigator.of(context).pop();
              onLeftPressed();
            },
            rightOnPressed: () {
              Navigator.of(dialogContext).pop();
              onRightPressed();
            },
          ),
        ],
      );
    },
  );
}
