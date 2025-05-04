import 'package:flutter/material.dart';
import 'package:student_hackerha/core/themes/extentions/app_backgrounds.dart';
import 'package:student_hackerha/core/themes/extentions/app_borders.dart';
import 'package:student_hackerha/features/quiz/presentation/result_screen/widgets/animation/custom_fade_animation.dart';
import 'package:student_hackerha/features/quiz/presentation/result_screen/widgets/review_answer/review_answers_card_builder.dart';

class ReviewAnswersCard extends StatelessWidget {
  const ReviewAnswersCard({
    super.key,
    required this.report,
  });
  final Map<String, dynamic> report;

  @override
  Widget build(BuildContext context) {
    final backgroundColor = Theme.of(context).extension<AppBackgrounds>()!;
    final borderColor = Theme.of(context).extension<AppBorders>()!;
    return CustomFadeAnimation(
      speedFade: const Duration(milliseconds: 2000),
      startFadeDuration: Duration(milliseconds: 3500),
      child: ReviewAnswersCardBuilder(
        backgroundColor: backgroundColor,
        borderColor: borderColor,
        report: report,
      ),
    );
  }
}

