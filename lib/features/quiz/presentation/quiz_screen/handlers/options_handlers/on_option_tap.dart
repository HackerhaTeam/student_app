import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:student_hackerha/features/quiz/presentation/quiz_screen/manager/option_cubit.dart/option_cubit.dart';

void onOptionTap(
    {required BuildContext context,
    required int index,
    required bool isCorrection,
    required int questionIndex}) {
  if (!isCorrection) {
    final currentSelectedAnswer =
        context.read<OptionCubit>().state[questionIndex];

    final isSameAnswer = currentSelectedAnswer == index;

    context.read<OptionCubit>().selectAnswer(
          questionIndex: questionIndex,
          answerIndex: isSameAnswer ? null : index,
        );
  }
}
