import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:student_hackerha/features/quiz/presentation/quiz_screen/manager/option_cubit.dart/option_cubit.dart';
import 'package:student_hackerha/features/quiz/presentation/quiz_screen/widgets/buttons/question_next_button.dart';

class QuestionNextButtonBuilder extends StatelessWidget {
  const QuestionNextButtonBuilder(
      {super.key, required this.isCorrection, required this.questionIndex});
  final bool isCorrection;
  final int questionIndex;
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<OptionCubit, List<int?>>(
        builder: (context, statusListAnwers) {
      return QuestionNextButton(
        isSelected: statusListAnwers[questionIndex] != null,
        isCorrection: isCorrection,
      );
    });
  }
}
