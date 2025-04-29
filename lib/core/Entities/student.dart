import 'package:student_hackerha/core/Entities/course.dart';
import 'package:student_hackerha/core/Entities/user.dart';

class Student extends User {
  final String firstName;
  final String lastName;
  final int? phone;
  final String studentNumber;
  final List<Course>? enrolledCourses;
  final List<Course>? savedCourses;

  const Student({
    required super.id,
    super.email,
    required this.firstName,
    required this.lastName,
    this.phone,
    required this.studentNumber,
    this.enrolledCourses,
    this.savedCourses,
  });

  @override
  List<Object?> get props => [
        id,
        email,
        firstName,
        lastName,
        phone,
        studentNumber,
        enrolledCourses,
        savedCourses
      ];
}
