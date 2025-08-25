import 'package:dartz/dartz.dart';
import 'package:student_hackerha/core/error/exceptions.dart';
import 'package:student_hackerha/features/courses/domain/Entity/course.dart';
import 'package:student_hackerha/features/courses/domain/repositories/CourseRepo.dart';

class GetCoursesUsecase 
{
  final CourseRepo courseRepo;

  GetCoursesUsecase({required this.courseRepo});
  Future<Either <Failure,List<Course>>> call ()async{
  return  await courseRepo.getCourses();
  }
}
