import 'package:flutter/material.dart';
import 'package:student_hackerha/core/functions/get_responsive_size.dart';
import 'package:student_hackerha/core/themes/extentions/app_backgrounds.dart';
import 'package:student_hackerha/core/themes/typoGraphy/app_text_styles.dart';

class CoursesHeader extends StatelessWidget {
  const CoursesHeader({
    super.key,
    required this.title,
  });

  final String title;
  @override
  Widget build(BuildContext context) {
    final AppBackgrounds background =
        Theme.of(context).extension<AppBackgrounds>()!;
    final textTheme = Theme.of(context).textTheme;
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 24.w(context)),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            title,
            style: Theme.of(context).textTheme.xHeadingLarge,
          ),
          Text(
            "عرض الكل",
            style:
                textTheme.xLabelMedium.copyWith(color: background.primaryBrand),
          ),
        ],
      ),
    );
  }
}
