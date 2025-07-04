import 'package:dartz/dartz.dart';
import 'package:student_hackerha/core/error/exceptions.dart';
import 'package:student_hackerha/features/home/data/source/top_teacher_data_sourse.dart';
import 'package:student_hackerha/features/home/domain/Entity/teacher_entity.dart';
import 'package:student_hackerha/features/home/domain/repositories/top_teacher_repo.dart';

class TopTeacherRepsiotiesImpl implements TopTeacherRepositories {
  final TopTeacherDataSourse remoteDataSource;

  TopTeacherRepsiotiesImpl(this.remoteDataSource);
  @override
  Future<Either<Failure, List<TeacherEntity>>> getTopTeacher() async{
   
  try {
    final result = await remoteDataSource.getTopTeacher();
    return Right(result);
  } catch (e) {
    return Left(ServerFailure(e.toString()));
  }
}}