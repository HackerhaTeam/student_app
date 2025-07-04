

import 'package:dartz/dartz.dart';
import 'package:student_hackerha/core/error/err_model.dart';
import 'package:student_hackerha/core/error/exceptions.dart';
import 'package:student_hackerha/features/home/data/source/recently_added_course_data_source.dart';
import 'package:student_hackerha/features/home/domain/Entity/course_entity.dart';
import 'package:student_hackerha/features/home/domain/repositories/recently_added_course_repositories.dart';

class RecentlyAddedCourseRepositoryImpl implements RecentlyAddedCourseRepository {
  final RecentlyAddedCourseRemoteDataSource remoteDataSource;

  RecentlyAddedCourseRepositoryImpl(this.remoteDataSource);

  @override
  Future<Either<Failure, List<CourseEntity>>> getRecentlyAddedCourses() async {
    try {
      final result = await remoteDataSource.getRecentlyAddedCourses();
      return Right(result);
    } catch (e) {
      return Left(ServerFailure(e.toString()));
    }
  }
}
