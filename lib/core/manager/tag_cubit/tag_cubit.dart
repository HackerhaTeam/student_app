import 'package:flutter_bloc/flutter_bloc.dart';

class TagCubit extends Cubit<int> {
  TagCubit() : super(0);

  void updateIndex({required int index}) => emit(index);
}
