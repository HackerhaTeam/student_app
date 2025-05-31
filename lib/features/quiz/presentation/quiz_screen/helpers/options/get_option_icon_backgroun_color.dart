import 'dart:ui';
import 'package:student_hackerha/core/themes/extentions/app_backgrounds.dart';
import 'package:student_hackerha/features/quiz/presentation/quiz_screen/helpers/options/is_correct_answer.dart';
import 'package:student_hackerha/features/quiz/presentation/quiz_screen/helpers/options/is_wrong_select.dart';
import 'package:student_hackerha/features/quiz/presentation/quiz_screen/helpers/shared/get_answer_details.dart';

Color? getOptionIconBackgroundColor(
    {required bool isCorrection,
    required int questionIndex,
    required int optionIndex,
    required AppBackgrounds backgroundColor}) {
  if (isCorrection) {
    return _getCorrectionColor(questionIndex, optionIndex, backgroundColor);
  } else {
    return null;
  }
}

Color? _getCorrectionColor(
    int questionIndex, int optionIndex, AppBackgrounds backgroundColor) {
  final answer = getAnswerDetails(questionIndex);
  final isCorrect = isCorrectAnswer(answer: answer, optionIndex: optionIndex);

  final isWrong = isWrongSelect(answer: answer, optionIndex: optionIndex);




  if (isCorrect) {
    return backgroundColor.successStrong;
  } else if (isWrong) {
    return backgroundColor.negativeStrong;
  } else {
    return null;
  }
}
