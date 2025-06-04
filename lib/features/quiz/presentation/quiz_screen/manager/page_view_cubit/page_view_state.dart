abstract class PageViewState {
  final int questionIndex;

  PageViewState({ this.questionIndex=0 });
}

class InitialState extends PageViewState{
  

}

class MoveQState extends PageViewState{
  MoveQState({required super.questionIndex,});

}

class LastQState extends PageViewState{
  LastQState({required super.questionIndex,});

}

class LastQNoSkipState extends PageViewState{
  LastQNoSkipState({required super.questionIndex,});

}