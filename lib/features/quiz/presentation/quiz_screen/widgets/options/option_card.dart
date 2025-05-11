import 'package:flutter/material.dart';
import 'package:student_hackerha/core/functions/get_responsive_size.dart';
import 'package:student_hackerha/core/themes/extentions/app_backgrounds.dart';
import 'package:student_hackerha/core/themes/extentions/app_borders.dart';
import 'package:student_hackerha/features/quiz/presentation/quiz_screen/helpers/options/get_option_border_color.dart';
import 'package:student_hackerha/features/quiz/presentation/shared/widgets/cards/custom_cards.dart';
import 'package:student_hackerha/features/quiz/presentation/quiz_screen/widgets/options/option_card_item.dart';

class OptionCard extends StatelessWidget {
  const OptionCard({
    super.key,
    required this.isSelected,
    required this.optionText,
    required this.isCorrection,
    required this.optionIndex,
    required this.questionIndex,
  });
  final bool isCorrection;
  final String optionText;
  final bool isSelected;
  final int optionIndex;
  final int questionIndex;
  @override
  Widget build(BuildContext context) {
    final backgroundColor = Theme.of(context).extension<AppBackgrounds>()!;
    final borderColor = Theme.of(context).extension<AppBorders>()!;
    return CustomCard(
      borderColor: getOptionBorderColor(
        isSelected: isSelected,
        isCorrection: isCorrection,
        questionIndex: questionIndex,
        optionIndex: optionIndex,
        borderColor: borderColor,
      ),
      backgroundColor: backgroundColor.onSurfacePrimary,
      width: double.infinity,

      child: Padding(
        padding:  EdgeInsets.symmetric(vertical: 14.h(context)),
        child: OptionCardItem(
          isSelected: isSelected,
          optionText: optionText,
          isCorrection: isCorrection,
          optionIndex: optionIndex,
          questionIndex: questionIndex,
        ),
      ),
    );
  }
}
