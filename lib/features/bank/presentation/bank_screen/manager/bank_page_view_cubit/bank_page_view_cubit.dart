import 'package:flutter_bloc/flutter_bloc.dart';

class BankPageViewCubit extends Cubit<int> {
  BankPageViewCubit() : super(0);

  void goToPage({required int index}) => emit(index);
}
