import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:student_hackerha/core/functions/get_responsive_size.dart';
import 'package:student_hackerha/features/quiz/presentation/quiz_screen/manager/option_cubit.dart/option_cubit.dart';
import 'package:student_hackerha/features/quiz/presentation/quiz_screen/manager/page_view_cubit/page_view_cubit.dart';
import 'package:student_hackerha/features/quiz/presentation/quiz_screen/widgets/option/option_card_builder.dart';

class OptionsListView extends StatelessWidget {
  const OptionsListView({
    super.key,
    required this.listChoices,
  });

  final List<String> listChoices;

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: listChoices.length,
      itemBuilder: (context, index) {
        return Padding(
          padding: EdgeInsets.only(bottom: 16.h(context)),
          child: GestureDetector(
            onTap: () => _onOptionTap(context, index),
            child: OptionCardBuilder(
              listChoices: listChoices,
              index: index,
            ),
          ),
        );
      },
    );
  }

  void _onOptionTap(BuildContext context, int index) {
    final questionIndex = context.read<PageViewCubit>().state.questionIndex;
    final currentSelectedAnswer =
        context.read<OptionCubit>().state[questionIndex];

    final isSameAnswer = currentSelectedAnswer == index;

    context.read<OptionCubit>().selectAnswer(
          questionIndex: questionIndex,
          answerIndex: isSameAnswer ? null : index,
        );
  }
}
