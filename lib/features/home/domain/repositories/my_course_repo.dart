import 'package:dartz/dartz.dart';
import 'package:student_hackerha/core/error/exceptions.dart';
import 'package:student_hackerha/features/courses/domain/Entity/course.dart';

abstract class MyCourseRepo
 {
  Future<Either<Failure,List<Course>>> getMyCourses();
 }