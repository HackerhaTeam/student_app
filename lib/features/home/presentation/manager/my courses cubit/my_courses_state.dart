part of 'my_courses_cubit.dart';

sealed class MyCoursesState extends Equatable {
  const MyCoursesState();

  @override
  List<Object> get props => [];
}

final class MyCoursesInitial extends MyCoursesState {}
final class MyCoursesLoading extends MyCoursesState {}
final class MyCoursesLoaded extends MyCoursesState {
  final List<CourseEntity> courses ;

  const MyCoursesLoaded(this.courses);
}
final class MyCoursesError extends MyCoursesState {
  final String errMessage;

  const MyCoursesError(this.errMessage);
}
