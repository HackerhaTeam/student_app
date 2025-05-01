import 'package:flutter/material.dart';
import 'package:phosphor_flutter/phosphor_flutter.dart';
import 'package:student_hackerha/core/functions/get_responsive_size.dart';
import 'package:student_hackerha/core/themes/extentions/app_backgrounds.dart';
import 'package:student_hackerha/core/themes/extentions/app_borders.dart';
import 'package:student_hackerha/core/themes/extentions/app_content.dart';
import 'package:student_hackerha/core/themes/typoGraphy/app_text_styles.dart';
import 'package:student_hackerha/core/widgets/buttons/custom_button.dart';

class CourseWatchPageButtons extends StatelessWidget {
  const CourseWatchPageButtons({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    final background = Theme.of(context).extension<AppBackgrounds>()!;
    final content = Theme.of(context).extension<AppContent>()!;
    final border = Theme.of(context).extension<AppBorders>()!;
    final styles = context;
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Padding(
          padding: EdgeInsets.only(left: 16.w(context), right: 30.w(context)),
          child: CustomButton(
              borderColor: border.primaryBrand,
              color: background.surfacePrimary,
              borderRadius: 24.r(context),
              height: 56.h(context),
              width: 178.w(context),
              onPressed: () {
                Navigator.pop(context);
              },
              child: Text(
                "العودة للقائمة",
                style: styles.xLabelLarge,
              )),
        ),
        CustomButton(
            borderRadius: 24.r(context),
            color: background.primaryBrand,
            height: 56.h(context),
            width: 178.w(context),
            onPressed: () {},
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  "الدرس التالي",
                  style: styles.xLabelLarge
                      .copyWith(color: content.primaryInverted),
                ),
                SizedBox(
                  width: 4,
                ),
                PhosphorIcon(
                    color: content.primaryInverted, PhosphorIcons.caretRight())
              ],
            ))
      ],
    );
  }
}
