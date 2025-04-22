import 'package:flutter_bloc/flutter_bloc.dart';

class ThemeCubit extends Cubit<bool> {
  ThemeCubit() : super(false);

  void toggleTheme() {
    // إضافة تأخير بسيط لمزامنة الأنيميشن
    Future.delayed(const Duration(milliseconds: 50), () {
      emit(!state);
    });
  }
}
