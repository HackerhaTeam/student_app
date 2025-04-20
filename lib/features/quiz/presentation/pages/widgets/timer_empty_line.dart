import 'package:flutter/material.dart';
import 'package:student_hackerha/core/functions/get_responsive_size.dart';
import 'package:student_hackerha/core/themes/extentions/app_backgrounds.dart';

class TimerEmptyLine extends StatelessWidget {
  const TimerEmptyLine({super.key, required this.child});
  final Widget child;
  @override
  Widget build(BuildContext context) {
    final background = Theme.of(context).extension<AppBackgrounds>()!;
    return Container(
      width: double.infinity,
      height: 8.h(context),
      decoration: BoxDecoration(
        color: background.onSurfaceSecondary,
        borderRadius: BorderRadius.circular(40.r(context)),
      ),
      child: child,
    );
  }
}
