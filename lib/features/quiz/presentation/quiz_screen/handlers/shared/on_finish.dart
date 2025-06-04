import 'package:flutter/material.dart';
import 'package:student_hackerha/features/quiz/presentation/quiz_screen/handlers/shared/on_close_correction.dart';
import 'package:student_hackerha/features/quiz/presentation/quiz_screen/handlers/shared/on_finish_quiz.dart';

void onFinish({required BuildContext context, required isCorrection,required bool isBank}) {
  if (isCorrection) {
    onCloseCorrection(context: context);
  } else {
    onFinishQuiz(context: context,isBank: isBank);
  }
}
