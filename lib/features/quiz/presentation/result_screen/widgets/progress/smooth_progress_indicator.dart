import 'package:flutter/material.dart';
import 'package:percent_indicator/circular_percent_indicator.dart';
import 'package:student_hackerha/core/functions/get_responsive_size.dart';
import 'package:student_hackerha/core/themes/extentions/app_backgrounds.dart';
import 'package:student_hackerha/core/themes/extentions/app_content.dart';
import 'package:student_hackerha/core/themes/typoGraphy/app_text_styles.dart';

class SmoothProgressInidicator extends StatelessWidget {
  final double percentage;

  const SmoothProgressInidicator({required this.percentage, super.key});

  @override
  Widget build(BuildContext context) {
    final backgroundColor = Theme.of(context).extension<AppBackgrounds>()!;
    final borderColor = Theme.of(context).extension<AppContent>()!;
    return TweenAnimationBuilder<double>(
      tween: Tween(begin: 0, end: percentage / 100),
      duration: Duration(seconds: 2),
      builder: (context, value, _) {
        final color = getGradientColor(value, borderColor);
        return CircularPercentIndicator(
          radius: 78.r(context),
          lineWidth: 16,
          percent: value,
          circularStrokeCap: CircularStrokeCap.round,
          backgroundColor: backgroundColor.onSurfaceSecondary,
          progressColor: color,
          center: Text(
            '${(value * 100).toInt()} %',
            style: context.xDisplayLarge,
          ),
        );
      },
    );
  }

  Color getGradientColor(double t, AppContent borderColor) {
    if (t < 0.5) {
      return Color.lerp(borderColor.negative, borderColor.warning, t * 2)!;
    } else {
      return Color.lerp(
          borderColor.warning, borderColor.success, (t - 0.5) * 2)!;
    }
  }
}
