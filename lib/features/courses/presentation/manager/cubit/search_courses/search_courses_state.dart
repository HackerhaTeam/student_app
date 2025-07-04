part of 'search_courses_cubit.dart';

abstract class SearchCoursesState extends Equatable {
  const SearchCoursesState();

  @override
  List<Object> get props => [];
}

class SearchCoursesInitial extends SearchCoursesState {}

class SearchCoursesSuccess extends SearchCoursesState {
  final List<CourseEntity> filteredCourses;

  const SearchCoursesSuccess({required this.filteredCourses});

  @override
  List<Object> get props => [filteredCourses];
}

class SearchCoursesNotFound extends SearchCoursesState {}

class SearchCoursesError extends SearchCoursesState {
  final String message;

  const SearchCoursesError({required this.message});

  @override
  List<Object> get props => [message];
}
