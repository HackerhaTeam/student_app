
import 'package:flutter/material.dart';
import 'package:student_hackerha/core/functions/get_responsive_size.dart';
import 'package:student_hackerha/core/themes/typoGraphy/app_text_styles.dart';
import 'package:student_hackerha/features/quiz/presentation/pages/widgets/options_list_view.dart';
import 'package:student_hackerha/features/quiz/presentation/pages/widgets/options_list_view_builder.dart';

class QuizBodySection extends StatelessWidget {
  const QuizBodySection({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Text(
          textAlign: TextAlign.right,
          'هنا نقوم بكتابة نص السؤال بشكل صريح وواضح للمستخدم ويقوم باختيار الإجابة أدناه بكل سلاسة من الخيارات أدناه.',
          style: Theme.of(context).textTheme.xParagraphXLarge,
        ),
        SizedBox(height: 24.h(context)),
        Expanded(
          child: OptionsListViewBuilder(),
        ),
      ],
    );
  }
}
