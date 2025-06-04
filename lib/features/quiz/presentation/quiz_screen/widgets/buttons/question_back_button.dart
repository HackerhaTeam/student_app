import 'package:flutter/material.dart';
import 'package:student_hackerha/core/functions/get_responsive_size.dart';
import 'package:student_hackerha/core/themes/extentions/app_borders.dart';
import 'package:student_hackerha/core/themes/extentions/app_content.dart';
import 'package:student_hackerha/core/themes/typoGraphy/app_text_styles.dart';
import 'package:student_hackerha/core/widgets/custom_button.dart';
import 'package:student_hackerha/features/quiz/presentation/quiz_screen/handlers/buttons_handlers/on_previous_button_tap.dart';
import 'package:student_hackerha/features/quiz/presentation/quiz_screen/widgets/buttons/custom_back_button_item.dart';

class QuestionBackButton extends StatelessWidget {
  const QuestionBackButton({super.key});

  @override
  Widget build(BuildContext context) {
    final borderColor = Theme.of(context).extension<AppBorders>()!;
    final contentColor = Theme.of(context).extension<AppContent>()!;

    return CustomButton(
      borderRadius: 24.r(context),
      height: 56.h(context),
      width: double.infinity,
      color: Colors.transparent,
      borderColor: borderColor.primaryBrand,
      onPressed: () => onPreviousButtonTap(context),
      child: CustomBackButtonItem(
        textStyle: context.xLabelLarge.copyWith(color: contentColor.primary),
        text: 'السؤال السابق',
      ),
    );
  }
}
