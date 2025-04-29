import 'package:equatable/equatable.dart';
import 'package:student_hackerha/core/Entities/course.dart';

class Subject extends Equatable {
  final int id;
  final String name;
  final String description;
  final int year;
  final int semester;
  final int universityId;
  final List<Course>? courses;

  const Subject({
    required this.id,
    required this.name,
    required this.description,
    required this.year,
    required this.semester,
    required this.universityId,
    this.courses,
  });

  @override
  List<Object?> get props =>
      [id, name, description, year, semester, universityId, courses];
}
