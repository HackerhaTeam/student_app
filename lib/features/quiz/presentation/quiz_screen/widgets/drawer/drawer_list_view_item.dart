import 'package:flutter/material.dart';
import 'package:phosphor_flutter/phosphor_flutter.dart';
import 'package:student_hackerha/core/functions/get_responsive_size.dart';
import 'package:student_hackerha/core/themes/extentions/app_content.dart';
import 'package:student_hackerha/core/themes/typoGraphy/app_text_styles.dart';
import 'package:student_hackerha/features/quiz/presentation/quiz_screen/widgets/drawer/drawer_question_status_card.dart';

class DrawerListViewItem extends StatelessWidget {
  const DrawerListViewItem({
    super.key,
    required this.selectedIndex,
    required this.currentIndex,
    required this.questionsList,
    required this.lastIndexAccess,
  });

  final int selectedIndex;
  final int currentIndex;
  final List<String> questionsList;
  final int lastIndexAccess;

  @override
  Widget build(BuildContext context) {
    final contentColor = Theme.of(context).extension<AppContent>()!;

    return Container(
      height: 44.h(context),
      padding: EdgeInsets.only(
        right: 12.w(context),
      ),
      decoration: BoxDecoration(
        color: Colors.transparent,
      ),
      child: Row(
        children: [
          if (currentIndex == selectedIndex) ...[
            SizedBox(width: 5.w(context)),
            PhosphorIcon(
              PhosphorIcons.caretRight(),
              size: 16.s(context),
              color: contentColor.brandPrimary,
            ),
          ],
          SizedBox(width: 4.w(context)),
          Text(
            questionsList[currentIndex],
            style: context.xHeadingSmall
                .copyWith(color: _getTextColor(contentColor)),
          ),
          const Spacer(),
          DrawerQuestionStatusCard(currentIndex: currentIndex, lastIndexAccess: lastIndexAccess)
        ],
      ),
    );
  }

  Color _getTextColor(AppContent contentColor) {
    if (lastIndexAccess < currentIndex) {
      return contentColor.disabled;
    } else {
      return selectedIndex == currentIndex
          ? contentColor.brandPrimary
          : contentColor.primary;
    }
  }
}
