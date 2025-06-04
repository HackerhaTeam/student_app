import 'package:get_it/get_it.dart';
import 'package:student_hackerha/features/quiz/presentation/shared/manager/quiz_session.dart';

final getIt = GetIt.instance;

void setupServerLocator() {
  getIt.registerSingleton<QuizSessionManerger>(QuizSessionManerger());
}
