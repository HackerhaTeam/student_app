
import 'package:flutter/material.dart';
import 'package:phosphor_flutter/phosphor_flutter.dart';
import 'package:student_hackerha/core/functions/get_responsive_size.dart';
import 'package:student_hackerha/core/themes/extentions/app_content.dart';
import 'package:student_hackerha/core/themes/typoGraphy/app_text_styles.dart';

class CustomButtonQuizItem extends StatelessWidget {
  const CustomButtonQuizItem({
    super.key,
    required this.contentColor,
  });

  final AppContent contentColor;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Text(
          'تخطي السؤال',
          style: Theme.of(context)
              .textTheme
              .xLabelLarge
              .copyWith(color: contentColor.primaryInverted),
        ),
        SizedBox(width: 4.w(context),),
      PhosphorIcon(PhosphorIcons.caretDoubleRight(),
      color: contentColor.primaryInverted,
      size: 24.w(context),
      )
      ],
    );
  }
}
