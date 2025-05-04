class QuizSessionManerger {
  Map<String, dynamic> ? quizData;
  Map<String, dynamic>? result;

  void startNewQuiz(Map<String, dynamic>  newData) {
    quizData = newData;
    result = null; 
  }

  void setResult(Map<String, dynamic> newResult) {
    result = newResult;
  }

  void reset() {
    quizData = null;
    result = null;
  }
}
