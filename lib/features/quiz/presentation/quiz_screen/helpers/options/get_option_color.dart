import 'dart:ui';

import 'package:student_hackerha/core/themes/extentions/app_content.dart';
import 'package:student_hackerha/features/quiz/presentation/quiz_screen/helpers/shared/get_answer_details.dart';

Color? getOptionColor(
    {required bool isSelected,
    required bool isCorrection,
    required int questionIndex,
    required int optionIndex,
    required AppContent contentColor}) {
  if (isCorrection) {
    return _getCorrectionColor(questionIndex, optionIndex, contentColor);
  } else {
    return _getQuizColor(isSelected, contentColor);
  }
}

Color? _getCorrectionColor(
    int questionIndex, int optionIndex, AppContent contentColor) {
  final answer = getAnswerDetails(questionIndex);

  if (answer['correctAnswer'] == optionIndex) {
    return contentColor.success;
  } else if (!answer['isCorrect'] &&
      !answer['isSkipped'] &&
      answer['selectedAnswer'] == optionIndex) {
    return contentColor.negative;
  } else {
    return null;
  }
}

Color? _getQuizColor(bool isSelected, AppContent contentColor) {
  if (isSelected) {
    return contentColor.brandPrimary;
  } else {
    return null;
  }
}
