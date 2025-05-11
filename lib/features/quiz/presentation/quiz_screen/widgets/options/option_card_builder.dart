import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:student_hackerha/features/quiz/presentation/quiz_screen/manager/option_cubit.dart/option_cubit.dart';
import 'package:student_hackerha/features/quiz/presentation/quiz_screen/widgets/options/option_card.dart';

class OptionCardBuilder extends StatelessWidget {
  const OptionCardBuilder({
    super.key,
    required this.optionsList,
    required this.optionIndex,
    required this.isCorrection,
    required this.questionIndex,
  });

  final List<String> optionsList;
  final int optionIndex;
  final bool isCorrection;
  final int questionIndex;

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<OptionCubit, List<int?>>(
      builder: (context, state) {
        return OptionCard(
          
          isSelected: state[questionIndex] == optionIndex,
          optionText: optionsList[optionIndex],
          isCorrection: isCorrection,
          optionIndex: optionIndex,
          questionIndex: questionIndex,
        );
      },
    );
  }
}
