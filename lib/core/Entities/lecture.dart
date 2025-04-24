import 'package:equatable/equatable.dart';
import 'package:student_hackerha/core/Entities/course.dart';
import 'package:student_hackerha/core/Entities/student.dart';

class Lecture extends Equatable {
  final int id;
  final String name;
  final String? notes;
  final int order;
  final Course course;
  final List<Student>? attendedStudents;

  const Lecture({
    required this.id,
    required this.name,
    this.notes,
    required this.order,
    required this.course,
    this.attendedStudents,
  });

  @override
  List<Object?> get props => [id, name, notes, order, course, attendedStudents];
}
