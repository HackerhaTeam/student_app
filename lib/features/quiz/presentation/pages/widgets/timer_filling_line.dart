import 'package:flutter/material.dart';
import 'package:student_hackerha/core/functions/get_responsive_size.dart';
import 'package:student_hackerha/core/themes/extentions/app_content.dart';

class TimerFillingLine extends StatelessWidget {
  const TimerFillingLine({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    final contentColor = Theme.of(context).extension<AppContent>()!;
    return Container(
      height: 8.h(context),
      width: 50,
      decoration: BoxDecoration(
        color: contentColor.brandPrimary,
        borderRadius: BorderRadius.circular(40.r(context)),
      ),
    );
  }
}
