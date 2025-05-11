import 'package:student_hackerha/features/quiz/presentation/quiz_screen/helpers/shared/get_answer_details.dart';

String getQuestionStatusText(
    {required bool isCorrection,
    int? questionStatus,
    required int questionIndex,
    int? lastIndexAccess}) {
  if (isCorrection) {
    return _getCorrectionText(questionIndex);
  } else {
    return _getQuizText(lastIndexAccess, questionIndex, questionStatus);
  }
}

String _getCorrectionText(int questionIndex) {
  final answerDetails = getAnswerDetails(questionIndex);

  if (answerDetails['isCorrect']) {
    return 'صحيح';
  } else if (answerDetails['isSkipped']) {
    return 'مُتخطى';
  } else {
    return 'خاطئ';
  }
}

String _getQuizText(
    int? lastIndexAccess, int currentIndex, int? questionStatus) {
  if (lastIndexAccess! <= currentIndex && questionStatus == null) {
    return 'غير محلول';
  } else if (questionStatus == null && lastIndexAccess > currentIndex) {
    return 'مؤجل';
  } else {
    return 'محلول';
  }
}
