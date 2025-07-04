import 'package:equatable/equatable.dart';
import 'package:student_hackerha/core/Entities/teacher.dart';
import 'package:student_hackerha/features/home/data/models/teachers_model.dart';
import 'image_entity.dart';

class CourseEntity extends Equatable {
  final int id;
  final String name;
  final String slug;
  final String summary;
  final int studentsCount;
  final String type;
  final List<TeachersModel>? teachers;
  final double? rating;
  final double? quizezPercent;
  final double? lecturesPercent;
  final DateTime createdAt;
  final ImageEntity? primaryImage;
  final List<ImageEntity> images;
  final int? filesCount;
  final bool? userSavedExists;
  final bool? userCartExists;

  const CourseEntity({
    required this.id,
    required this.name,
    required this.slug,
    required this.summary,
    required this.studentsCount,
    required this.type,
    required this.createdAt,
     this.teachers,
    this.rating,
    this.quizezPercent,
    this.lecturesPercent,
    this.primaryImage,
    this.images = const [],
    this.filesCount,
    this.userSavedExists,
    this.userCartExists,
  });

  @override
  List<Object?> get props => [
        id,
        name,
        slug,
        summary,
        studentsCount,
        type,
        rating,
        quizezPercent,
        lecturesPercent,
        createdAt,
        primaryImage,
        images,
        filesCount,
        userSavedExists,
        userCartExists,
        teachers
      ];
}
