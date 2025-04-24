import 'package:equatable/equatable.dart';
import 'package:student_hackerha/core/Entities/lecture.dart';
import 'package:student_hackerha/core/Entities/quiz.dart';
import 'package:student_hackerha/core/Entities/student.dart';
import 'package:student_hackerha/core/Entities/subject.dart';
import 'package:student_hackerha/core/Entities/teacher.dart';

class Course extends Equatable {
  final int id;
  final String name;
  final String summary;
  final String description;
  final int duration;
  final int likes;
  final int dislikes;
  final DateTime endDate;
  final int year;
  final String section;
  final Subject subject;
  final Teacher? teacher;
  final List<Lecture>? lectures;
  final List<Quiz>? quizzes;
  final List<Student>? enrolledStudents;

  const Course({
    required this.id,
    required this.name,
    required this.summary,
    required this.description,
    required this.duration,
    required this.likes,
    required this.dislikes,
    required this.endDate,
    required this.year,
    required this.section,
    required this.subject,
    this.teacher,
    this.lectures,
    this.quizzes,
    this.enrolledStudents,
  });

  @override
  List<Object?> get props => [
        id,
        name,
        summary,
        description,
        duration,
        likes,
        dislikes,
        endDate,
        year,
        section,
        subject,
        teacher,
        lectures,
        quizzes,
        enrolledStudents
      ];
}
