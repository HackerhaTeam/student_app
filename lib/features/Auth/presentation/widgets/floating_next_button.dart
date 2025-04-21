import 'package:flutter/material.dart';
import 'package:student_hackerha/core/functions/get_responsive_size.dart';
import 'package:student_hackerha/core/themes/extentions/app_backgrounds.dart';
import 'package:student_hackerha/core/themes/extentions/app_content.dart';
import 'package:student_hackerha/core/themes/typoGraphy/app_text_styles.dart';
import 'package:student_hackerha/core/widgets/custom_button.dart';

class FloatingNextButton extends StatelessWidget {
  const FloatingNextButton({
    super.key,
    required this.formKey,
    required this.onNext,
  });

  final GlobalKey<FormState> formKey;
  final VoidCallback onNext;

  @override
  Widget build(BuildContext context) {
    final backgrounds = Theme.of(context).extension<AppBackgrounds>()!;
    final content = Theme.of(context).extension<AppContent>()!;
    final styles = Theme.of(context).textTheme;
    return CustomButton(
      borderRadius: 16.r(context),
      color: backgrounds.primaryBrand,
      height: 44.h(context),
      width: 82.w(context),
      child: Text(
        "التالي >",
        style: styles.xLabelLarge.copyWith(color: content.brandDisabledPrimary),
      ),
      onPressed: () {
        if (formKey.currentState!.validate()) {
          onNext();
        }
      },
    );
  }
}
