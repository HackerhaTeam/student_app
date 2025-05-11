import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:student_hackerha/core/functions/set_up_server_locator.dart';
import 'package:student_hackerha/features/quiz/presentation/shared/manager/quiz_session.dart';

class OptionCubit extends Cubit<List<int?>> {
  OptionCubit() : super([]) {
    Map<String, dynamic> quizData = getIt.get<QuizSessionManerger>().quizData!;

    List<int?> initialState =
        List.filled((quizData['questionsList'] as List).length, null);

    emit(initialState);
  }

  void selectAnswer({required int questionIndex, required int? answerIndex}) {
    final updated = List<int?>.from(state);
    updated[questionIndex] = answerIndex;
    emit(updated);
  }

  bool isThereSkippedQuestions() {
    for (int i = 0; i < state.length; i++) {
      if (state[i] == null) {
        return true;
      }
    }
    return false;
  }

  void clearAllSelections() {
    emit(List.filled(state.length, null));
  }
  
}
