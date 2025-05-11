import 'package:flutter/material.dart';
import 'package:phosphor_flutter/phosphor_flutter.dart';
import 'package:student_hackerha/core/functions/get_responsive_size.dart';
import 'package:student_hackerha/core/themes/extentions/app_content.dart';
import 'package:student_hackerha/core/themes/typoGraphy/app_text_styles.dart';
import 'package:student_hackerha/features/quiz/presentation/quiz_screen/helpers/buttons/get_next_button_icon.dart';
import 'package:student_hackerha/features/quiz/presentation/quiz_screen/helpers/buttons/get_next_button_text.dart';

class CustomNextButtonItem extends StatelessWidget {
  const CustomNextButtonItem({
    super.key,
    required this.isSelected,
    required this.isCorrection,
  });
  final bool isCorrection;
  final bool isSelected;
  @override
  Widget build(BuildContext context) {
    final contentColor = Theme.of(context).extension<AppContent>()!;
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Text(
          getNextButtonText(
              isSelected: isSelected, isCorrection: isCorrection),
          style:
              context.xLabelLarge.copyWith(color: contentColor.primaryInverted),
        ),
        SizedBox(
          width: 4.w(context),
        ),
        PhosphorIcon(
          getNextButtonIcon(
              isSelected: isSelected, isCorrection: isCorrection),
          color: contentColor.primaryInverted,
          size: 24.s(context),
        )
      ],
    );
  }
}
