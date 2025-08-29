// ignore: depend_on_referenced_packages
import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:student_hackerha/features/courses/domain/Entity/course.dart';
import 'package:student_hackerha/features/courses/domain/usecase/courses_usecase.dart';

part 'get_courses_state.dart';

class CoursesCubit extends Cubit<CoursesState> {
  CoursesCubit(this.coursesUsecase) : super(CoursesInitial());
  final CoursesUsecase coursesUsecase;
  Future<void> getCoursesCubit() async {
    emit(CoursesLoading());
    final result = await coursesUsecase.getCourses();
    result.fold(
        (failure) => emit(CoursesFailure(errMessage: failure.message!)),
        (courses) => emit(CoursesLoaded(courses: courses)));
  }
  Future<void> loadCourseDetails(String courseId) async {
  // احفظ الـ state الحالي قبل الـ emit
  final currentState = state;

  emit(CoursesLoading());

  if (currentState is CoursesLoaded) {
    final result = await coursesUsecase.getCourseDetiles(courseId);

    result.fold(
      (failure) => emit(CoursesFailure(errMessage: failure.message!)),
      (detailedCourse) {
        final updatedCourses = currentState.courses.map((c) {
          if (c.id == detailedCourse.id) {
            return c.copyWith(sessions: detailedCourse.sessions);
          }
          return c;
        }).toList();

        emit(CoursesLoaded(courses: updatedCourses));
      },
    );
  }
}


}
