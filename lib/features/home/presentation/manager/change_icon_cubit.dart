import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class ChangeIconCubit extends Cubit<bool> {
  ChangeIconCubit() : super(false);

  late AnimationController controller;

  void initController(TickerProvider vsync) {
    controller = AnimationController(
      vsync: vsync,
      animationBehavior: AnimationBehavior.preserve,
      duration: const Duration(milliseconds: 300),
    );
  }

  void toggleAnimation(bool isDrawerOpened) {
    if (isDrawerOpened) {
      controller.forward();
    } else {
      controller.reverse();
    }
  }

  @override
  Future<void> close() {
    controller.dispose();
    return super.close();
  }
}