import 'package:equatable/equatable.dart';
import 'package:student_hackerha/core/Entities/quiz.dart';
import 'package:student_hackerha/core/Entities/student.dart';
import 'package:student_hackerha/core/Entities/student_answer.dart';

class StudentQuizResult extends Equatable {
  final Student student;
  final Quiz quiz;
  final double score;
  final List<StudentAnswer> answers;
  final DateTime completedAt;

  const StudentQuizResult({
    required this.student,
    required this.quiz,
    required this.score,
    required this.answers,
    required this.completedAt,
  });

  @override
  List<Object?> get props => [student, quiz, score, answers, completedAt];
}
