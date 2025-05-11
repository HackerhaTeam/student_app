import 'package:flutter/material.dart';
import 'package:phosphor_flutter/phosphor_flutter.dart';
import 'package:student_hackerha/features/quiz/presentation/quiz_screen/helpers/shared/get_answer_details.dart';

IconData getOptionIcon(
    {required bool isSelected,
    required bool isCorrection,
    required int questionIndex,
    required int index}) {
  if (isCorrection) {
    return _getCorrectionIcon(questionIndex, index);
  } else {
    return _getQuizIcon(isSelected);
  }
}

PhosphorIconData _getCorrectionIcon(int questionIndex, int index) {
  final answer = getAnswerDetails(questionIndex);

  if (answer['correctAnswer'] == index) {
    return PhosphorIcons.checkCircle(PhosphorIconsStyle.fill);
  } else if (!answer['isCorrect'] &&
      !answer['isSkipped'] &&
      answer['selectedAnswer'] == index) {
    return PhosphorIcons.xCircle(PhosphorIconsStyle.fill);
  } else {
    return PhosphorIcons.circle();
  }
}

PhosphorIconData _getQuizIcon(bool isSelected) {
  if (isSelected) {
    return PhosphorIcons.radioButton(PhosphorIconsStyle.fill);
  } else {
    return PhosphorIcons.circle();
  }
}
