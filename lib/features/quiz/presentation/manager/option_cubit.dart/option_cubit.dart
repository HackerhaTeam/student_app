import 'package:flutter_bloc/flutter_bloc.dart';

class OptionCubit extends Cubit<int?> {
  OptionCubit() : super(null);

  int? selectedIndex;
  
  void selectAnswer({
    required int index,
  }) {
    selectedIndex = index;
    emit(index);
  }

  void onQuestionChanged() {
    selectedIndex = null;
    emit(null);
  }
}
