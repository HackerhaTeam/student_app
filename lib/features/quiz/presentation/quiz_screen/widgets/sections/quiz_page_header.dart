import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:phosphor_flutter/phosphor_flutter.dart';
import 'package:student_hackerha/core/functions/get_responsive_size.dart';
import 'package:student_hackerha/features/quiz/presentation/quiz_screen/handlers/on_exit_quiz.dart';
import 'package:student_hackerha/core/themes/extentions/app_backgrounds.dart';
import 'package:student_hackerha/core/themes/typoGraphy/app_text_styles.dart';
import 'package:student_hackerha/core/widgets/custom_circle_icon_button.dart';
import 'package:student_hackerha/features/quiz/presentation/quiz_screen/manager/switch_icon_cubit/switch_icon_cubit.dart';

class QuizPageHeader extends StatelessWidget {
  const QuizPageHeader({super.key});

  @override
  Widget build(BuildContext context) {
    final backgroundColor = Theme.of(context).extension<AppBackgrounds>()!;
    final animationController = context.read<SwitchIconCubit>().controller;

    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 20.w(context)),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          SizedBox(
            width: 44.w(context),
            height: 44.h(context),
            child: GestureDetector(
              onTap: () => _openDrawer(context),
              child: Center(
                child: AnimatedIcon(
                    size: 24.w(context),
                    icon: AnimatedIcons.menu_close,
                    progress: animationController),
              ),
            ),
          ),
          Text('اختبار الشروط والحلقات', style: context.xHeadingXLarge),
          CustomCircleIconButton(
            onTap: () => onExitQuiz(context),
            size: 24.s(context),
            backgrounds: backgroundColor,
            iconDataPhosphor: PhosphorIcons.x(),
          ),
        ],
      ),
    );
  }

  void _openDrawer(BuildContext context) {
    if (Scaffold.of(context).hasDrawer) {
      Scaffold.of(context).openDrawer();
    }
  }
}
