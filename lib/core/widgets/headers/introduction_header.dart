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
    return Padding(
      padding: EdgeInsets.only(top: 26, bottom: 8),
      child: Row(
        children: [
          RoundedSquareIcon(
            iconSize: 24.s(context),
            icon: icon,
            size: 44.s(context),
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
