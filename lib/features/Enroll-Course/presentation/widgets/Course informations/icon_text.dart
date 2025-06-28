import 'package:flutter/material.dart';
import 'package:phosphor_flutter/phosphor_flutter.dart';
import 'package:student_hackerha/core/functions/get_responsive_size.dart';
import 'package:student_hackerha/core/themes/extentions/app_content.dart';
import 'package:student_hackerha/core/themes/typoGraphy/app_text_styles.dart';

class IconText extends StatelessWidget {
  const IconText({
    super.key,
    required this.icon,

    required this.title, this.mainAxisAlignment,
  });

  final PhosphorIconData icon;
  final MainAxisAlignment? mainAxisAlignment;
  
  final String title;

  @override
  Widget build(BuildContext context) {
    final content = Theme.of(context).extension<AppContent>()!;
    
    return Row(mainAxisAlignment:mainAxisAlignment??MainAxisAlignment.center,
      children: [
        PhosphorIcon(
          icon,
          size: 16.w(context),
          color: content.secondary,
        ),
        SizedBox(
          width: 4.w(context),
        ),
        Text(
          title,
          style: context.xLabelSmall,
          maxLines: 1,
          overflow: TextOverflow.ellipsis,
          textAlign: TextAlign.center,
        ),
      ],
    );
  }
}
