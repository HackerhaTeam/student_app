import 'package:dartz/dartz.dart';
import 'package:student_hackerha/core/Entities/teacher.dart';
import 'package:student_hackerha/core/error/exceptions.dart';
import 'package:student_hackerha/features/home/domain/Entity/teacher_entity.dart';

abstract class TopTeacherRepositories {
  Future<Either<Failure,List<TeacherEntity>>> getTopTeacher();
}