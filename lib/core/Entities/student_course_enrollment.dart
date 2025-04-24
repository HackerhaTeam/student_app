import 'package:equatable/equatable.dart';
import 'package:student_hackerha/core/Entities/course.dart';
import 'package:student_hackerha/core/Entities/student.dart';

class StudentCourseEnrollment extends Equatable {
  final Student student;
  final Course course;
  final double progress;
  final double quizzesScore;
  final double lecturesAttendance;

  const StudentCourseEnrollment({
    required this.student,
    required this.course,
    required this.progress,
    required this.quizzesScore,
    required this.lecturesAttendance,
  });

  @override
  List<Object?> get props =>
      [student, course, progress, quizzesScore, lecturesAttendance];
}
