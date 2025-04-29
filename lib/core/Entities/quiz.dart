import 'package:equatable/equatable.dart';
import 'package:student_hackerha/core/Entities/course.dart';
import 'package:student_hackerha/core/Entities/question.dart';
import 'package:student_hackerha/core/Entities/student_quiz_result.dart';

class Quiz extends Equatable {
  final int id;
  final String name;
  final int duration;
  final Course course;
  final List<Question> questions;
  final List<StudentQuizResult>? results;

  const Quiz({
    required this.id,
    required this.name,
    required this.duration,
    required this.course,
    required this.questions,
    this.results,
  });

  @override
  List<Object?> get props => [id, name, duration, course, questions, results];
}
