import 'package:student_hackerha/core/Entities/course.dart';
import 'package:student_hackerha/core/Entities/user.dart';

class Teacher extends User {
  final String firstName;
  final String lastName;
  final String? phone;
  final String description;
  final List<Course>? teachingCourses;

  const Teacher({
    required super.id,
    super.email,
    required this.firstName,
    required this.lastName,
    this.phone,
    required this.description,
    this.teachingCourses,
  });

  @override
  List<Object?> get props =>
      [id, email, firstName, lastName, phone, description, teachingCourses];
}
