import 'dart:async';
import 'package:audioplayers/audioplayers.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:student_hackerha/core/functions/set_up_server_locator.dart';
import 'package:student_hackerha/features/quiz/presentation/quiz_screen/manager/count_down_timer_cubit/count_down_timer_state.dart';
import 'package:student_hackerha/features/quiz/presentation/shared/manager/quiz_session.dart';

class CountdownTimerCubit extends Cubit<CountDownTimerState> {
  Timer? _timer;
  final bool isCorrection;
  CountdownTimerCubit({required this.isCorrection}) : super(InitialState()) {
    if (!isCorrection) {
      _startCountdown();
    }
  }
  void _startCountdown() async {
    _timer?.cancel();
    Duration initialDuration = _getInitialDuration();

    emit(ContinueState(duration: initialDuration));
    _timer = Timer.periodic(
      const Duration(seconds: 1),
      (timer) async {
        final newDuration = state.duration - Duration(seconds: 1);

        if (newDuration.inSeconds == 120) {
          await _playSound();
        }

        if (newDuration.inSeconds <= 0) {
          _stopTimer();
        } else {
          _updateTimer(newDuration);
        }
      },
    );
  }

  void _stopTimer() {
    emit(TimeOutState(duration: Duration.zero));
    _timer?.cancel();
  }

  Future<void> _playSound() async {
    final player = AudioPlayer();
    await player.play(AssetSource('audio/audio_2025-04-21_00-53-59.mp3'));
  }

  Duration _getInitialDuration() {
    Map<String, dynamic> quizData = getIt.get<QuizSessionManerger>().quizData!;
    return Duration(minutes: quizData['quizTime']);
  }

  void _updateTimer(Duration newDuration) {
    emit(ContinueState(duration: newDuration));
  }

  @override
  Future<void> close() {
    _timer?.cancel();
    return super.close();
  }
}
