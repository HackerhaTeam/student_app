import 'package:flutter/material.dart';
import 'package:student_hackerha/core/themes/extentions/app_backgrounds.dart';
import 'package:student_hackerha/features/quiz/presentation/quiz_screen/helpers/shared/get_answer_details.dart';

Color getQuestionStatusBackgroundColor(
    {required bool isCorrection,
    int? questionStatus,
    required int questionIndex,
    int? lastIndexAccess,
    required AppBackgrounds backgroundColor}) {
  if (isCorrection) {
    return _getCorrectionColor(backgroundColor, questionIndex);
  } else {
    return _getQuizColor(
      questionStatus,
      questionIndex,
      lastIndexAccess!,
      backgroundColor,
    );
  }
}

Color _getCorrectionColor(AppBackgrounds backgroundColor, int questionIndex) {
  final answerDetails = getAnswerDetails(questionIndex);

  if (answerDetails['isCorrect']) {
    return backgroundColor.successSoft;
  } else {
    return backgroundColor.negativeSoft;
  }
}

Color _getQuizColor(
  int? questionStatus,
  int currentIndex,
  int lastIndexAccess,
  AppBackgrounds backgroundColor,
) {
  if (lastIndexAccess <= currentIndex && questionStatus == null) {
    return backgroundColor.negativeSoft;
  } else if (questionStatus == null && lastIndexAccess > currentIndex) {
    return backgroundColor.warningSoft;
  } else {
    return backgroundColor.successSoft;
  }
}
