import 'package:flutter/material.dart';
import 'package:student_hackerha/core/themes/extentions/app_content.dart';
import 'package:student_hackerha/features/quiz/presentation/quiz_screen/helpers/shared/get_answer_details.dart';

Color getQuestionStatusTextColor(
    {required bool isCorrection,
    int? questionStatus,
    required int questionIndex,
    int? lastIndexAccess,
    required AppContent contentColor}) {
  if (isCorrection) {
    return _getCorrectionColor(questionIndex, contentColor);
  } else {
    return _getQuizColor(
        lastIndexAccess, questionIndex, questionStatus, contentColor);
  }
}

Color _getCorrectionColor(int questionIndex, AppContent contentColor) {
  final answerDetails = getAnswerDetails(questionIndex);

  if (answerDetails['isCorrect']) {
    return contentColor.success;
  } else {
    return contentColor.negative;
  }
}

Color _getQuizColor(int? lastIndexAccess, int currentIndex, int? questionStatus,
    AppContent contentColor) {
  if (lastIndexAccess! <= currentIndex && questionStatus == null) {
    return contentColor.negative;
  } else if (questionStatus == null && lastIndexAccess > currentIndex) {
    return contentColor.warning;
  } else {
    return contentColor.success;
  }
}
