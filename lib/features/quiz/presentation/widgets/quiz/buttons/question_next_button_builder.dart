import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:student_hackerha/features/quiz/presentation/manager/option_cubit.dart/option_cubit.dart';
import 'package:student_hackerha/features/quiz/presentation/manager/page_view_cubit/page_view_cubit.dart';
import 'package:student_hackerha/features/quiz/presentation/widgets/quiz/buttons/question_next_button.dart';

class QuestionNextButtonBuilder extends StatelessWidget {
  const QuestionNextButtonBuilder({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<OptionCubit, List<int?>>(builder: (context, state) {
      return QuestionNextButton(
        isSelected:  state[context.watch<PageViewCubit>().state.questionIndex] != null,
      );
    });
  }
}
