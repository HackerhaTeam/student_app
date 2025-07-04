

import 'package:dartz/dartz.dart';
import 'package:student_hackerha/core/error/exceptions.dart';
import 'package:student_hackerha/features/home/domain/Entity/course_entity.dart';
import 'package:student_hackerha/features/home/domain/repositories/recently_added_course_repositories.dart';

class GetRecentlyAddedCoursesUseCase {
  final RecentlyAddedCourseRepository repository;

  GetRecentlyAddedCoursesUseCase(this.repository);

  Future<Either<Failure, List<CourseEntity>>> call() {
    return repository.getRecentlyAddedCourses();
  }
}
