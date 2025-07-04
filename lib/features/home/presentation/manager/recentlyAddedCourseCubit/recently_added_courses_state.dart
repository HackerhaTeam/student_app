

import 'package:equatable/equatable.dart';
import 'package:student_hackerha/features/home/domain/Entity/course_entity.dart';

abstract class RecentlyAddedCoursesState extends Equatable {
  const RecentlyAddedCoursesState();

  @override
  List<Object?> get props => [];
}

class RecentlyAddedCoursesInitial extends RecentlyAddedCoursesState {}

class RecentlyAddedCoursesLoading extends RecentlyAddedCoursesState {}

class RecentlyAddedCoursesLoaded extends RecentlyAddedCoursesState {
  final List<CourseEntity> courses;

  const RecentlyAddedCoursesLoaded(this.courses);

  @override
  List<Object?> get props => [courses];
}

class RecentlyAddedCoursesError extends RecentlyAddedCoursesState {
  final String message;

  const RecentlyAddedCoursesError(this.message);

  @override
  List<Object?> get props => [message];
}
