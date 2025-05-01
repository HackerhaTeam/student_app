import 'package:flutter/material.dart';
import 'package:phosphor_flutter/phosphor_flutter.dart';
import 'package:student_hackerha/core/functions/get_responsive_size.dart';
import 'package:student_hackerha/core/themes/extentions/app_backgrounds.dart';
import 'package:student_hackerha/core/themes/extentions/app_content.dart';
import 'package:student_hackerha/core/themes/typoGraphy/app_text_styles.dart';
import 'package:student_hackerha/core/widgets/buttons/custom_button.dart';

class FloatingNextButton extends StatelessWidget {
  const FloatingNextButton({
    super.key,
    required this.formKey,
    required this.onNext,
    this.disabled,
    this.buttonText,
    this.width,
  });

  final GlobalKey<FormState> formKey;
  final VoidCallback onNext;
  final bool? disabled;
  final String? buttonText;
  final double? width;
  @override
  Widget build(BuildContext context) {
    final backgrounds = Theme.of(context).extension<AppBackgrounds>()!;
    final content = Theme.of(context).extension<AppContent>()!;
    final styles = context;
    return CustomButton(
      disabledColor: backgrounds.brandDisabledPrimary,
      disabled: disabled ?? false,
      borderRadius: 16.r(context),
      color: backgrounds.primaryBrand,
      height: 44.h(context),
      width: width ?? 82.w(context),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(
            buttonText ?? "التالي",
            style: styles.xLabelLarge
                .copyWith(color: content.brandDisabledPrimary),
          ),
          SizedBox(
            width: 4.w(context),
          ),
          PhosphorIcon(PhosphorIcons.caretRight(),
              size: 16.w(context), color: content.brandDisabledPrimary),
        ],
      ),
      onPressed: () {
        if (formKey.currentState!.validate()) {
          onNext();
        }
      },
    );
  }
}
