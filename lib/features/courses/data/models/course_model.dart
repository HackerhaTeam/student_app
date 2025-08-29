import 'package:student_hackerha/core/api/keys/courses/session_keys.dart';
import 'package:student_hackerha/core/api/keys/courses/courses_keys.dart';
import 'package:student_hackerha/core/api/keys/discount/discount_keys.dart';
import 'package:student_hackerha/features/courses/data/models/session_model.dart';
import 'package:student_hackerha/features/courses/domain/Entity/course.dart';
import 'package:student_hackerha/features/courses/data/models/discount_model.dart';

class CourseModel extends Course {
  const CourseModel( 
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
      required super.updatedAt, required super.sessions});




  factory CourseModel.fromJson(Map<String, dynamic> json) {
    
    return CourseModel(
        discount:DiscountModel.fromJson(json[DiscountKeys.discount]),
        id: json[CourseKeys.id],
        image:  json[CourseKeys.image],
        name: json[CourseKeys.name],
        description:  json[CourseKeys.description],
        price: json[CourseKeys.price],
        year:  json[CourseKeys.year]??0,
        semester:  json[CourseKeys.semester]??0,
        note:  json[CourseKeys.note],
        type: json[CourseKeys.type],
        rating:  json[CourseKeys.rating],
        about:  json[CourseKeys.about],
        video:  json[CourseKeys.video],
        free:  json[CourseKeys.free],
        createdAt: DateTime.parse(json[CourseKeys.createdAt].toString()),
      updatedAt: DateTime.parse(json[CourseKeys.updatedAt].toString()),
      sessions: (json[CourseKeys.session] as List<dynamic>?)
            ?.map((e) => SessionModel.fromJson(e))
            .toList() ?? [],

    );
  }
}
