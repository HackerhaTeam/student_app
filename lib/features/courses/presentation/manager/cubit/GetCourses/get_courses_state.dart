part of 'get_courses_cubit.dart';

sealed class GetCoursesState extends Equatable {
  const GetCoursesState();

  @override
  List<Object> get props => [];
}

final class GetCoursesInitial extends GetCoursesState {}
final class GetCoursesLoading extends GetCoursesState {}
final class GetCoursesFailure extends GetCoursesState {
  final String errMessage;

  const GetCoursesFailure({required this.errMessage});
}
final class GetCoursesLoaded extends GetCoursesState {
  final List<Course> courses;

  const GetCoursesLoaded({required this.courses});
}
