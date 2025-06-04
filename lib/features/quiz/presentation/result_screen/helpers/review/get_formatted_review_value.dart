import 'package:student_hackerha/features/quiz/presentation/result_screen/utilities/enum/review_answer_type.dart';

String getFormattedReviewValue({required int value,required ReviewAnswerType type}) {
    if (ReviewAnswerType.timer == type) {
      final hours = (value ~/ 3600).toString().padLeft(2, '0');
      final minutes = ((value % 3600) ~/ 60).toString().padLeft(2, '0');
      final seconds = (value % 60).toString().padLeft(2, '0');

      return "$hours:$minutes:$seconds";
    } else {
      final number = value.toString().padLeft(2, '0');
      return number;
    }
  }