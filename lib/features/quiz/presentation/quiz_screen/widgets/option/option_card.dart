import 'package:flutter/material.dart';
import 'package:student_hackerha/core/functions/get_responsive_size.dart';
import 'package:student_hackerha/core/themes/extentions/app_backgrounds.dart';
import 'package:student_hackerha/core/themes/extentions/app_borders.dart';
import 'package:student_hackerha/features/quiz/presentation/shared/widgets/cards/custom_cards.dart';
import 'package:student_hackerha/features/quiz/presentation/quiz_screen/widgets/option/option_card_item.dart';

class OptionCard extends StatelessWidget {
  const OptionCard({
    super.key,
    required this.isSelected, required this.choiceText,
  });

final String choiceText;
  final bool isSelected;
  @override
  Widget build(BuildContext context) {
    final backgroundColor = Theme.of(context).extension<AppBackgrounds>()!;
    final borderColor = Theme.of(context).extension<AppBorders>()!;
    return CustomCard(
        borderColor: _getBorderColor(isSelected, borderColor, backgroundColor),
        backgroundColor: backgroundColor.onSurfacePrimary,
        width: double.infinity,
        height: 52.h(context),
        child: OptionCardItem(isSelected: isSelected, choiceText: choiceText,));
  }

  Color _getBorderColor(
      bool isSelected, AppBorders borderColor, AppBackgrounds backgroundColor) {
    if (isSelected) {
      return borderColor.primaryBrand;
    } else {
      return borderColor.transparent;
    }
  }
}
