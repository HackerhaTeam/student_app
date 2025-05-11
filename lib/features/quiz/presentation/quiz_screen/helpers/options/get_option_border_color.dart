import 'dart:ui';
import 'package:student_hackerha/core/themes/extentions/app_borders.dart';
import 'package:student_hackerha/features/quiz/presentation/quiz_screen/helpers/shared/get_answer_details.dart';

Color getOptionBorderColor(
    {required bool isSelected,
    required bool isCorrection,
    required int questionIndex,
    required int optionIndex,
    required AppBorders borderColor}) {
  if (isCorrection) {
    return _getCorrectionBorder(questionIndex, optionIndex, borderColor);
  } else {
    return _getQuizBorder(isSelected, borderColor);
  }
}

Color _getCorrectionBorder(
    int questionIndex, int optionIndex, AppBorders borderColor) {
  Map<String,dynamic> answer = getAnswerDetails(questionIndex);

  if (answer['correctAnswer'] == optionIndex) {
    return borderColor.success;
  } else if (!answer['isCorrect'] &&
      !answer['isSkipped'] &&
      answer['selectedAnswer'] == optionIndex) {
    {
      return borderColor.negative;
    }
  } else {
    return borderColor.transparent;
  }
}


Color _getQuizBorder(bool isSelected, AppBorders borderColor) {
  if (isSelected) {
    return borderColor.primaryBrand;
  } else {
    return borderColor.transparent;
  }
}

