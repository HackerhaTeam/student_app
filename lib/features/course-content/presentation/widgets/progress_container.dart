import 'package:flutter/material.dart';
import 'package:phosphor_flutter/phosphor_flutter.dart';
import 'package:student_hackerha/core/functions/get_responsive_size.dart';
import 'package:student_hackerha/core/themes/extentions/app_backgrounds.dart';
import 'package:student_hackerha/core/themes/extentions/app_borders.dart';
import 'package:student_hackerha/core/themes/extentions/app_content.dart';
import 'package:student_hackerha/core/themes/typoGraphy/app_text_styles.dart';

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
          TweenAnimationBuilder<double>(
            tween: Tween(begin: 0, end: progress),
            duration: const Duration(milliseconds: 1500),
            curve: Curves.easeOut,
            builder: (context, animatedProgress, child) {
              return SizedBox(
                height: 64,
                width: 64,
                child: Stack(
                  alignment: Alignment.center,
                  children: [
                    // الدائرة الخلفية الفاضية
                    SizedBox(
                      height: 64,
                      width: 64,
                      child: CircularProgressIndicator(
                        value: 1,
                        strokeWidth: 4,
                        backgroundColor: background.onSurfacePrimary,
                        valueColor:
                            AlwaysStoppedAnimation<Color>(Colors.transparent),
                      ),
                    ),
                    // الدائرة الأمامية المتحركة
                    SizedBox(
                      height: 64,
                      width: 64,
                      child: CircularProgressIndicator(
                        value: animatedProgress / 100, // نسبة التقدم المتغيرة
                        strokeWidth: 4,
                        backgroundColor: Colors.grey[200],
                        valueColor: AlwaysStoppedAnimation<Color>(
                          border.success,
                        ),
                      ),
                    ),

                    Column(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        Directionality(
                          textDirection: TextDirection.ltr,
                          child: PhosphorIcon(
                            icon,
                            size: 20,
                            color: content.secondary,
                          ),
                        ),
                        const SizedBox(height: 4),
                        Text(
                          "${animatedProgress.toInt()}%",
                          style: styles.xHeadingLarge.copyWith(
                              fontSize: 16.fs(context),
                              color: content.secondary),
                        ),
                      ],
                    ),
                  ],
                ),
              );
            },
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
