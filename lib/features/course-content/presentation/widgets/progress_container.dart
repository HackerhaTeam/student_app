import 'package:flutter/material.dart';
import 'package:student_hackerha/core/functions/get_responsive_size.dart';
import 'package:student_hackerha/core/themes/extentions/app_backgrounds.dart';
import 'package:student_hackerha/core/themes/extentions/app_borders.dart';
import 'package:student_hackerha/core/themes/extentions/app_content.dart';
import 'package:student_hackerha/core/themes/typoGraphy/app_text_styles.dart';
import 'package:student_hackerha/core/widgets/smooth_progress_indicator.dart';

class ProgressContainer extends StatelessWidget {
  final double progress;
  final IconData icon;
  final String title;
  const ProgressContainer({
    super.key,
    required this.progress,
    required this.icon,
    required this.title,
  });

  @override
  Widget build(BuildContext context) {
    final border = Theme.of(context).extension<AppBorders>()!;
    final background = Theme.of(context).extension<AppBackgrounds>()!;
    final content = Theme.of(context).extension<AppContent>()!;
    final styles = context;
    return Container(
      height: 118,
      width: 112.w(context),
      decoration: BoxDecoration(
          color: background.onSurfacePrimary,
          borderRadius: BorderRadius.circular(12.r(context)),
          border: Border.all(color: border.transparent)),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          SmoothProgressInidicator(
            progress: progress,
            isResulte: false,
            icon: icon,
          ),
          SizedBox(
            height: 4,
          ),
          Text(
            title,
            style: styles.xHeadingSmall.copyWith(color: content.secondary),
          )
        ],
      ),
    );
  }
}
