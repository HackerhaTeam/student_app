import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:phosphor_flutter/phosphor_flutter.dart';
import 'package:student_hackerha/core/functions/get_responsive_size.dart';
import 'package:student_hackerha/core/themes/extentions/app_content.dart';
import 'package:student_hackerha/core/themes/typoGraphy/app_text_styles.dart';
import 'package:student_hackerha/features/quiz/presentation/quiz_screen/helpers/drawer/get_drawer_question_title_color.dart';
import 'package:student_hackerha/features/quiz/presentation/quiz_screen/manager/option_cubit.dart/option_cubit.dart';
import 'package:student_hackerha/features/quiz/presentation/quiz_screen/widgets/shared/status_question_card.dart';

class DrawerListViewItem extends StatelessWidget {
  const DrawerListViewItem({
    super.key,
    required this.selectedIndex,
    required this.currentIndex,
    required this.questionTitles,
    required this.lastIndexAccess,
    required this.isCorrection,
  });

  final int selectedIndex;
  final int currentIndex;
  final List<String> questionTitles;
  final int lastIndexAccess;
  final bool isCorrection;

  bool get _isSelected => currentIndex == selectedIndex;

  @override
  Widget build(BuildContext context) {
    final contentColor = Theme.of(context).extension<AppContent>()!;
    final questionStatus = context.read<OptionCubit>().state[currentIndex];

    return Container(
      height: 44.h(context),
      padding: EdgeInsets.only(right: 12.w(context)),
      child: Row(
        children: [
          if (_isSelected)
            Padding(
              padding: EdgeInsets.only(right: 5.w(context)),
              child: PhosphorIcon(
                PhosphorIcons.caretRight(),
                size: 16.s(context),
                color: contentColor.brandPrimary,
              ),
            ),
          SizedBox(width: 4.w(context)),
          Text(
            questionTitles[currentIndex],
            style: context.xHeadingSmall.copyWith(
              color: getDrawerQuestionTitleColor(
                selectedIndex: selectedIndex,
                currentIndex: currentIndex,
                lastIndexAccess: lastIndexAccess,
                isCorrection: isCorrection,
                contentColor: contentColor,
              ),
            ),
          ),
          const Spacer(),
          StatusQuestionCard(
            questionStatus: questionStatus,
            currentIndex: currentIndex,
            isCorrection: isCorrection,
            lastIndexAccess: lastIndexAccess,
          )
        ],
      ),
    );
  }
}
