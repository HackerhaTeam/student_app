
import 'package:flutter/material.dart';
import 'package:student_hackerha/core/functions/get_responsive_size.dart';
import 'package:student_hackerha/core/themes/extentions/app_backgrounds.dart';
import 'package:student_hackerha/core/themes/extentions/app_borders.dart';
import 'package:student_hackerha/core/themes/extentions/app_content.dart';
import 'package:student_hackerha/core/themes/typoGraphy/app_text_styles.dart';
import 'package:student_hackerha/core/widgets/custom_button.dart';

class CloseQuizDialogActions extends StatelessWidget {
  const CloseQuizDialogActions({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    final backgroundColor = Theme.of(context).extension<AppBackgrounds>()!;
    final contentColor = Theme.of(context).extension<AppContent>()!;
    final borderColor = Theme.of(context).extension<AppBorders>()!;
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Expanded(
          child: CustomButton(
            borderColor: borderColor.primaryBrand,
            borderRadius: 16.r(context),
            color: Colors.transparent,
            width: 158.w(context),
            height: 46.h(context),
            child: Text(
              'العودة للاختبار',
              style: Theme.of(context).textTheme.xLabelMedium,
            ),
            onPressed: () {
              Navigator.pop(context);
            },
          ),
        ),
        SizedBox(width: 8.w(context)),
        Expanded(
          child: CustomButton(
            borderRadius: 16.r(context),
            color: backgroundColor.primaryBrand,
            width: 158.w(context),
            height: 46.h(context),
            child: Text(
              'إنهاء الاختبار',
              style: Theme.of(context)
                  .textTheme
                  .xLabelMedium
                  .copyWith(color: contentColor.primaryInverted),
            ),
            onPressed: () {},
          ),
        ),
      ],
    );
  }
}
