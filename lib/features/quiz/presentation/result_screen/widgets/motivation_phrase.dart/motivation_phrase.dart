import 'package:flutter/material.dart';
import 'package:student_hackerha/core/themes/typoGraphy/app_text_styles.dart';
import 'package:student_hackerha/features/quiz/presentation/result_screen/helpers/motivation_phrase/get_motivation_phrase_description.dart';
import 'package:student_hackerha/features/quiz/presentation/result_screen/helpers/motivation_phrase/get_motivation_phrase_title.dart';

class MotivationPhrase extends StatelessWidget {
  const MotivationPhrase({
    super.key,
    required this.percentage,
  });
  final double percentage;
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Text(
          getMotivationPhraseTitle(percentage: percentage),
          style: context.xDisplayLarge,
        ),
        Text(
            textAlign: TextAlign.center,
            getMotivationPhraseDescription(percentage: percentage),
            style: context.xParagraphLargeNormal),
      ],
    );
  }
}


