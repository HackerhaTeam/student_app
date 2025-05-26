import 'package:flutter/material.dart';
import 'package:student_hackerha/core/functions/get_responsive_size.dart';
import 'package:student_hackerha/core/themes/extentions/app_backgrounds.dart';
import 'package:student_hackerha/core/themes/extentions/app_borders.dart';
import 'package:student_hackerha/core/themes/extentions/app_content.dart';
import 'package:student_hackerha/core/themes/typoGraphy/app_text_styles.dart';

class LessonCard extends StatelessWidget {
  const LessonCard({super.key});

  @override
  Widget build(BuildContext context) {
    var content = Theme.of(context).extension<AppContent>()!;
    final border = Theme.of(context).extension<AppBorders>()!;
    final background = Theme.of(context).extension<AppBackgrounds>()!;
    return Container(
      padding: EdgeInsets.all(16.w(context)),
      decoration: ShapeDecoration(
        color: background.onSurfacePrimary,
        shape: RoundedRectangleBorder(
          side: BorderSide(
            width: 1.w(context),
            color: border.transparent,
          ),
          borderRadius: BorderRadius.circular(12.w(context)),
        ),
      ),
      child: Row(
        children: [
          Expanded(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                FittedBox(
                  fit: BoxFit.scaleDown,
                  child: Text(
                    'الدرس الأول',
                    style:
                        context.xLabelSmall.copyWith(color: content.secondary),
                  ),
                ),
                const SizedBox(height: 2),
                FittedBox(
                  fit: BoxFit.scaleDown,
                  child: Text(
                    'التعامل مع الشروط',
                    style: context.xHeadingSmall,
                  ),
                ),
              ],
            ),
          ),
          SizedBox(width: 12.w(context)),
          FittedBox(
            fit: BoxFit.scaleDown,
            child: Text(
              '30:00 دقيقة',
              style: context.xLabelSmall.copyWith(color: content.secondary),
            ),
          ),
        ],
      ),
    );
  }
}
