import 'package:flutter/material.dart';
import 'package:phosphor_flutter/phosphor_flutter.dart';
import 'package:student_hackerha/core/functions/get_responsive_size.dart';
import 'package:student_hackerha/core/themes/extentions/app_content.dart';
import 'package:student_hackerha/core/themes/typoGraphy/app_text_styles.dart';
import 'package:student_hackerha/core/widgets/subject_card/custom_icon_text.dart';

class SubjectCardFooter extends StatelessWidget {
  const SubjectCardFooter({super.key, required this.isBank});
  final bool isBank;
  @override
  Widget build(BuildContext context) {
    final contentColor = Theme.of(context).extension<AppContent>()!;

    return Row(
      mainAxisAlignment: MainAxisAlignment.end,
      children: [
        if (isBank)
          Row(
            children: [
              CustomIconText(
                color: contentColor.negative,
                text: 'مجاني!',
                icon: PhosphorIcons.sealPercent(),
              ),
              SizedBox(width: 12.w(context)),
            ],
          ),
          Spacer(),
        SizedBox(
          width: 78.w(context),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Flexible(
                child: FittedBox(
                  fit: BoxFit.scaleDown,
                  child: Text(
                    isBank ? 'عرض التفاصيل' : 'تشغيل الدرس',
                    style: context.xLabelSmall
                        .copyWith(color: contentColor.brandPrimary),
                  ),
                ),
              ),
              Container(
                height: 1.h(context),
                color: contentColor.brandPrimary,
              ),
            ],
          ),
        ),
      ],
    );
  }
}
