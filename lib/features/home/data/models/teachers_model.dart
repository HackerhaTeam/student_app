import 'package:student_hackerha/core/api/keys/home/top_teacher_api_key.dart';
import 'package:student_hackerha/features/home/data/models/image_model.dart';
import 'package:student_hackerha/features/home/domain/Entity/image_entity.dart';
import 'package:student_hackerha/features/home/domain/Entity/teacher_entity.dart';

// ignore: must_be_immutable
class TeachersModel extends TeacherEntity {
  TeachersModel(
      {required super.id,
      required super.name,
      required super.rate,
      required super.image,
      required super.createdAt,
      required super.reviewsCount,
      required super.studentsCount,
      required super.coursesCount});
  factory TeachersModel.fromJson(Map<String, dynamic> json) {
    // التحقق من أن الحقول الأساسية ليست null (مطلوبة)
    if (json[TopTeacherApiKey.id] == null ||
        json[TopTeacherApiKey.name] == null ||
        json[TopTeacherApiKey.rate] == null ||
        json[TopTeacherApiKey.createdAt] == null) {
      throw FormatException('Required fields (id, name, rate, createdAt) are missing or null in TeachersModel JSON');
    }

    return TeachersModel(
      id: json[TopTeacherApiKey.id] as int,
      name: json[TopTeacherApiKey.name] as String,
      rate: (json[TopTeacherApiKey.rate]) as dynamic,
      image: json[TopTeacherApiKey.image] != null
          ? ImageModel.fromJson(json[TopTeacherApiKey.image] as Map<String, dynamic>)
          : null, // صورة اختيارية (nullable)
      createdAt: DateTime.parse(json[TopTeacherApiKey.createdAt] as String),
      reviewsCount: json[TopTeacherApiKey.reviewsCount] as int?, // nullable
      studentsCount: json[TopTeacherApiKey.studentsCount] as int?, // nullable
      coursesCount: json[TopTeacherApiKey.coursesCount] as int?, // nullable
    );
  }

  Map<String, dynamic> toJson() => {
        TopTeacherApiKey.id: id,
        TopTeacherApiKey.name: name,
        TopTeacherApiKey.rate: rate,
        TopTeacherApiKey.image: image?.toJson(),
        TopTeacherApiKey.createdAt:
            "${createdAt.year.toString().padLeft(4, '0')}-${createdAt.month.toString().padLeft(2, '0')}-${createdAt.day.toString().padLeft(2, '0')}",
        TopTeacherApiKey.reviewsCount: reviewsCount,
        TopTeacherApiKey.studentsCount: studentsCount,
        TopTeacherApiKey.coursesCount: coursesCount,
      };
}
