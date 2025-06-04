import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:student_hackerha/core/functions/set_up_server_locator.dart';
import 'package:student_hackerha/features/quiz/presentation/shared/manager/quiz_session.dart';

class AnimationTimerCubit extends Cubit<double> {
  late AnimationController _controller;
  late Animation _animation;
  final bool isCorrection;
  AnimationTimerCubit({
    required this.isCorrection,
    required TickerProviderStateMixin vsync,
  }) : super(0) {
    if (!isCorrection) {
      _controller =
          AnimationController(vsync: vsync, duration: _getInitialDuration());
      _animation = Tween<double>(begin: 0, end: 1).animate(_controller)
        ..addListener(
          () {
            emit(_animation.value);
          },
        );

      startAnimation();
    }
  }

  void startAnimation() {
    _controller.forward();
  }

  Duration _getInitialDuration() {
    Map<String, dynamic> quizData = getIt.get<QuizSessionManerger>().quizData!;
    return Duration(seconds: quizData['quizTime']);
  }

  @override
  Future<void> close() {
    _controller.dispose();
    return super.close();
  }
}
