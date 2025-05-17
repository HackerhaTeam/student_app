import 'package:flutter/material.dart';
import 'package:phosphor_flutter/phosphor_flutter.dart';
import 'package:student_hackerha/core/functions/get_responsive_size.dart';
import 'package:student_hackerha/core/themes/extentions/app_backgrounds.dart';
import 'package:student_hackerha/core/themes/extentions/app_borders.dart';
import 'package:student_hackerha/core/themes/extentions/app_content.dart';
import 'package:student_hackerha/features/bank/presentation/shared/widgets/custom_card.dart';
import 'package:student_hackerha/features/bank/presentation/subject_bank_screen/widgets/subject_quizzes/subject_quiz_details.dart';
import 'package:student_hackerha/features/bank/presentation/subject_bank_screen/widgets/subject_quizzes/subject_quiz_image.dart';

class SubjectQuiz extends StatelessWidget {
  const SubjectQuiz({super.key});

  @override
  Widget build(BuildContext context) {
    final backgroundColor = Theme.of(context).extension<AppBackgrounds>()!;
    final contentColor = Theme.of(context).extension<AppContent>()!;
    final borderColor = Theme.of(context).extension<AppBorders>()!;
    return CustomCard(
      borderColor: borderColor.transparent,
      backgroundColor: backgroundColor.onSurfacePrimary,
      child: Padding(
        padding: EdgeInsets.symmetric(
            vertical: 16.h(context), horizontal: 16.w(context)),
        child: Row(
          children: [
            SubjectQuizImage(),
            SizedBox(width: 8.w(context)),
            SubjectQuizDetails(),
            Spacer(),
            PhosphorIcon(
              textDirection: TextDirection.ltr,
              PhosphorIcons.checkCircle(PhosphorIconsStyle.fill),
              color: contentColor.success,
              size: 16.s(context),
            ),
          ],
        ),
      ),
    );
  }
}
