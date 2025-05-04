
import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:student_hackerha/features/quiz/presentation/quiz_screen/manager/option_cubit.dart/option_cubit.dart';
import 'package:student_hackerha/features/quiz/presentation/quiz_screen/manager/page_view_cubit/page_view_cubit.dart';
import 'package:student_hackerha/features/quiz/presentation/quiz_screen/widgets/option/option_card.dart';

class OptionCardBuilder extends StatelessWidget {
  const OptionCardBuilder(
      {super.key, required this.listChoices, required this.index});
  final List<String> listChoices;
  final int index;
  @override
  Widget build(BuildContext context) {
    final questionIndex = context.read<PageViewCubit>().state.questionIndex;
    return BlocSelector<OptionCubit, List<int?>, bool>(
      selector: (state) {
        return state[questionIndex] == index;
      },
      builder: (context, isSelected) {
        return OptionCard(
          isSelected: isSelected,
          choiceText: listChoices[index],
        );
      },
    );
  }
}
