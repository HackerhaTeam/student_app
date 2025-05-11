import 'package:flutter/material.dart';
import 'package:student_hackerha/core/functions/get_responsive_size.dart';
import 'package:student_hackerha/core/themes/extentions/app_backgrounds.dart';
import 'package:student_hackerha/core/themes/extentions/app_content.dart';
import 'package:student_hackerha/features/quiz/presentation/quiz_screen/helpers/shared/get_question_status_background_color.dart';
import 'package:student_hackerha/features/quiz/presentation/quiz_screen/widgets/shared/status_question_item.dart';
import 'package:student_hackerha/features/quiz/presentation/shared/widgets/cards/custom_cards.dart';

class StatusQuestionCard extends StatelessWidget {
  const StatusQuestionCard(
      {super.key,
      required this.currentIndex,
      required this.isCorrection,
      this.lastIndexAccess,
      this.questionStatus});

  final int currentIndex;
  final bool isCorrection;
  final int? lastIndexAccess;
  final int? questionStatus;
  @override
  Widget build(BuildContext context) {
    final backgroundColor = Theme.of(context).extension<AppBackgrounds>()!;
    final contentColor = Theme.of(context).extension<AppContent>()!;

    return CustomCard(
      width: 76.w(context),
      height: 28.h(context),
      backgroundColor: getQuestionStatusBackgroundColor(
          isCorrection: isCorrection,
          questionStatus: questionStatus,
          questionIndex: currentIndex,
          lastIndexAccess: lastIndexAccess,
          backgroundColor: backgroundColor),
      child: StatusQuestionItem(
        lastIndexAccess: lastIndexAccess,
        questionStatus: questionStatus,
        currentIndex: currentIndex,
        contentColor: contentColor,
        isCorrection: isCorrection,
      ),
    );
  }
}
