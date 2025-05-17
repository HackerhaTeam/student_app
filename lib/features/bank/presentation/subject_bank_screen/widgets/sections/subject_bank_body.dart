import 'package:flutter/material.dart';
import 'package:student_hackerha/core/functions/get_responsive_size.dart';
import 'package:student_hackerha/core/themes/extentions/app_content.dart';
import 'package:student_hackerha/core/themes/typoGraphy/app_text_styles.dart';
import 'package:student_hackerha/features/bank/presentation/subject_bank_screen/widgets/subject_quizzes/subject_quizzes_view.dart';

class SubjectBankBody extends StatelessWidget {
  const SubjectBankBody({super.key});

  @override
  Widget build(BuildContext context) {
    final contentColor = Theme.of(context).extension<AppContent>()!;

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text('محتويات البنك',
            style:
                context.xHeadingSmall.copyWith(color: contentColor.secondary)),
        SizedBox(height: 12.h(context)),
        Expanded(child: SubjectQuizzesView())
      ],
    );
  }
}
