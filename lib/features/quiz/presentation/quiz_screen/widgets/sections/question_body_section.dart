import 'package:flutter/material.dart';
import 'package:student_hackerha/core/functions/get_responsive_size.dart';
import 'package:student_hackerha/core/themes/extentions/app_content.dart';
import 'package:student_hackerha/core/themes/typoGraphy/app_text_styles.dart';
import 'package:student_hackerha/features/quiz/presentation/quiz_screen/widgets/options/options_list_view.dart';

class QuestionBodySection extends StatelessWidget {
  const QuestionBodySection(
      {super.key,
      required this.questionText,
      required this.listChoices,
      required this.isCorrection,
      required this.questionIndex,
      this.note});
  final String questionText;
  final List<String> listChoices;
  final bool isCorrection;
  final int questionIndex;
  final String? note;
  @override
  Widget build(BuildContext context) {
    final contentColor = Theme.of(context).extension<AppContent>()!;
    return SingleChildScrollView(
      physics: const BouncingScrollPhysics(),
      child: Column(
        children: [
          SizedBox(
              width: double.infinity,
              child: Text(
                questionText,
                style: context.xParagraphXLarge,
              )),
          SizedBox(height: 24.h(context)),
          OptionsListView(
            optionsList: listChoices,
            isCorrection: isCorrection,
            questionIndex: questionIndex,
          ),
          SizedBox(height: 24.h(context)),
          if (note != null && isCorrection)
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'ملاحظة:',
                  style: context.xHeadingSmall.copyWith(
                    color: contentColor.success,
                  ),
                ),
                SizedBox(height: 8.h(context)),
                Text(note!, style: context.xParagraphLargeNormal),
              ],
            )
        ],
      ),
    );
  }
}
