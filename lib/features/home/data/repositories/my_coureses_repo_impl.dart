import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import 'package:student_hackerha/core/error/exceptions.dart';
import 'package:student_hackerha/features/home/data/source/my_courses_data_source.dart';
import 'package:student_hackerha/features/home/domain/Entity/course_entity.dart';
import 'package:student_hackerha/features/home/domain/repositories/my_course_repo.dart';

class MyCouresesRepoImpl implements MyCourseRepo{
  final MyCoursesDataSource myCoursesDataSource;

  MyCouresesRepoImpl(this.myCoursesDataSource);
  @override
  Future<Either<Failure, List<CourseEntity>>> getMyCourses()async {
    try {
      final result = await myCoursesDataSource.getMyCourses();
      return Right(result);
    } catch (e) {
     var dioException= e as DioException;
      return Left(handleDioExceptions(dioException ));
    }
  }
}