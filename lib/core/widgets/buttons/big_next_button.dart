import 'package:flutter/material.dart';
import 'package:phosphor_flutter/phosphor_flutter.dart';
import 'package:student_hackerha/core/functions/get_responsive_size.dart';
import 'package:student_hackerha/core/themes/extentions/app_backgrounds.dart';
import 'package:student_hackerha/core/themes/extentions/app_content.dart';
import 'package:student_hackerha/core/themes/typoGraphy/app_text_styles.dart';
import 'package:student_hackerha/core/widgets/buttons/custom_button.dart';

class BigNextButton extends StatelessWidget {
  const BigNextButton({
    super.key,
    required this.value,
    required this.onPressed,
    this.text,
  });

  final bool value;
  final String? text;
  final void Function() onPressed;
  @override
  Widget build(BuildContext context) {
    final styles = context;
    final backgrounds = Theme.of(context).extension<AppBackgrounds>()!;

    final content = Theme.of(context).extension<AppContent>()!;
    return CustomButton(
        disabledColor: backgrounds.brandDisabledPrimary,
        disabled: value ? false : true,
        borderRadius: 24.r(context),
        height: 56,
        width: 372.w(context),
        color: backgrounds.primaryBrand,
        onPressed: onPressed,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              text ?? "التالي",
              style: styles.xLabelLarge.copyWith(
                  color: content.brandDisabledPrimary,
                  fontWeight: FontWeight.w500),
            ),
            PhosphorIcon(PhosphorIcons.caretRight(),
                size: 16.w(context), color: content.brandDisabledPrimary),
          ],
        ));
  }
}
