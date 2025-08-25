import 'package:dio/dio.dart';
import 'package:student_hackerha/core/api/keys/api_keys.dart';
import 'package:student_hackerha/features/home/data/models/recently_added_model.dart';
import 'package:student_hackerha/features/home/domain/Entity/course_entity.dart';

class MyCoursesDataSource 
{
  final Dio dio ;

  MyCoursesDataSource(this.dio);
  Future<List<CourseEntity>> getMyCourses()async{
    final response = await dio.get("HomeEndpoints.myCourses"  );
    final data = (response.data ['data'] as List).map((element)=> CourseModel.fromJson(element)).toList();
    return data;
  }
}