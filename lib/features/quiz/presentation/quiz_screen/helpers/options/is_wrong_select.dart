bool isWrongSelect(
    {required Map<String, dynamic> answer, required int optionIndex}) {
  if (!answer['isCorrect'] &&
      !answer['isSkipped'] &&
      answer['selectedAnswer'] == optionIndex) {
    return true;
  } else {
    return false;
  }
}
