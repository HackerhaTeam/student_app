import 'package:flutter/material.dart';
import 'package:student_hackerha/core/functions/get_responsive_size.dart';
import 'package:student_hackerha/core/themes/extentions/app_backgrounds.dart';
import 'package:student_hackerha/core/themes/extentions/app_borders.dart';
import 'package:student_hackerha/core/themes/typoGraphy/app_text_styles.dart';
import 'package:student_hackerha/core/widgets/custom_button.dart';

class ConnectWithUsButton extends StatelessWidget {
  const ConnectWithUsButton({
    super.key,
    required this.backgrounds,
    required this.border,
  });

  final AppBackgrounds backgrounds;
  final AppBorders border;

  @override
  Widget build(BuildContext context) {
    return CustomButton(
        borderRadius: 24.r(context),
        height: 56.h(context),
        width: 372.w(context),
        color: backgrounds.surfacePrimary,
        borderColor: border.primaryBrand,
        child: Text(
          "تواصل معنا للحصول على الكود",
          style: context.xLabelLarge,
        ),
        onPressed: () {});
  }
}
