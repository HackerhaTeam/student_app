import 'package:flutter/material.dart';
import 'package:phosphor_flutter/phosphor_flutter.dart';
import 'package:student_hackerha/core/functions/get_responsive_size.dart';
import 'package:student_hackerha/core/themes/extentions/app_content.dart';
import 'package:student_hackerha/core/themes/typoGraphy/app_text_styles.dart';
import 'package:student_hackerha/features/quiz/presentation/quiz_screen/helpers/timer/get_timer_icon_color.dart';
import 'package:student_hackerha/features/quiz/presentation/quiz_screen/helpers/timer/get_timer_text_color.dart';

class QuizTimerItem extends StatelessWidget {
  const QuizTimerItem(
      {super.key, required this.minutes, required this.seconds});
  final String minutes;
  final String seconds;
  @override
  Widget build(BuildContext context) {
    final contentColor = Theme.of(context).extension<AppContent>()!;

    return Center(
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          PhosphorIcon(
            textDirection: TextDirection.ltr,
            color: getTimerIconColor(
                minutes: int.parse(minutes), contentColor: contentColor),
            PhosphorIcons.timer(),
            size: 16.s(context),
          ),
          SizedBox(
            width: 4.w(context),
          ),
          Text(
            '$minutes:$seconds',
            style: context.xLabelMedium.copyWith(
                color: getTimerTextColor(
                    minutes: int.parse(minutes), contentColor: contentColor)),
          ),
        ],
      ),
    );
  }
}
