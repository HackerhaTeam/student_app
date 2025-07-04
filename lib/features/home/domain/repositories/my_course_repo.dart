import 'package:dartz/dartz.dart';
import 'package:student_hackerha/core/error/exceptions.dart';
import 'package:student_hackerha/features/home/domain/Entity/course_entity.dart';

abstract class MyCourseRepo
 {
  Future<Either<Failure,List<CourseEntity>>> getMyCourses();
 }