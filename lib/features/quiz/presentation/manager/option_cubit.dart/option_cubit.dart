import 'package:flutter_bloc/flutter_bloc.dart';

class OptionCubit extends Cubit<List<int?>> {
  OptionCubit({required int questionCount})
      : super(List.filled(questionCount, null));

  void selectAnswer({
    required int questionIndex,
    required int? answerIndex,
  }) {
    final updated = List<int?>.from(state);
    updated[questionIndex] = answerIndex;
    emit(updated);
  }


  void clearAllSelections() {
    emit(List.filled(state.length, null));
  }
}
