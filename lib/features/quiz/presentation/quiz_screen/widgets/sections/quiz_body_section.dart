import 'package:flutter/material.dart';
import 'package:student_hackerha/core/functions/get_responsive_size.dart';
import 'package:student_hackerha/core/themes/typoGraphy/app_text_styles.dart';
import 'package:student_hackerha/features/quiz/presentation/quiz_screen/widgets/option/options_list_view.dart';

class QuizBodySection extends StatelessWidget {
  const QuizBodySection(
      {super.key, required this.questionText, required this.listChoices});
  final String questionText;
  final List<String> listChoices;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Row(
          children: [
            Text(
                textAlign: TextAlign.right,
                questionText,
                style: context.xParagraphXLarge),
          ],
        ),
        SizedBox(height: 24.h(context)),
        Expanded(
          child: OptionsListView(
            listChoices: listChoices,
          ),
        ),
      ],
    );
  }
}
