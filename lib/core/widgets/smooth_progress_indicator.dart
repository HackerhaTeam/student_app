import 'package:flutter/material.dart';
import 'package:percent_indicator/circular_percent_indicator.dart';
import 'package:phosphor_flutter/phosphor_flutter.dart';
import 'package:student_hackerha/core/functions/get_responsive_size.dart';
import 'package:student_hackerha/core/themes/extentions/app_backgrounds.dart';
import 'package:student_hackerha/core/themes/extentions/app_content.dart';
import 'package:student_hackerha/core/themes/typoGraphy/app_text_styles.dart';

class SmoothProgressInidicator extends StatelessWidget {
  const SmoothProgressInidicator({
    required this.progress,
    super.key,
    this.isResulte = true,
    this.getProgressColor,
    this.icon,
  });
  final double progress;
  final bool isResulte;
  final IconData? icon;

  final Color Function(double t, AppContent borderColor)? getProgressColor;
  @override
  Widget build(BuildContext context) {
    final backgroundColor = Theme.of(context).extension<AppBackgrounds>()!;
    final contetColor = Theme.of(context).extension<AppContent>()!;

    return TweenAnimationBuilder<double>(
      tween: Tween(begin: 0, end: progress / 100),
      duration: Duration(seconds: 2),
      builder: (context, value, _) {
        final color = isResulte
            ? getProgressColor!(value, contetColor)
            : contetColor.success;
        return CircularPercentIndicator(
          radius: isResulte ? 78.r(context) : 32.r(context),
          lineWidth: isResulte ? 16 : 4,
          percent: value,
          circularStrokeCap: CircularStrokeCap.round,
          backgroundColor: backgroundColor.onSurfaceSecondary,
          progressColor: color,
          center: isResulte
              ? Text(
                  '${(value * 100).toInt()}%',
                  style: context.xDisplayLarge,
                )
              : Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Directionality(
                      textDirection: TextDirection.ltr,
                      child: PhosphorIcon(
                        icon!,
                        size: 18,
                        color: contetColor.secondary,
                      ),
                    ),
                    const SizedBox(height: 4),
                    Text(
                      "${(value * 100).toInt()}%",
                      style: context.xHeadingLarge.copyWith(
                          fontSize: 14.fs(context),
                          color: contetColor.secondary),
                    ),
                  ],
                ),
        );
      },
    );
  }
}
