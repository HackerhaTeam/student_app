// Refactored version of the AccountTabPage code

import 'package:flutter/material.dart';
import 'package:phosphor_flutter/phosphor_flutter.dart';
import 'package:student_hackerha/core/functions/get_responsive_size.dart';
import 'package:student_hackerha/core/themes/extentions/app_backgrounds.dart';
import 'package:student_hackerha/core/themes/typoGraphy/app_text_styles.dart';
import 'package:student_hackerha/core/widgets/gradient_divider.dart';
import 'package:student_hackerha/features/home/presentation/widgets/myAccountPage/background_icon_my_account.dart';

class MyAccountMenuItem extends StatelessWidget {
  const MyAccountMenuItem(
      {super.key,
      required this.icon,
      required this.title,
      this.therIsBreake = true});
  final IconData icon;
  final String title;
  final bool? therIsBreake;

  @override
  Widget build(BuildContext context) {
    final background = Theme.of(context).extension<AppBackgrounds>()!;

    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 20.w(context)),
      child: Column(
        children: [
          Row(
            children: [
              BackgroundIconMyAccount(background: background, icon: icon),
              SizedBox(width: 16.w(context)),
              Text(title, style: context.xHeadingSmall),
              const Spacer(),
              PhosphorIcon(PhosphorIcons.caretRight()),
            ],
          ),
          if (therIsBreake!) ...[
            const SizedBox(height: 14),
            const GradientDivider(),
          ],
        ],
      ),
    );
  }
}
