import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:student_hackerha/features/quiz/presentation/quiz_screen/manager/page_view_cubit/page_view_cubit.dart';

void goToPage(BuildContext context, int index) {
  context.read<PageViewCubit>().goToQuestion(index);
}
