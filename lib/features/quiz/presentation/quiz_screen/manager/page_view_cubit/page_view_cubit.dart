import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:student_hackerha/features/quiz/presentation/quiz_screen/manager/page_view_cubit/page_view_state.dart';

class PageViewCubit extends Cubit<PageViewState> {
  PageViewCubit() : super(InitialState());

  int highestQuestionReached = 0;

  void goToQuestion(int index) => emit(
        MoveQState(
          questionIndex: index,
        ),
      );

  void nextQuestion() {
    int newIndex = state.questionIndex + 1;
    if (newIndex > highestQuestionReached) {
      highestQuestionReached = newIndex;
    }
    emit(
      MoveQState(
        questionIndex: newIndex,
      ),
    );
  }

  void finishQuiz() {
    emit(
      LastQState(questionIndex: state.questionIndex),
    );
  }

  void previousPage() {
    int newIndex = state.questionIndex - 1;

    if (state.questionIndex > 0) {
      emit(
        MoveQState(
          questionIndex: newIndex,
        ),
      );
    }
  }
}
