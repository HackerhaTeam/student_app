import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:student_hackerha/core/functions/get_responsive_size.dart';
import 'package:student_hackerha/features/quiz/presentation/manager/option_cubit.dart/option_cubit.dart';
import 'package:student_hackerha/features/quiz/presentation/manager/page_view_cubit/page_view_cubit.dart';
import 'package:student_hackerha/features/quiz/presentation/widgets/quiz/option/option_box.dart';

class OptionsListView extends StatelessWidget {
  const OptionsListView({
    super.key,
    required this.selectedAnswerIndex,
  });
  final int? selectedAnswerIndex;
  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: 4,
      itemBuilder: (context, index) {
        return Padding(
          padding: EdgeInsets.only(bottom: 16.h(context)),
          child: GestureDetector(
            onTap: () {
              final questionIndex = context.read<PageViewCubit>().state;
              final selectedAnswerIndex =
                  context.read<OptionCubit>().state[questionIndex];

              if (selectedAnswerIndex == index) {
                context.read<OptionCubit>().selectAnswer(
                      questionIndex: questionIndex,
                      answerIndex: null,
                    );
              } else {
                context.read<OptionCubit>().selectAnswer(
                      questionIndex: questionIndex,
                      answerIndex: index,
                    );
              }
            },
            child: OptionBox(isSelected: selectedAnswerIndex == index),
          ),
        );
      },
    );
  }
}
