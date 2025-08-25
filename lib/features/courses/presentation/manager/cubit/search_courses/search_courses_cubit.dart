// ignore: depend_on_referenced_packages
import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:student_hackerha/features/courses/domain/Entity/course.dart';
import 'package:student_hackerha/features/home/domain/Entity/course_entity.dart';
part 'search_courses_state.dart';

class SearchCoursesCubit extends Cubit<SearchCoursesState> {
  SearchCoursesCubit() : super(SearchCoursesInitial());

  List<Course> searchCourses(String query, List<Course> allCourses) {
    try {
      if (query.isEmpty) {
        emit(SearchCoursesInitial());
        return allCourses;
      }

      final normalizedQuery = query.toLowerCase();

      final filteredCourses = allCourses
          .where(
              (course) => course.name.toLowerCase().contains(normalizedQuery))
          .toList();

      if (filteredCourses.isEmpty) {
        emit(SearchCoursesNotFound());
        return [];
      }

      emit(SearchCoursesSuccess(filteredCourses: filteredCourses));
      return filteredCourses;
    } catch (e) {
      emit(SearchCoursesError(message: 'Search failed: ${e.toString()}'));
      return allCourses;
    }
  }
}
