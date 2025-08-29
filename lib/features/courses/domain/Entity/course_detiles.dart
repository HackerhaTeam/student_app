import 'package:student_hackerha/features/courses/domain/Entity/session.dart';
import 'package:student_hackerha/features/courses/domain/Entity/course.dart';

class CourseDetiles extends Course {
  const CourseDetiles(
      {required super.discount,
      required super.id,
      required super.image,
      required super.name,
      required super.description,
      required super.price,
      required super.year,
      required super.semester,
      required super.note,
      required super.type,
      required super.rating,
      required super.about,
      required super.video,
      required super.free,
      required super.createdAt,
      required super.updatedAt,
      required this.session});

  final List<Session> session;
}
