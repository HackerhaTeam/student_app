import 'dart:async';
import 'package:flutter_bloc/flutter_bloc.dart';

class CountdownTimerCubit extends Cubit<Duration> {
  final Duration initialDuration;
  Timer? _timer;
  bool isFinished = false;

  CountdownTimerCubit({required this.initialDuration}) : super(initialDuration) {
    _startCountdown();
  }

  void _startCountdown() {
    _timer?.cancel();
    _timer = Timer.periodic(const Duration(seconds: 1), (timer) {
      final newDuration = state - const Duration(seconds: 1);
      if (newDuration.inSeconds <= 0) {
        isFinished = true;
        emit(Duration.zero);
        _timer?.cancel();
      } else {
        emit(newDuration);
      }
    });
  }

  @override
  Future<void> close() {
    _timer?.cancel();
    return super.close();
  }
}

