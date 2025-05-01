import 'package:flutter/material.dart';
import 'package:phosphor_flutter/phosphor_flutter.dart';
import 'package:student_hackerha/core/functions/get_responsive_size.dart';
import 'package:student_hackerha/core/functions/navigation.dart';
import 'package:student_hackerha/core/themes/typoGraphy/app_text_styles.dart';
import 'package:student_hackerha/core/widgets/buttons/custom_icon_button.dart';
import 'package:student_hackerha/features/courses/presentation/pages/search_page.dart';

class CourseContentHeader extends StatelessWidget {
  const CourseContentHeader({
    super.key,
    required this.styles,
  });

  final BuildContext styles;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.start,
      children: [
        CustomIconButton(
          iconDataPhosphor: PhosphorIcons.caretRight(),
        ),
        SizedBox(
          width: 8.w(context),
        ),
        Text(
          "البرمجة (1)",
          style: styles.xHeadingXLarge,
        ),
        Spacer(),
        CustomIconButton(
          iconDataPhosphor: PhosphorIcons.magnifyingGlass(),
          onTap: () {
            context.navigateWithSlideTransition(SearchPage());
          },
        )
      ],
    );
  }
}
