
import 'package:flutter/material.dart';
import 'package:student_hackerha/core/functions/get_responsive_size.dart';
import 'package:student_hackerha/core/themes/typoGraphy/app_text_styles.dart';

class ArchivePageHeader extends StatelessWidget {
  const ArchivePageHeader({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 20.w(context)),
      child: Row(
        children: [
          Text(
            'المحفوظات',
            style: context.xHeadingLarge,
          )
        ],
      ),
    );
  }
}
