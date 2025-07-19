// ignore: depend_on_referenced_packages
import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:student_hackerha/core/error/exceptions.dart';
import 'package:student_hackerha/features/home/domain/Entity/course_entity.dart';
import 'package:student_hackerha/features/home/domain/usecase/my_courses_usecase.dart';

part 'my_courses_state.dart';

class MyCoursesCubit extends Cubit<MyCoursesState> {
  MyCoursesCubit(this.myCoursesUsecase) : super(MyCoursesInitial());
  final MyCoursesUsecase myCoursesUsecase;

  Future<void> fetchMyCourses() async {
    emit(MyCoursesLoading());
      final result = await myCoursesUsecase();
      result.fold((error) => emit(MyCoursesError(error.message!)),
          (courses) => emit(MyCoursesLoaded(courses)));
  }
  
  
}
