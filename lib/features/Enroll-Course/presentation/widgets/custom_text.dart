import 'package:flutter/material.dart';
import 'package:student_hackerha/core/themes/extentions/app_content.dart';
import 'package:student_hackerha/core/themes/typoGraphy/app_text_styles.dart';

class CustomText extends StatelessWidget {
  const CustomText({
    super.key,
    required this.content,
    required this.title,
    this.subTitle,
    this.bullets,
  });

  final AppContent content;
  final String title;
  final String? subTitle;
  final List<String>? bullets;

  @override
  Widget build(BuildContext context) {
    final styles = context;
    List<TextSpan> children = [];

    children.add(
      TextSpan(
        text: title,
        style: styles.xLabelXLarge.copyWith(
          color: content.primary,
          fontWeight: FontWeight.bold,
        ),
      ),
    );

    if (subTitle != null && subTitle!.trim().isNotEmpty) {
      children.add(
        TextSpan(
          text: '$subTitle',
          style: styles.xParagraphLargeLose.copyWith(
            color: content.primary,
          ),
        ),
      );
    }

    if (bullets != null && bullets!.isNotEmpty) {
      for (var bullet in bullets!) {
        children.add(
          TextSpan(
            text: '  • $bullet\n',
            style: styles.xParagraphLargeLose.copyWith(
              color: content.primary,
            ),
          ),
        );
      }
    }

    return RichText(
      textAlign: TextAlign.start,
      text: TextSpan(children: children),
    );
  }
}
