import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:student_hackerha/core/functions/get_responsive_size.dart';
import 'package:student_hackerha/core/themes/extentions/app_content.dart';
import 'package:student_hackerha/core/themes/typoGraphy/app_text_styles.dart';
import 'package:student_hackerha/core/themes/typoGraphy/app_typography.dart';
import 'package:student_hackerha/features/quiz/presentation/quiz_screen/manager/switch_icon_cubit/switch_icon_cubit.dart';

class QuizDrawerHeader extends StatelessWidget {
  const QuizDrawerHeader({super.key});

  @override
  Widget build(BuildContext context) {
    final contentColor = Theme.of(context).extension<AppContent>()!;
    final animationController = context.watch<SwitchIconCubit>().controller;

    return GestureDetector(
      onTap: () {
        Navigator.pop(context);
      },
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          
          SizedBox(
            width: 44.w(context),
            height: 44.h(context),
            child: Center(
              child: AnimatedIcon(
                size: 24.s(context),
                icon: AnimatedIcons.menu_close,
                color: contentColor.brandPrimary,
                progress: animationController,
              ),
            ),
          ),
          Text(
            'إغلاق',
            style: context.xLabelLarge.copyWith(
                fontWeight: AppTypography.regular,
                color: contentColor.brandPrimary),
          ),
        ],
      ),
    );
  }
}
