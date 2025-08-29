import 'package:dio/dio.dart';
import 'package:student_hackerha/core/api/dio_consumer.dart';
import 'package:student_hackerha/core/api/keys/api_keys.dart';
import 'package:student_hackerha/features/courses/data/models/course_model.dart';
import 'package:student_hackerha/features/courses/domain/Entity/course.dart';

class MyCoursesDataSource {
  final DioConsumer dio;

  MyCoursesDataSource(this.dio);
  Future<List<Course>> getMyCourses() async {
    final response = await dio.get("/api/hackit/ctrl/course",
        queryParameters: {"createdLessThanDays": 10,
        });

        
    final data = (response as List)
        .map((element) => CourseModel.fromJson(element))
        .toList();
    return data;
  }
}