import 'package:flutter/material.dart';
import 'package:phosphor_flutter/phosphor_flutter.dart';
import 'package:student_hackerha/core/functions/get_responsive_size.dart';
import 'package:student_hackerha/core/themes/extentions/app_backgrounds.dart';
import 'package:student_hackerha/core/themes/typoGraphy/app_text_styles.dart';
import 'package:student_hackerha/core/widgets/custom_alert_dialog.dart';
import 'package:student_hackerha/core/widgets/custom_circle_icon_button.dart';
import 'package:student_hackerha/core/widgets/custom_icon_button.dart';
import 'package:student_hackerha/features/quiz/presentation/pages/widgets/time_out_quiz_dialog_actions.dart';

class QuizPageHeader extends StatelessWidget {
  const QuizPageHeader({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    final backgroundColor = Theme.of(context).extension<AppBackgrounds>()!;

    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        CustomIconButton(
            iconDataPhosphor: PhosphorIcons.list(), size: 24.w(context)),
        Text(
          'اختبار الشروط والحلقات',
          style: Theme.of(context).textTheme.xHeadingXLarge,
        ),
        CustomCircleIconButton(
          onTap: () {
            showDialog(
              context: context,
              builder: (BuildContext context) {
                return CustomAlertDialog(
                  canPop: true,
                  actions: [
                    TimeOutQuizDialogActions(),
                  ],
                  title: 'هل تود أن إنهاء الامتحان؟',
                  content:
                      'سيؤدي ذلك إلى إظهار النتائج النهائية. تأكد من مراجعة إجاباتك قبل اتخاذ هذه الخطوة!',
                );
              },
            );
          },
          size: 24.w(context),
          backgrounds: backgroundColor,
          iconDataPhosphor: PhosphorIcons.x(),
        ),
      ],
    );
  }
}
