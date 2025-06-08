import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:student_hackerha/core/functions/get_responsive_size.dart';
import 'package:student_hackerha/core/themes/extentions/app_content.dart';
import 'package:student_hackerha/core/themes/typoGraphy/app_text_styles.dart';

class EmptyStateView extends StatelessWidget {
  const EmptyStateView({super.key});

  @override
  Widget build(BuildContext context) {
    final contentColor = Theme.of(context).extension<AppContent>()!;
    final isDarkMode = Theme.of(context).brightness == Brightness.dark;

    return Expanded(
      child: Column(
        children: [
          const Spacer(),
          SvgPicture.asset(isDarkMode
              ? 'assets/images/illustration_dark.svg'
              : 'assets/images/illustration_light.svg'),
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 51.w(context)),
            child: Column(
              children: [
                Text('لا محفوظات لديك هنا بعد.', style: context.xDisplayLarge),
                Text(
                  'ستظهر المحفوظات هنا بمجرد أن تقوم بحفظ درس من الدروس.',
                  textAlign: TextAlign.center,
                  style: context.xParagraphLargeNormal.copyWith(
                    color: contentColor.secondary,
                  ),
                ),
              ],
            ),
          ),
          const Spacer(),
        ],
      ),
    );
  }
}
