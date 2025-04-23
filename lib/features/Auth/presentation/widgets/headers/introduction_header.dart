import 'package:flutter/material.dart';
import 'package:phosphor_flutter/phosphor_flutter.dart';
import 'package:student_hackerha/core/functions/get_responsive_size.dart';
import 'package:student_hackerha/core/themes/extentions/app_content.dart';
import 'package:student_hackerha/core/themes/typoGraphy/app_text_styles.dart';

class IntroductionHeader extends StatelessWidget {
  const IntroductionHeader({
    super.key,
    required this.styles,
    required this.introText,
    required this.icon,
  });

  final TextTheme styles;
  final IconData icon;
  final String introText;

  @override
  Widget build(BuildContext context) {
    final content = Theme.of(context).extension<AppContent>()!;
    return Padding(
      padding: EdgeInsets.only(top: 26.h(context), bottom: 8.h(context)),
      child: Row(
        children: [
          Container(
            height: 44.h(context),
            width: 44.w(context),
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(16.r(context)),
                color: content.brandPrimary),
            child: Center(
              child: Directionality(
                textDirection: TextDirection.ltr,
                child: PhosphorIcon(
                    color: content.primaryInverted, size: 24.w(context), icon),
              ),
            ),
          ),
          Text(
            introText,
            style: styles.xHeadingXLarge,
          )
        ],
      ),
    );
  }
}
