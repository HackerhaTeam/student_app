
import 'package:flutter/material.dart';
import 'package:student_hackerha/core/functions/get_responsive_size.dart';
import 'package:student_hackerha/core/themes/extentions/app_backgrounds.dart';
import 'package:student_hackerha/core/themes/extentions/app_content.dart';
import 'package:student_hackerha/core/widgets/custom_button.dart';
import 'package:student_hackerha/features/quiz/presentation/widgets/custom_button_quiz_item.dart';

class QuizButtomSection extends StatelessWidget {
  const QuizButtomSection({super.key});

  @override
  Widget build(BuildContext context) {
    final backgroundColor = Theme.of(context).extension<AppBackgrounds>()!;
    final contentColor = Theme.of(context).extension<AppContent>()!;
    return Column(
      children: [
        CustomButton(
            borderRadius: 24.r(context),
            height: 56.h(context),
            width: double.infinity,
            color: backgroundColor.primaryBrand,
            onPressed: () {},
            child: CustomButtonQuizItem(contentColor: contentColor)),
      ],
    );
  }
}
