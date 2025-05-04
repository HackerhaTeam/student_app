import 'package:student_hackerha/core/functions/set_up_server_locator.dart';
import 'package:student_hackerha/features/quiz/presentation/shared/manager/quiz_session.dart';

Map<String, dynamic> generateReviewReport(
    {required int timeSpend, required List<dynamic> selectedAnswers}) {
  Map<String, dynamic> quizData = getIt.get<QuizSessionManerger>().quizData!;
  List<Map<String, dynamic>> questionsList = quizData['questionsList'];
  List<dynamic> correctAnswer = questionsList.map((question) {
    return question['correctAnswer'];
  }).toList();

  int correctCount = 0;
  int wrongCount = 0;
  List<Map<String, dynamic>> answersDetails = [];

  for (int i = 0; i < selectedAnswers.length; i++) {
    final selected = selectedAnswers[i];
    final correct = correctAnswer[i];
    final isCorrect = (selected == correct);

    if (isCorrect) {
      correctCount++;
    } else {
      wrongCount++;
    }

    answersDetails.add({
      'selectedAnswer': selected,
      'correctAnswer': correct,
      'isCorrect': isCorrect,
    });
  }
  return {
    'totalCount': correctCount + wrongCount,
    'timeSpend': timeSpend,
    'correctCount': correctCount,
    'wrongCount': wrongCount,
    'percentage': (correctCount / (correctCount + wrongCount)) * 100,
    'answers': answersDetails,
  };
}
