// Refactored version of the AccountTabPage code

import 'package:flutter/material.dart';
import 'package:student_hackerha/core/functions/get_responsive_size.dart';
import 'package:student_hackerha/core/themes/typoGraphy/app_text_styles.dart';

class MenuTitle extends StatelessWidget {
  const MenuTitle({super.key, required this.title});
  final String title;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(right: 20.w(context)),
      child: Text(
        title,
        style: context.xHeadingLarge,
      ),
    );
  }
}
