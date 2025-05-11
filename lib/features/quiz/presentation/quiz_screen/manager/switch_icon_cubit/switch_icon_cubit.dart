import 'package:flutter/animation.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class SwitchIconCubit extends Cubit<bool> {
  final AnimationController controller;

  SwitchIconCubit({required this.controller}) : super(false);

  void toggleAnimation() {
    if (!state) {
      controller.forward();
      emit(true);
    } else {
      controller.reverse();
      emit(false);
    }
  }

  void play() {
    controller.forward();
    emit(true);
  }

  void reverse() {
    controller.reverse();
    emit(false);
  }


}
