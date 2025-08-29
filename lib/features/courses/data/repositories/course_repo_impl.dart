import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import 'package:student_hackerha/core/error/exceptions.dart';
import 'package:student_hackerha/features/courses/data/remote/course_remote_data_source.dart';
import 'package:student_hackerha/features/courses/domain/Entity/course.dart';
import 'package:student_hackerha/features/courses/domain/repositories/CourseRepo.dart';

class CourseRepoImpl implements CourseRepo{
  final CourseRemoteDataSource courseRemoteDataSource;
  

  CourseRepoImpl({required this.courseRemoteDataSource});
  @override
  Future<Either<Failure, List<Course>>> getCourses()async {

    try {
  final courses= await courseRemoteDataSource.getCourses();
      return Right(courses);
    } catch (e) {
    
      if ( e is DioException) {
       return  Left(ServerFailure(e.message));
      }
      else
      {
        return   Left(ServerFailure(e.toString())); 
        }

   
   
    }
  }
  
  @override
  Future<Either<Failure, Course>> getCourseDetiles(String courseId)async {
     try {
  final courses= await courseRemoteDataSource.getCoursesDetiles(courseId);
      return Right(courses);
    } catch (e) {
    
      if ( e is DioException) {
       return  Left(ServerFailure(e.message));
      }
      else
      {
        return   Left(ServerFailure(e.toString())); 
        }

   
   
    }
    
  }
}