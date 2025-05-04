import 'package:flutter/material.dart';
import 'package:student_hackerha/core/functions/get_responsive_size.dart';
import 'package:student_hackerha/core/themes/typoGraphy/app_text_styles.dart';

class ResultPageHeaderSection extends StatelessWidget {
  const ResultPageHeaderSection({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        SizedBox(width: 8.w(context)),
        Text('النتيجة النهائية!', style: context.xHeadingXLarge)
      ],
    );
  }
}
