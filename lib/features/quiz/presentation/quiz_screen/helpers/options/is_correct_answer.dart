bool isCorrectAnswer(
    {required Map<String, dynamic> answer, required int optionIndex}) {
  if (answer['correctAnswer'] == optionIndex) {
    return true;
  } else {
    return false;
  }
}
