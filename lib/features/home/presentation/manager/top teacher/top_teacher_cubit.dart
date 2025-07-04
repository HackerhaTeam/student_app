import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:student_hackerha/features/home/domain/Entity/teacher_entity.dart';
import 'package:student_hackerha/features/home/domain/usecase/top_teacher_usecase.dart';

part 'top_teacher_state.dart';

class TopTeacherCubit extends Cubit<TopTeacherState> {
  TopTeacherCubit(this.teacherUsecase) : super(TopTeacherInitial());
  final TopTeacherUsecase teacherUsecase;
  Future<void> getTopTeacher() async {
    emit(TopTeacherLoading());
    final result = await teacherUsecase();
    result.fold(
      (error) => emit(TopTeacherFailure(errMessage: error.message!)),
      (teacher) => emit(
        TopTeacherSucsess(teacher),
      ),
    );
  }
}
