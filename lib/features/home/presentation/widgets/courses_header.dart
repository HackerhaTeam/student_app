import 'package:flutter/material.dart';
import 'package:student_hackerha/core/functions/get_responsive_size.dart';
import 'package:student_hackerha/core/themes/extentions/app_backgrounds.dart';
import 'package:student_hackerha/core/themes/typoGraphy/app_text_styles.dart';

class CoursesHeader extends StatelessWidget {
  const CoursesHeader({
    super.key,
    required this.title,
    required this.onPressed,
  });
  final void Function()? onPressed;
  final String title;
  @override
  Widget build(BuildContext context) {
    final AppBackgrounds background =
        Theme.of(context).extension<AppBackgrounds>()!;
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 20.w(context)),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            title,
            style: context.xHeadingLarge,
          ),
          Spacer(),
          TextButton(
            onPressed: onPressed,
            child: Text(
              "عرض الكل",
              style:
                  context.xLabelMedium.copyWith(color: background.primaryBrand),
            ),
          ),
        ],
      ),
    );
  }
}
