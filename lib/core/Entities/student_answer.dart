import 'package:equatable/equatable.dart';
import 'package:student_hackerha/core/Entities/answer.dart';
import 'package:student_hackerha/core/Entities/question.dart';

class StudentAnswer extends Equatable {
  final Question question;
  final Answer selectedAnswer;
  final bool isCorrect;

  const StudentAnswer({
    required this.question,
    required this.selectedAnswer,
    required this.isCorrect,
  });

  @override
  List<Object?> get props => [question, selectedAnswer, isCorrect];
}
