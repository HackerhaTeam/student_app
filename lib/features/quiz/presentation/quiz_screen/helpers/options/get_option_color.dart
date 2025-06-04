import 'dart:ui';

import 'package:student_hackerha/core/themes/extentions/app_content.dart';
import 'package:student_hackerha/features/quiz/presentation/quiz_screen/helpers/options/is_correct_answer.dart';
import 'package:student_hackerha/features/quiz/presentation/quiz_screen/helpers/options/is_wrong_select.dart';
import 'package:student_hackerha/features/quiz/presentation/quiz_screen/helpers/shared/get_answer_details.dart';

Color? getOptionTextColor(
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
  final isCorrect = isCorrectAnswer(answer: answer, optionIndex: optionIndex);

  final isWrong = isWrongSelect(answer: answer, optionIndex: optionIndex);

  
  if (isCorrect) {
    return contentColor.success;
  } else if (isWrong) {
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
