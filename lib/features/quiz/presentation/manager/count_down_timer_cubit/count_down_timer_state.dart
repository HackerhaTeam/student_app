abstract class CountDownTimerState {
  final Duration duration;

  CountDownTimerState({required this.duration});
}


class CountdownTimerInitialState extends CountDownTimerState {
  CountdownTimerInitialState({required super.duration});
}

class CountdownTimerContinueState extends CountDownTimerState {
  CountdownTimerContinueState({required super.duration});
}

class CountdownTimerTimeOutState extends CountDownTimerState {
  CountdownTimerTimeOutState({required super.duration});
}
