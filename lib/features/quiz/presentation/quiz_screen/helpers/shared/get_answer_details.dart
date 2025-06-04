import 'package:student_hackerha/core/functions/set_up_server_locator.dart';
import 'package:student_hackerha/features/quiz/presentation/shared/manager/quiz_session.dart';

Map<String, dynamic> getAnswerDetails(int questionIndex) {
  final result = getIt.get<QuizSessionManerger>().result!;
  final answer = result['answers'][questionIndex];
  return answer;
}
