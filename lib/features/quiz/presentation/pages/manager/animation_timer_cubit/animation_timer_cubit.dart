import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:user_quiz_app/core/constants/app_duration.dart';

class AnimationTimerCubit extends Cubit<double> {
  late AnimationController _controller;
  late Animation<double> _animation;
  Timer? _timer;
  AnimationTimerCubit(
      {required TickerProvider vsync, required Duration duration})
      : super(0) {
    _controller = AnimationController(
      vsync: vsync,
      duration: duration,
    );

    _animation = Tween<double>(begin: 0, end: 1).animate(_controller)
      ..addListener(
        () {
          emit(_animation.value);
        },
      );
  }

  void onQuestionChanged({required int nextPage}) {
    if (nextPage == 0) {
      startAnimationWithDelay(delay: AppDuration.delayOfStartAnimationDuration);
    } else {
      restartAnimation();
    }
  }

  void startAnimationWithDelay({required Duration delay}) {
    _timer = Timer(
      delay,
      () {
        _controller.forward();
      },
    );
  }

  void startAnimation() {
    _controller.forward();
  }

  void resetAnimation() {
    _controller.reset();
  }

  void restartAnimation() {
    _controller.reset();
    _controller.forward();
  }

  void _cancelTimer() {
    if (_timer != null && _timer!.isActive) {
      _timer!.cancel();
    }
  }

  @override
  Future<void> close() {
    _controller.dispose();
    _cancelTimer();
    return super.close();
  }
}
