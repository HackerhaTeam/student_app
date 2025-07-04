import 'package:dartz/dartz.dart';
import 'package:student_hackerha/core/error/exceptions.dart';
import 'package:student_hackerha/features/home/data/repositories/mu_coureses_repo_impl.dart';
import 'package:student_hackerha/features/home/domain/Entity/course_entity.dart';
import 'package:student_hackerha/features/home/domain/repositories/my_course_repo.dart';

class MyCoursesUsecase {
  final MyCourseRepo myCouresesRepo;

  MyCoursesUsecase(this.myCouresesRepo);
  Future<Either<Failure, List<CourseEntity>>> call() {
    return myCouresesRepo.getMyCourses();
  }
}