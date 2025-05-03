// Refactored version of the AccountTabPage code

import 'package:flutter/material.dart';
import 'package:student_hackerha/core/themes/typoGraphy/app_text_styles.dart';

class MuAccountHeader extends StatelessWidget {
  const MuAccountHeader({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(right: 20),
      child: Text(
        "حسابي",
        style: context.xHeadingXLarge,
      ),
    );
  }
}
