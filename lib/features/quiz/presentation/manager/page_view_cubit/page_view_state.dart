abstract class PageViewState {
  final int questionIndex;
  final int totalQuestions;

  PageViewState({ this.questionIndex=0,required this.totalQuestions, });
}

class InitialState extends PageViewState{
  InitialState({ required super.totalQuestions});

}

class MoveQState extends PageViewState{
  MoveQState({required super.questionIndex, required super.totalQuestions});

}

class LastQWithSkipState extends PageViewState{
  LastQWithSkipState({required super.questionIndex, required super.totalQuestions});

}

class LastQNoSkipState extends PageViewState{
  LastQNoSkipState({required super.questionIndex, required super.totalQuestions});

}