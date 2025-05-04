import 'package:flutter/material.dart';
import 'package:student_hackerha/core/themes/typoGraphy/app_text_styles.dart';
import 'package:student_hackerha/features/quiz/presentation/result_screen/widgets/animation/custom_fade_animation.dart';

class ReviewTitle extends StatelessWidget {
  const ReviewTitle({super.key});

  @override
  Widget build(BuildContext context) {
    return CustomFadeAnimation(
      speedFade: const Duration(milliseconds: 1700),
      startFadeDuration: Duration(milliseconds: 3000),
      child: Row(
        children: [
          Text('مراجعة الإجابات', style: context.xHeadingLarge),
        ],
      ),
    );
  }
}
