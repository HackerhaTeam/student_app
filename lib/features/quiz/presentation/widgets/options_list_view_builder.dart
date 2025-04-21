import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:student_hackerha/features/quiz/presentation/manager/option_cubit.dart/option_cubit.dart';
import 'package:student_hackerha/features/quiz/presentation/widgets/options_list_view.dart';

class OptionsListViewBuilder extends StatelessWidget {
  const OptionsListViewBuilder({super.key, l});
 
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<OptionCubit, int?>(
      builder: (context, selectedAnswerIndex) {
        return OptionsListView(
       
          selectedAnswerIndex: selectedAnswerIndex,
        );
      },
    );
  }
}
