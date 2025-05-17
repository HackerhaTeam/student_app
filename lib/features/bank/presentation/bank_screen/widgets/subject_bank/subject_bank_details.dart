import 'package:flutter/material.dart';
import 'package:phosphor_flutter/phosphor_flutter.dart';
import 'package:student_hackerha/core/functions/get_responsive_size.dart';
import 'package:student_hackerha/core/themes/extentions/app_content.dart';
import 'package:student_hackerha/core/themes/typoGraphy/app_text_styles.dart';
import 'package:student_hackerha/features/bank/presentation/bank_screen/widgets/subject_bank/subject_bank_icon_text.dart';

class SubjectBankDetails extends StatelessWidget {
  const SubjectBankDetails({super.key});

  @override
  Widget build(BuildContext context) {
    final contentColor = Theme.of(context).extension<AppContent>()!;

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          children: [
            BankIconText(text: '50 سؤال', icon: PhosphorIcons.sealQuestion()),
            SizedBox(width: 12.w(context)),
            BankIconText(text: '5 اختبارات', icon: PhosphorIcons.exam())
          ],
        ),
        SizedBox(height: 12.h(context)),
        Text('سنة أولى - فصل أول',
            style: context.xParagraphSmall.copyWith(
              color: contentColor.secondary,
            ))
      ],
    );
  }
}
