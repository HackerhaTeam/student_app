import 'package:student_hackerha/features/quiz/presentation/quiz_screen/helpers/options/is_correct_answer.dart';
import 'package:student_hackerha/features/quiz/presentation/quiz_screen/helpers/options/is_wrong_select.dart';
import 'package:student_hackerha/features/quiz/presentation/quiz_screen/helpers/shared/get_answer_details.dart';

String? getOptionIconAsset(
    {required bool isSelected,
    required bool isCorrection,
    required int questionIndex,
    required int optionIndex}) {
  if (isCorrection) {
    return _getCorrectionIcon(questionIndex, optionIndex);
  } else {
    return _getQuizIcon(isSelected);
  }
}

String? _getCorrectionIcon(int questionIndex, int optionIndex) {
  final answer = getAnswerDetails(questionIndex);
  final isCorrect = isCorrectAnswer(answer: answer, optionIndex: optionIndex);

  final isWrong = isWrongSelect(answer: answer, optionIndex: optionIndex);

  if (isCorrect) {
    return 'assets/images/icons/check.svg';
  } else if (isWrong) {
    return 'assets/images/icons/x.svg';
  } else {
    return null;
  }
}

String? _getQuizIcon(bool isSelected) {
  if (isSelected) {
    return 'assets/images/icons/circle-fill.svg';
  } else {
    return null;
  }
}
