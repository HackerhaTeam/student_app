import 'package:flutter/material.dart';
import 'package:student_hackerha/core/themes/typoGraphy/app_text_styles.dart';

class SubjectCardTitle extends StatelessWidget {
  const SubjectCardTitle({
    super.key,
    required this.isBank,
  });
  final bool isBank;
  @override
  Widget build(BuildContext context) {
    return Text(isBank ? 'التحليل - 1' : 'البرمجة - 1',
        style: context.xDisplaySmall);
  }
}
