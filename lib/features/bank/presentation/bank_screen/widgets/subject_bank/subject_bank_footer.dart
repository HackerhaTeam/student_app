


import 'package:flutter/material.dart';
import 'package:phosphor_flutter/phosphor_flutter.dart';
import 'package:student_hackerha/core/functions/get_responsive_size.dart';
import 'package:student_hackerha/core/themes/extentions/app_content.dart';
import 'package:student_hackerha/core/themes/typoGraphy/app_text_styles.dart';
import 'package:student_hackerha/features/bank/presentation/bank_screen/widgets/subject_bank/subject_bank_icon_text.dart';

class SubjectBankFooter extends StatelessWidget {
  const SubjectBankFooter({super.key});

  @override
  Widget build(BuildContext context) {
    final contentColor = Theme.of(context).extension<AppContent>()!;

    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Row(
          children: [
            BankIconText(
              color: contentColor.negative,
              text: 'مجاني!',
              icon: PhosphorIcons.sealPercent(),
            ),
            SizedBox(width: 12.w(context)),
          ],
        ),
        SizedBox(
          width: 78.w(context),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Flexible(
                child: FittedBox(
                  fit: BoxFit.scaleDown,
                  child: Text(
                    'عرض التفاصيل',
                    style: context.xLabelSmall
                        .copyWith(color: contentColor.brandPrimary),
                  ),
                ),
              ),
              Container(
                height: 2,
                color: contentColor.brandPrimary,
              ),
            ],
          ),
        ),
      ],
    );
  }
}
