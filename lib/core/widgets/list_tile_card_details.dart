
import 'package:flutter/material.dart';
import 'package:student_hackerha/core/functions/get_responsive_size.dart';
import 'package:student_hackerha/core/themes/extentions/app_content.dart';
import 'package:student_hackerha/core/themes/typoGraphy/app_text_styles.dart';

class ListTileCardDetails extends StatelessWidget {
  const ListTileCardDetails({
    super.key, required this.title, required this.subTitle,
  });

final String title;
final String subTitle;
  @override
  Widget build(BuildContext context) {
    
    final contentColor = Theme.of(context).extension<AppContent>()!;

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          title,
          style: context.xHeadingSmall,
        ),
        SizedBox(height: 4.h(context)),
        Text(
          subTitle,
          style: context.xLabelSmall.copyWith(color: contentColor.secondary),
        ),
      ],
    );
  }
}
