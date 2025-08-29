import 'package:dartz/dartz.dart';
import 'package:student_hackerha/core/error/exceptions.dart';
import 'package:student_hackerha/features/courses/domain/Entity/course.dart';
import 'package:student_hackerha/features/courses/domain/repositories/CourseRepo.dart';

class CoursesUsecase 
{
  final CourseRepo courseRepo;

  CoursesUsecase({required this.courseRepo});
  Future<Either <Failure,List<Course>>> getCourses ()async{
  return  await courseRepo.getCourses();
  }Future<Either <Failure,Course>>getCourseDetiles (String courseId)async{
  return  await courseRepo.getCourseDetiles(courseId);
  }
}
