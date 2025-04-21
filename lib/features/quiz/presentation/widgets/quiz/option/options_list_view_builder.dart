import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:student_hackerha/features/quiz/presentation/manager/option_cubit.dart/option_cubit.dart';
import 'package:student_hackerha/features/quiz/presentation/manager/page_view_cubit/page_view_cubit.dart';
import 'package:student_hackerha/features/quiz/presentation/widgets/quiz/option/options_list_view.dart';

class OptionsListViewBuilder extends StatelessWidget {
  const OptionsListViewBuilder({super.key, l});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<OptionCubit, List<int?>>(
      builder: (context, answerList) {
        final questionIndex = context.read<PageViewCubit>().state;

        return OptionsListView(
          selectedAnswerIndex: answerList[questionIndex],
        );
      },
    );
  }
}
