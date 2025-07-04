

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:student_hackerha/core/error/exceptions.dart';
import 'package:student_hackerha/features/home/domain/usecase/recently_added_course_usecase.dart';
import 'package:student_hackerha/features/home/presentation/manager/recentlyAddedCourseCubit/recently_added_courses_state.dart';

class RecentlyAddedCoursesCubit extends Cubit<RecentlyAddedCoursesState> {
  final GetRecentlyAddedCoursesUseCase getRecentlyAddedCoursesUseCase;

  RecentlyAddedCoursesCubit(this.getRecentlyAddedCoursesUseCase) : super(RecentlyAddedCoursesInitial());

  Future<void> fetchRecentlyAddedCourses() async {
    emit(RecentlyAddedCoursesLoading());

    final result = await getRecentlyAddedCoursesUseCase();

    result.fold(
      (failure) => emit(RecentlyAddedCoursesError(_mapFailureToMessage(failure))),
      (courses) => emit(RecentlyAddedCoursesLoaded(courses)),
    );
  }

  String _mapFailureToMessage(Failure failure) {
    return 'حدث خطأ أثناء تحميل الدورات'; 
  }
}
