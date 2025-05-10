import 'package:flutter/material.dart';
import 'package:phosphor_flutter/phosphor_flutter.dart';
import 'package:student_hackerha/core/themes/extentions/app_backgrounds.dart';
import 'package:student_hackerha/core/widgets/circled_splash_icon.dart';

class CourseInformationButtonsHeader extends StatelessWidget {
  const CourseInformationButtonsHeader({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        CircledSplashIcon(
          splachcolor:
              Theme.of(context).extension<AppBackgrounds>()!.containerStatic,
          iconDataPhosphor: PhosphorIcons.caretLeft(),
          onTap: () {},
        ),
        CircledSplashIcon(
          iconDataPhosphor: PhosphorIcons.bookmarkSimple(),
          onTap: () {},
          splachcolor:
              Theme.of(context).extension<AppBackgrounds>()!.containerStatic,
        )
      ],
    );
  }
}
