import 'package:flutter/material.dart';
import 'package:phosphor_flutter/phosphor_flutter.dart';
import 'package:student_hackerha/core/functions/get_responsive_size.dart';
import 'package:student_hackerha/core/themes/extentions/app_content.dart';
import 'package:student_hackerha/core/themes/typoGraphy/app_text_styles.dart';

class CustomIconText extends StatelessWidget {
  const CustomIconText(
      {super.key, this.color, required this.text, required this.icon});
  final Color? color;
  final String text;
  final IconData icon;
  @override
  Widget build(BuildContext context) {
    final contentColor = Theme.of(context).extension<AppContent>()!;

    return Row(
      children: [
        Directionality(
          textDirection: TextDirection.ltr,
          child: PhosphorIcon(
            icon,
            color: color ?? contentColor.secondary,
            size: 16.s(context),
          ),
        ),
        SizedBox(width: 4.w(context)),
        Text(
          text,
          style: context.xParagraphSmall.copyWith(
            color: color ?? contentColor.secondary,
          ),
        ),
      ],
    );
  }
}
