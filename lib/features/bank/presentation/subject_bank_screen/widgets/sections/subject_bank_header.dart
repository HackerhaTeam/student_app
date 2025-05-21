
import 'package:flutter/material.dart';
import 'package:phosphor_flutter/phosphor_flutter.dart';
import 'package:student_hackerha/core/functions/get_responsive_size.dart';
import 'package:student_hackerha/core/themes/extentions/app_backgrounds.dart';
import 'package:student_hackerha/core/themes/extentions/app_content.dart';
import 'package:student_hackerha/core/themes/typoGraphy/app_text_styles.dart';
import 'package:student_hackerha/features/bank/presentation/shared/widgets/custom_circle_icon.dart';

class SubjectBankHeader extends StatelessWidget {
  const SubjectBankHeader({super.key});

  @override
  Widget build(BuildContext context) {
    final backgroundColor = Theme.of(context).extension<AppBackgrounds>()!;
    final contentColor = Theme.of(context).extension<AppContent>()!;
    return Row(
      children: [
        CustomCircleIcon(
          circleSize: 44.s(context),
          icon: PhosphorIcons.caretRight(),
          iconSize: 24.s(context),
          backgroundColor: backgroundColor.onSurfaceSecondary,
          onTap: () {
            Navigator.pop(context);
          },
        ),
        SizedBox(width: 8.w(context)),
        Column(
          children: [
            Text(
              'البرمجة - 1',
              style: context.xHeadingLarge,
            ),
            SizedBox(height: 4.h(context)),
            Text(
              'قائمة بنك الأسئلة',
              style:
                  context.xLabelSmall.copyWith(color: contentColor.secondary),
            ),
          ],
        ),
        
        Spacer(),
        CustomCircleIcon(
          circleSize: 44.s(context),
          icon: PhosphorIcons.bookmarkSimple(),
          iconSize: 24.s(context),
          backgroundColor: backgroundColor.onSurfaceSecondary,
        ),
      ],
    );
  }
}
