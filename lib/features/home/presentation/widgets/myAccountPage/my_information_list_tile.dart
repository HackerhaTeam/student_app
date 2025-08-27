// Refactored version of the AccountTabPage code

import 'package:flutter/material.dart';
import 'package:student_hackerha/core/functions/get_responsive_size.dart';
import 'package:student_hackerha/core/themes/typoGraphy/app_text_styles.dart';
import 'package:student_hackerha/features/home/presentation/widgets/myAccountPage/my_information_photo.dart';

class MyInformationListTile extends StatelessWidget {
  const MyInformationListTile({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding:  EdgeInsets.symmetric(horizontal: 20.w(context)),
      child: ListTile(contentPadding: EdgeInsets.zero,
        leading: const MyInformationPhoto(),
        title: const Text("محمد المحمد"),
        subtitle: Wrap(
          spacing: 4.0,
          runSpacing: 2.0,
          children: [
            Text("هندسة المعلوماتية",
                style: context.xParagraphMedium, overflow: TextOverflow.ellipsis),
            Text("- سنة رابعة",
                style: context.xParagraphMedium, overflow: TextOverflow.ellipsis),
            Text("- جامعة الشهباء",
                style: context.xParagraphMedium, overflow: TextOverflow.ellipsis),
          ],
        ),
      ),
    );
  }
}
