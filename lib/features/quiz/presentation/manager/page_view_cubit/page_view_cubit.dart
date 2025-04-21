import 'package:flutter_bloc/flutter_bloc.dart';

class PageViewCubit extends Cubit<int> {
  PageViewCubit() : super(0);

  void goToPage(int index) => emit(index);

  void nextPage(int maxPages) {
    if (state < maxPages - 1) emit(state + 1);
  }

  void previousPage() {
    if (state > 0) emit(state - 1);
  }
}
