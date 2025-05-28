
String getSubjectQuizIconAsset({required int index}) {
  if (index > 5) {
    return 'assets/images/icons/student.svg';
  } else {
    return 'assets/images/icons/check.svg';
  }
}