import 'package:dartz/dartz.dart';
import 'package:student_hackerha/core/api/dio_consumer.dart';
import 'package:student_hackerha/features/courses/data/models/course_model.dart';

class CourseRemoteDataSource 
{
  final DioConsumer dioConsumer;

  CourseRemoteDataSource( {required this.dioConsumer});
  Future<List<CourseModel>> getCourses()async{
    final response = await dioConsumer.get('hackit/ctrl/course');
    final data = 
       (response as List).map((element)=> CourseModel.fromJson(element)).toList();
        
  return data;
  }
}