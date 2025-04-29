import 'package:flutter/material.dart';
import 'package:phosphor_flutter/phosphor_flutter.dart';
import 'package:student_hackerha/core/functions/get_responsive_size.dart';
import 'package:student_hackerha/core/themes/typoGraphy/app_text_styles.dart';
import 'package:student_hackerha/core/widgets/circled_splash_icon.dart';

class CoursesPageHeader extends StatelessWidget {
  const CoursesPageHeader({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(
          top: 20.h(context), right: 20.w(context), left: 20.w(context)),
      child: Row(
        children: [
          Text(
            'الرئيسية',
            style: context.xHeadingLarge,
          ),
          const Spacer(),
          CircledSplashIcon(
            iconDataPhosphor: PhosphorIcons.magnifyingGlass(),
            onTap: () {},
          )
        ],
      ),
    );
  }
}
