import 'package:flutter/material.dart';
import 'package:phosphor_flutter/phosphor_flutter.dart';
import 'package:student_hackerha/core/functions/get_responsive_size.dart';
import 'package:student_hackerha/core/themes/extentions/app_backgrounds.dart';
import 'package:student_hackerha/core/themes/extentions/app_content.dart';
import 'package:student_hackerha/core/themes/typoGraphy/app_text_styles.dart';

class QuizTimer extends StatelessWidget {
  const QuizTimer({
    super.key,
    required this.minutes,
    required this.seconds,
  });
  final String minutes;
  final String seconds;

  @override
  Widget build(BuildContext context) {
    final backgroundColor = Theme.of(context).extension<AppBackgrounds>()!;
    final contentColor = Theme.of(context).extension<AppContent>()!;

    return Container(
      decoration: BoxDecoration(
          color: _getBackgrounColor(
              minutes: int.parse(minutes), backgroundColor: backgroundColor),
          borderRadius: BorderRadius.circular(12.r(context))),
      width: 86.w(context),
      height: 30.h(context),
      child: Center(
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            PhosphorIcon(
              textDirection: TextDirection.ltr,
              color: _getIconColor(
                  minutes: int.parse(minutes), contentColor: contentColor),
              PhosphorIcons.timer(),
              size: 16.w(context),
            ),
            SizedBox(
              width: 4.w(context),
            ),
            Text(
              '$minutes:$seconds',
              style: Theme.of(context).textTheme.xLabelMedium.copyWith(
                color: _getTextColor(minutes: int.parse(minutes), contentColor: contentColor)
              ),
            ),
          ],
        ),
      ),
    );
  }

  Color _getIconColor(
      {required int minutes, required AppContent contentColor}) {
    if (minutes < 2) {
      return contentColor.negative;
    } else {
      return contentColor.primary;
    }
  }

  Color _getBackgrounColor(
      {required int minutes, required AppBackgrounds backgroundColor}) {
    if (minutes < 2) {
      return backgroundColor.negativeSoft;
    } else {
      return backgroundColor.onSurfaceSecondary;
    }
  }

  Color _getTextColor(
      {required int minutes, required AppContent contentColor}) {
    if (minutes < 2) {
      return contentColor.negative;
    } else {
      return contentColor.primary;
    }
  }
}
