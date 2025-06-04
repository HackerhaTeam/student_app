import 'package:flutter/material.dart';
import 'package:student_hackerha/core/functions/get_responsive_size.dart';
import 'package:student_hackerha/features/quiz/presentation/result_screen/helpers/progress/get_progress_color.dart';
import 'package:student_hackerha/features/quiz/presentation/result_screen/widgets/animation/custom_fade_animation.dart';
import 'package:student_hackerha/features/quiz/presentation/result_screen/widgets/animation/custom_scale_animation.dart';
import 'package:student_hackerha/features/quiz/presentation/result_screen/widgets/motivation_phrase.dart/motivation_phrase.dart';
import 'package:student_hackerha/core/widgets/smooth_progress_indicator.dart';

class ScoreSummarySection extends StatelessWidget {
  const ScoreSummarySection({super.key, required this.percentage});
  final double percentage;
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        CustomScaleAnimation(
            duration: Duration(seconds: 2),
            child: SmoothProgressInidicator(
              progress: percentage,
              getProgressColor: (t, borderColor) {
                return getProgressColor(t: t, borderColor: borderColor);
              },
            )),
        SizedBox(height: 16.h(context)),
        CustomFadeAnimation(
          speedFade: const Duration(milliseconds: 1500),
          startFadeDuration: Duration(milliseconds: 2100),
          child: MotivationPhrase(percentage: percentage),
        ),
      ],
    );
  }
}
