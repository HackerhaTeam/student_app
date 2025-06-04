import 'package:flutter/material.dart';
import 'package:student_hackerha/core/functions/get_responsive_size.dart';
import 'package:student_hackerha/core/themes/extentions/app_content.dart';
import 'package:student_hackerha/core/themes/typoGraphy/app_text_styles.dart';
import 'package:student_hackerha/features/quiz/presentation/quiz_screen/helpers/shared/get_question_status_text.dart';
import 'package:student_hackerha/features/quiz/presentation/quiz_screen/helpers/shared/get_question_status_text_color.dart';

class StatusQuestionItem extends StatelessWidget {
  const StatusQuestionItem({
    super.key,
    required this.currentIndex,
    required this.contentColor,
    required this.isCorrection,
    this.questionStatus,
    this.lastIndexAccess,
  });

  final int currentIndex;
  final AppContent contentColor;
  final bool isCorrection;
  final int? questionStatus;
  final int? lastIndexAccess;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(
          horizontal: 0.w(context), vertical: 0.h(context)),
      child: Center(
        child: Text(
          getQuestionStatusText(
              isCorrection: isCorrection,
              questionStatus: questionStatus,
              questionIndex: currentIndex,
              lastIndexAccess: lastIndexAccess),
          style: context.xLabelSmall.copyWith(
            color: getQuestionStatusTextColor(
                isCorrection: isCorrection,
                questionStatus: questionStatus,
                questionIndex: currentIndex,
                lastIndexAccess: lastIndexAccess,
                contentColor: contentColor),
          ),
        ),
      ),
    );
  }
}
