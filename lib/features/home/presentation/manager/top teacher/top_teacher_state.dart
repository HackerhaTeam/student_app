part of 'top_teacher_cubit.dart';

sealed class TopTeacherState extends Equatable {
  const TopTeacherState();

  @override
  List<Object> get props => [];
}
final class TopTeacherInitial extends TopTeacherState {}
final class TopTeacherLoading extends TopTeacherState {}
final class TopTeacherSucsess extends TopTeacherState {
  final List<TeacherEntity>teacher;

  const TopTeacherSucsess(this.teacher);
}
final class TopTeacherFailure extends TopTeacherState {
  final String errMessage;

  const TopTeacherFailure({required this.errMessage});
}

