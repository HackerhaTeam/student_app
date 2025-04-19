import 'package:flutter/material.dart';
import 'package:phosphor_flutter/phosphor_flutter.dart';
import 'package:student_hackerha/core/functions/get_responsive_size.dart';
import 'package:student_hackerha/core/themes/extentions/app_backgrounds.dart';
import 'package:student_hackerha/core/widgets/custom_circle_icon_button.dart';

class QuizPageBody extends StatelessWidget {
  const QuizPageBody({super.key});

  @override
  Widget build(BuildContext context) {
    var backgrounds = Theme.of(context).extension<AppBackgrounds>()!;
    return Column(
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.end,
          children: [
            CustomCircleIconButton(
              size: 24.w(context),
              backgrounds: backgrounds,
              iconDataPhosphor: PhosphorIcons.x(),
            )
          ],
        )
      ],
    );
  }
}
