import 'package:flutter_bloc/flutter_bloc.dart';

class OptionCubit extends Cubit<List<int?>> {
  OptionCubit({required int questionCount})
      : super(List.filled(questionCount, null));

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
