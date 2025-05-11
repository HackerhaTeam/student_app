import 'package:flutter/material.dart';
import 'package:student_hackerha/core/functions/get_responsive_size.dart';
import 'package:student_hackerha/core/themes/extentions/app_backgrounds.dart';
import 'package:student_hackerha/core/widgets/custom_button.dart';
import 'package:student_hackerha/features/quiz/presentation/quiz_screen/handlers/buttons_handlers/on_finish_button_tap.dart';
import 'package:student_hackerha/features/quiz/presentation/quiz_screen/widgets/buttons/question_finish_button_item.dart';

class QuestionFinishButton extends StatelessWidget {
  const QuestionFinishButton({
    super.key,
    required this.isCorrection,
  });
  final bool isCorrection;
  @override
  Widget build(BuildContext context) {
    final backgroundColor = Theme.of(context).extension<AppBackgrounds>()!;

    return CustomButton(
      borderRadius: 24.r(context),
      height: 56.h(context),
      width: double.infinity,
      color: backgroundColor.primaryBrand,
      onPressed: () => onFinishButtonTap(context),
      child: QuestionFinishButtonItem(isCorrection: isCorrection),
    );
  }
}
