import 'package:flutter/material.dart';
import 'package:student_hackerha/core/functions/get_responsive_size.dart';
import 'package:student_hackerha/core/themes/extentions/app_backgrounds.dart';
import 'package:student_hackerha/core/themes/extentions/app_borders.dart';
import 'package:student_hackerha/core/widgets/subject_card/subject_card_details.dart';
import 'package:student_hackerha/core/widgets/subject_card/subject_card_footer.dart';
import 'package:student_hackerha/core/widgets/subject_card/subject_card_image.dart';
import 'package:student_hackerha/core/widgets/subject_card/subject_card_title.dart';
import 'package:student_hackerha/core/widgets/custom_card.dart';

class SubjectCard extends StatelessWidget {
  const SubjectCard({super.key, this.isBank = true});
  final bool isBank;
  @override
  Widget build(BuildContext context) {
    final backgroundColor = Theme.of(context).extension<AppBackgrounds>()!;
    final borderColor = Theme.of(context).extension<AppBorders>()!;
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        CustomCard(
          borderColor: borderColor.transparent,
          backgroundColor: backgroundColor.onSurfacePrimary,
          width: double.infinity,
          child: Padding(
            padding: EdgeInsets.symmetric(
                horizontal: 12.w(context), vertical: 13.h(context)),
            child: Row(
              children: [
                SubjectCardImage(),
                SizedBox(width: 16.w(context)),
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      SubjectCardTitle(isBank: isBank),
                      SizedBox(height: 8.h(context)),
                      SubjectCardDetails(isBank: isBank),
                      SizedBox(height: 8.h(context)),
                      SubjectCardFooter(isBank: isBank),
                    ],
                  ),
                )
              ],
            ),
          ),
        ),
      ],
    );
  }
}
