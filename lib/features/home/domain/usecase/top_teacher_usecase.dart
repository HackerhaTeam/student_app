import 'package:dartz/dartz.dart';
import 'package:student_hackerha/core/error/exceptions.dart';
import 'package:student_hackerha/features/home/domain/Entity/teacher_entity.dart';
import 'package:student_hackerha/features/home/domain/repositories/top_teacher_repo.dart';

class TopTeacherUsecase {
  final TopTeacherRepositories topTeacherRepositories;

  TopTeacherUsecase(this.topTeacherRepositories);

Future <Either<Failure,List<TeacherEntity>>> call(){
  return topTeacherRepositories.getTopTeacher();
}
}