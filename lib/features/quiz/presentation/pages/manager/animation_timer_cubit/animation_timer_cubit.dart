import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class AnimationTimerCubit extends Cubit<double> {
  late AnimationController _controller;
  late Animation _animation;
  AnimationTimerCubit(
      {required TickerProvider vsync, required Duration duration})
      : super(0) {
    _controller = AnimationController(vsync: vsync, duration: duration);
    _animation = Tween<double>(begin: 0, end: 1).animate(_controller)
      ..addListener(
        () {
    
          emit(_animation.value );
        },
      );
  }

  void startAnimation() {
    _controller.forward();
  }

  @override
  Future<void> close() {
    _controller.dispose();
    return super.close();
  }
}
