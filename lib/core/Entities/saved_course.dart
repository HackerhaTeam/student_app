import 'package:equatable/equatable.dart';
import 'package:student_hackerha/core/Entities/course.dart';
import 'package:student_hackerha/core/Entities/student.dart';

class SavedCourse extends Equatable {
  final Student student;
  final Course course;
  final DateTime savedAt;

  const SavedCourse({
    required this.student,
    required this.course,
    required this.savedAt,
  });

  @override
  List<Object?> get props => [student, course, savedAt];
}
