import 'package:flutter/material.dart';
import 'package:phosphor_flutter/phosphor_flutter.dart';
import 'package:student_hackerha/core/functions/get_responsive_size.dart';
import 'package:student_hackerha/core/themes/extentions/app_backgrounds.dart';
import 'package:student_hackerha/core/themes/extentions/app_content.dart';
import 'package:student_hackerha/core/themes/typoGraphy/app_text_styles.dart';
import 'package:student_hackerha/core/widgets/buttons/custom_button.dart';

class ActiveCourseButton extends StatelessWidget {
  const ActiveCourseButton({
    super.key, this.width,
  });
  final double? width;
  @override
  Widget build(BuildContext context) {
    var content = Theme.of(context).extension<AppContent>()!;
    var backgrounds = Theme.of(context).extension<AppBackgrounds>()!;
    return Center(
          child: SizedBox(
            height: 56,
            width:width?? 372.w(context),
            child: CustomButton(
              borderRadius: 24.w(context),
              color: backgrounds.primaryBrand,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    "فعل الدورة الآن",
                    style: context.xLabelLarge
                        .copyWith(color: content.primaryInverted),
                  ),
                  SizedBox(width: 4.w(context)),
                  PhosphorIcon(
                    PhosphorIcons.caretRight(),
                    color: content.primaryInverted,
                  ),
                ],
              ),
              onPressed: () {},
            ),
          ),
        );
  }
}
