import 'package:flutter/material.dart';
import 'package:student_hackerha/core/functions/get_responsive_size.dart';
import 'package:student_hackerha/core/themes/extentions/app_backgrounds.dart';
import 'package:student_hackerha/core/widgets/custom_card.dart';

class EmptyLinearProgress extends StatelessWidget {
  const EmptyLinearProgress({super.key, required this.child});
  final Widget child;
  @override
  Widget build(BuildContext context) {
    final background = Theme.of(context).extension<AppBackgrounds>()!;
    return CustomCard(
      backgroundColor: background.onSurfaceSecondary,
      width: double.infinity,
      height: 8.h(context),
      borderRadius: 40.r(context),
      child: child,
    );
  }
}
