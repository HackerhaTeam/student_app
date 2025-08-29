part of 'get_courses_cubit.dart';

sealed class CoursesState extends Equatable {
  const CoursesState();

  @override
  List<Object> get props => [];
}

final class CoursesInitial extends CoursesState {}
final class CoursesLoading extends CoursesState {}
final class CoursesFailure extends CoursesState {
  final String errMessage;

  const CoursesFailure({required this.errMessage});
}
final class CoursesLoaded extends CoursesState {
  final List<Course> courses;

  const CoursesLoaded({required this.courses});
}
