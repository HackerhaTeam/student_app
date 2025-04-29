import 'package:flutter/material.dart';
import 'package:phosphor_flutter/phosphor_flutter.dart';
import 'package:student_hackerha/core/functions/get_responsive_size.dart';
import 'package:student_hackerha/core/functions/navigation.dart';
import 'package:student_hackerha/core/themes/extentions/app_content.dart';
import 'package:student_hackerha/core/themes/typoGraphy/app_text_styles.dart';
import 'package:student_hackerha/core/widgets/circled_splash_icon.dart';
import 'package:student_hackerha/features/courses/presentation/pages/search_page.dart';

class YearPageHeader extends StatelessWidget {
  const YearPageHeader({
    super.key,
    required this.title,
  });
  final String title;
  @override
  Widget build(BuildContext context) {
    final content = Theme.of(context).extension<AppContent>()!;
    return Padding(
      padding: EdgeInsets.only(
          top: 20.h(context), right: 20.w(context), left: 20.w(context)),
      child: Row(
        children: [
          CircledSplashIcon(
            iconDataPhosphor: PhosphorIcons.caretLeft(),
            onTap: () {
              Navigator.pop(context);
            },
          ),
          SizedBox(
            width: 8.w(context),
          ),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                title,
                style: context.xHeadingLarge,
              ),
              Text(
                title,
                style: context.xLabelSmall.copyWith(color: content.secondary),
              )
            ],
          ),
          const Spacer(),
          CircledSplashIcon(
            iconDataPhosphor: PhosphorIcons.magnifyingGlass(),
            onTap: () {
              context.navigateWithSlideTransition(SearchPage());
            },
          )
        ],
      ),
    );
  }
}
