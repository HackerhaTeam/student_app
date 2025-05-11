import 'package:flutter/material.dart';
import 'package:student_hackerha/core/functions/get_responsive_size.dart';
import 'package:student_hackerha/features/quiz/presentation/quiz_screen/handlers/options_handlers/on_option_tap.dart';
import 'package:student_hackerha/features/quiz/presentation/quiz_screen/widgets/options/option_card_builder.dart';

class OptionsListView extends StatelessWidget {
  const OptionsListView({
    super.key,
    required this.optionsList,
    required this.isCorrection,
    required this.questionIndex,
  });

  final bool isCorrection;
  final List<String> optionsList;
  final int questionIndex;

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      shrinkWrap: true,
      physics: NeverScrollableScrollPhysics(),
      itemCount: optionsList.length,
      itemBuilder: (context, index) {
        return Padding(
          padding: EdgeInsets.only(bottom: 16.h(context)),
          child: GestureDetector(
            onTap: () => onOptionTap(
                context: context,
                index: index,
                isCorrection: isCorrection,
                questionIndex: questionIndex),
            child: OptionCardBuilder(
              optionsList: optionsList,
              optionIndex: index,
              isCorrection: isCorrection,
              questionIndex: questionIndex,
            ),
          ),
        );
      },
    );
  }
}
