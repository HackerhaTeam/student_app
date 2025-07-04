import 'package:student_hackerha/core/api/keys/home/recently_added_key.dart';
import 'package:student_hackerha/features/home/domain/Entity/course_entity.dart';

import 'image_model.dart';

class CourseModel extends CourseEntity {
  const CourseModel({
    required super.id,
    required super.name,
    required super.slug,
    required super.summary,
    required super.studentsCount,
    required super.type,
    required super.createdAt,
    super.rating,
    super.quizezPercent,
    super.lecturesPercent,
    super.primaryImage,
    super.images = const [],
    super.filesCount,
    super.userSavedExists,
    super.userCartExists,
  });

  factory CourseModel.fromJson(Map<String, dynamic> json) {
    return CourseModel(
      id: json[RecentlyAddedKey.id],
      name: json[RecentlyAddedKey.name],
      slug: json[RecentlyAddedKey.slug],
      summary: json[RecentlyAddedKey.summary],
      studentsCount: json[RecentlyAddedKey.studentsCount],
      type: json[RecentlyAddedKey.type],
      createdAt: DateTime.parse(json[RecentlyAddedKey.createdAt]),
      rating: (json[RecentlyAddedKey.rating] != null) ? (json[RecentlyAddedKey.rating] as num).toDouble() : null,
      quizezPercent: (json[RecentlyAddedKey.quizezPercent] != null) ? (json[RecentlyAddedKey.quizezPercent] as num).toDouble() : null,
      lecturesPercent: (json[RecentlyAddedKey.lecturesPercent] != null) ? (json[RecentlyAddedKey.lecturesPercent] as num).toDouble() : null,
      primaryImage: json[RecentlyAddedKey.primaryImage] != null ? ImageModel.fromJson(json[RecentlyAddedKey.primaryImage]) : null,
      images: (json[RecentlyAddedKey.images] as List).map((img) => ImageModel.fromJson(img)).toList(),
      filesCount: json[RecentlyAddedKey.filesCount],
      userSavedExists: json[RecentlyAddedKey.userSavedExists],
      userCartExists: json[RecentlyAddedKey.userCartExists],
    );
  }
}
