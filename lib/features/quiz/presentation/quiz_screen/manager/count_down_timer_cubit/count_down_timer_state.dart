abstract class CountDownTimerState {
  final Duration duration;

  CountDownTimerState({this.duration=const Duration(minutes: 0)});
}


class InitialState extends CountDownTimerState {
  InitialState({ super.duration});
}

class ContinueState extends CountDownTimerState {
  ContinueState({required super.duration});
}

class TimeOutState extends CountDownTimerState {
  TimeOutState({required super.duration});
}
