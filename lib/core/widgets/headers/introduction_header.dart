import 'package:flutter/material.dart';
import 'package:student_hackerha/core/functions/get_responsive_size.dart';
import 'package:student_hackerha/core/themes/typoGraphy/app_text_styles.dart';
import 'package:student_hackerha/core/widgets/rounded_square_icon.dart';

class IntroductionHeader extends StatelessWidget {
  const IntroductionHeader({
    super.key,
    required this.introText,
    required this.icon,
  });

  final IconData icon;
  final String introText;

  @override
  Widget build(BuildContext context) {
    // final content = Theme.of(context).extension<AppContent>()!;
    return Padding(
      padding: EdgeInsets.only(top: 26, bottom: 8),
      child: Row(
        children: [
          // Container(
          //   height: 44.w(context),
          //   width: 44.w(context),
          //   decoration: BoxDecoration(
          //       borderRadius: BorderRadius.circular(16.r(context)),
          //       color: content.brandPrimary),
          //   child: Center(
          //     child: Directionality(
          //       textDirection: TextDirection.ltr,
          //       child: PhosphorIcon(
          //           color: content.primaryInverted, size: 24.w(context), icon),
          //     ),
          //   ),
          // ),
          RoundedSquareIcon(
            icon: icon,
            size: 24.w(context),
          ),
          Text(
            introText,
            style: context.xHeadingXLarge,
          )
        ],
      ),
    );
  }
}
