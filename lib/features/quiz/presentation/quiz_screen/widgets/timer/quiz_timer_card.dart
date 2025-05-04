import 'package:flutter/material.dart';
import 'package:student_hackerha/core/functions/get_responsive_size.dart';
import 'package:student_hackerha/core/themes/extentions/app_backgrounds.dart';
import 'package:student_hackerha/features/quiz/presentation/shared/widgets/cards/custom_cards.dart';
import 'package:student_hackerha/features/quiz/presentation/quiz_screen/widgets/timer/quiz_timer_item.dart';

class QuizTimerCard extends StatelessWidget {
  const QuizTimerCard({
    super.key,
    required this.minutes,
    required this.seconds,
  });
  final String minutes;
  final String seconds;

  @override
  Widget build(BuildContext context) {
    final backgroundColor = Theme.of(context).extension<AppBackgrounds>()!;

    return CustomCard(
        width: 86.w(context),
        height: 30.h(context),
        backgroundColor: _getBackgrounColor(
            minutes: int.parse(minutes), backgroundColor: backgroundColor),
        child: QuizTimerItem(minutes: minutes, seconds: seconds));
  }

  Color _getBackgrounColor(
      {required int minutes, required AppBackgrounds backgroundColor}) {
    if (minutes < 2) {
      return backgroundColor.negativeSoft;
    } else {
      return backgroundColor.onSurfaceSecondary;
    }
  }
}
