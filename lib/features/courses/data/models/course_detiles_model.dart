import 'package:student_hackerha/core/api/keys/courses/courses_keys.dart';
import 'package:student_hackerha/core/api/keys/discount/discount_keys.dart';
import 'package:student_hackerha/features/courses/domain/Entity/course_detiles.dart';

class CourseDetilesModel extends CourseDetiles {
  const CourseDetilesModel({
    required super.discount,
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
    required super.session,
  });

  factory CourseDetilesModel.fromJson(Map<String, dynamic> json) {
    return CourseDetilesModel(
      discount: json[DiscountKeys.discount] ?? 0,
      id: json[CourseKeys.id] as String,
      image: json[CourseKeys.image] as String,
      name: json[CourseKeys.name] as String,
      description: json[CourseKeys.description] as String,
      price: (json[CourseKeys.price] as num).toDouble(),
      year: json[CourseKeys.year] as String,
      semester: json[CourseKeys.semester] as String,
      note: json[CourseKeys.note] as String? ?? "",
      type: json[CourseKeys.type] as String,
      rating: (json[CourseKeys.rating] as num) .toInt(),
      about: json[CourseKeys.about] as String,
      video: json[CourseKeys.video] as String,
      free: json[CourseKeys.free] as bool,
      createdAt: DateTime.parse(json[CourseKeys.createdAt] as String),
      updatedAt: DateTime.parse(json[CourseKeys.updatedAt] as String),
      session: (json[CourseKeys.session] )
              ,
    );
  

 }
}