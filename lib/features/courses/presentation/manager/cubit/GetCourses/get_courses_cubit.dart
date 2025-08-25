// ignore: depend_on_referenced_packages
import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:student_hackerha/features/courses/domain/Entity/course.dart';
import 'package:student_hackerha/features/courses/domain/usecase/courses_usecase.dart';

part 'get_courses_state.dart';

class GetCoursesCubit extends Cubit<GetCoursesState> {
  GetCoursesCubit(this.getCoursesUsecase) : super(GetCoursesInitial());
  final GetCoursesUsecase getCoursesUsecase;
  Future<void> getCoursesCubit() async {
    emit(GetCoursesLoading());
    final result = await getCoursesUsecase();
    result.fold(
        (failure) => emit(GetCoursesFailure(errMessage: failure.message!)),
        (courses) => emit(GetCoursesLoaded(courses: courses)));
  }
}
