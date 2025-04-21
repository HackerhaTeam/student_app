import 'dart:async';
import 'package:audioplayers/audioplayers.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:student_hackerha/features/quiz/presentation/manager/count_down_timer_cubit/count_down_timer_state.dart';

class CountdownTimerCubit extends Cubit<CountDownTimerState> {
  final Duration initialDuration;
  Timer? _timer;

  CountdownTimerCubit({required this.initialDuration})
      : super(CountdownTimerInitialState(duration: initialDuration)) {
    _startCountdown();
  }

  void _startCountdown() async {
    _timer?.cancel();

    emit(CountdownTimerContinueState(duration: state.duration));

    await Future.delayed(const Duration(seconds: 1));

    _timer = Timer.periodic(const Duration(seconds: 1), (timer) async {
      final newDuration = state.duration - Duration(seconds: 1);

      if (newDuration.inSeconds == 120) {
        final player = AudioPlayer();
        await player.play(AssetSource('audio/audio_2025-04-21_00-53-59.mp3'));
      }

      if (newDuration.inSeconds <= 0) {
        emit(CountdownTimerTimeOutState(duration: Duration.zero));
        _timer?.cancel();
      } else {
        emit(CountdownTimerContinueState(duration: newDuration));
      }
    });
  }

  @override
  Future<void> close() {
    _timer?.cancel();
    return super.close();
  }
}
