import 'dart:ui';
import 'package:student_hackerha/core/themes/extentions/app_borders.dart';
import 'package:student_hackerha/features/quiz/presentation/quiz_screen/helpers/options/is_correct_answer.dart';
import 'package:student_hackerha/features/quiz/presentation/quiz_screen/helpers/options/is_wrong_select.dart';
import 'package:student_hackerha/features/quiz/presentation/quiz_screen/helpers/shared/get_answer_details.dart';

Color? getOptionIconBorderColor(
    {required bool isCorrection,
    required bool isSelected,
    required int questionIndex,
    required int optionIndex,
    required AppBorders borderColor}) {
  if (isCorrection) {
    return _getCorrectionColor(questionIndex, optionIndex, borderColor);
  } else {
    return _getQuizColor(isSelected, borderColor);
  }
}

Color? _getCorrectionColor(
    int questionIndex, int optionIndex, AppBorders backgroundColor) {
  final answer = getAnswerDetails(questionIndex);
  final isCorrect = isCorrectAnswer(answer: answer, optionIndex: optionIndex);

  final isWrong = isWrongSelect(answer: answer, optionIndex: optionIndex);

  if (!isCorrect && !isWrong) {
    return backgroundColor.primary;
  } else {
    return null;
  }
}

Color? _getQuizColor(bool isSelected, AppBorders borderColor) {
  if (isSelected) {
    return borderColor.primaryBrand;
  } else {
    return borderColor.primary;
  }
}
