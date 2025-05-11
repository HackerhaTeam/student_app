import 'package:flutter/material.dart';
import 'package:student_hackerha/core/themes/extentions/app_backgrounds.dart';
import 'package:student_hackerha/features/quiz/presentation/result_screen/widgets/actions/actions_grid_view.dart';
import 'package:student_hackerha/features/quiz/presentation/result_screen/widgets/animation/custom_fade_slide_in.dart';


class ResultPageActionsSection extends StatelessWidget {
  const ResultPageActionsSection({super.key, required this.isBank});
  final bool isBank;
  @override
  Widget build(BuildContext context) {
    final backgroundColor = Theme.of(context).extension<AppBackgrounds>()!;

    return CustomFadeSlideIn(
      backgroundColor: backgroundColor,
      child: ActionsGridView(isBank: isBank),
    );
  }
}
