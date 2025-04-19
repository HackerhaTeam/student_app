import 'package:flutter/material.dart';
import 'package:phosphor_flutter/phosphor_flutter.dart';
import 'package:student_hackerha/core/functions/get_responsive_size.dart';
import 'package:student_hackerha/core/themes/extentions/app_backgrounds.dart';
import 'package:student_hackerha/core/themes/typoGraphy/app_text_styles.dart';
import 'package:student_hackerha/core/widgets/custom_circle_icon_button.dart';
import 'package:student_hackerha/core/widgets/custom_icon_button.dart';

class QuizPageBody extends StatelessWidget {
  const QuizPageBody({super.key});

  @override
  Widget build(BuildContext context) {
    var backgrounds = Theme.of(context).extension<AppBackgrounds>()!;
    return Padding(
      padding:  EdgeInsets.symmetric(horizontal: 20.w(context),vertical: 10.h(context)),
      child: Column(
        children: [
          Row(
  mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              CustomCircleIconButton(
                size: 24.w(context),
                backgrounds: backgrounds,
                iconDataPhosphor: PhosphorIcons.x(),
              ),
Text('اختبار الشروط والحلقات',

style: Theme.of(context).textTheme.bodySmall,)
,

CustomIconButton(iconDataPhosphor: PhosphorIcons.list(), size: 24.w(context))
            ],
          )
        ],
      ),
    );
  }
}
