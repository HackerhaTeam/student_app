import 'package:flutter/material.dart';
import 'package:student_hackerha/features/quiz/presentation/quiz_screen/handlers/shared/on_exit_quiz.dart';
import 'package:student_hackerha/features/quiz/presentation/quiz_screen/handlers/shared/on_close_correction.dart';

void onExit({required BuildContext context, required isCorrection}) {
  if (isCorrection) {
    onCloseCorrection(context: context);
  } else {
    onExitQuiz(context: context);
  }
}
