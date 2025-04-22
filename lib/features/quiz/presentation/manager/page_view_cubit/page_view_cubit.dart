import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:student_hackerha/features/quiz/presentation/manager/page_view_cubit/page_view_state.dart';

class PageViewCubit extends Cubit<PageViewState> {

  PageViewCubit({required this.totalQuestions}) : super(InitialState( totalQuestions: totalQuestions));
final int totalQuestions;
  void goToPage(int index) =>
      emit(MoveQState(questionIndex: index, totalQuestions: totalQuestions));
  void nextPage(int maxPages, bool isThereSkippedQuestions) {
    if (state.questionIndex < maxPages - 1) {
      emit(MoveQState(questionIndex: state.questionIndex + 1, totalQuestions: totalQuestions));
    } else if (isThereSkippedQuestions) {
      emit(LastQWithSkipState(
          questionIndex: state.questionIndex, totalQuestions: totalQuestions));
    } else {
      emit(LastQNoSkipState(
          questionIndex: state.questionIndex, totalQuestions: totalQuestions));
    }
  }

  void previousPage() {
    if (state.questionIndex > 0) {
      emit(MoveQState(questionIndex: state.questionIndex - 1, totalQuestions: totalQuestions));
    }
  }
}
