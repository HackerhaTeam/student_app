import 'package:student_hackerha/core/api/dio_consumer.dart';
import 'package:student_hackerha/features/courses/data/models/course_detiles_model.dart';
import 'package:student_hackerha/features/courses/domain/Entity/course_detiles.dart';

class CourseDetileRemoteDataSource 
{
  final DioConsumer dio;

  CourseDetileRemoteDataSource({required this.dio});
   Future<List<CourseDetiles>> getMyCourses(String courseId)async{
    final response = await dio.get("/api/hackit/ctrl/course/$courseId",);
    final data = (response as List).map((element)=> CourseDetilesModel.fromJson(element)).toList();
    return data;
  }
}