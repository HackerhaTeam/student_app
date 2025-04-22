abstract class CountDownTimerState {
  final Duration duration;

  CountDownTimerState({required this.duration});
}


class InitialState extends CountDownTimerState {
  InitialState({required super.duration});
}

class ContinueState extends CountDownTimerState {
  ContinueState({required super.duration});
}

class TimeOutState extends CountDownTimerState {
  TimeOutState({required super.duration});
}
