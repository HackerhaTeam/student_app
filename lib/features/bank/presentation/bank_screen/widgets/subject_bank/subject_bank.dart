import 'package:flutter/material.dart';
import 'package:student_hackerha/core/functions/get_responsive_size.dart';
import 'package:student_hackerha/core/themes/extentions/app_backgrounds.dart';
import 'package:student_hackerha/core/themes/extentions/app_borders.dart';
import 'package:student_hackerha/features/bank/presentation/bank_screen/widgets/subject_bank/subject_bank_details.dart';
import 'package:student_hackerha/features/bank/presentation/bank_screen/widgets/subject_bank/subject_bank_footer.dart';
import 'package:student_hackerha/features/bank/presentation/bank_screen/widgets/subject_bank/subject_bank_image.dart';
import 'package:student_hackerha/features/bank/presentation/bank_screen/widgets/subject_bank/subject_bank_title.dart';
import 'package:student_hackerha/core/widgets/custom_card.dart';

class SubjectBank extends StatelessWidget {
  const SubjectBank({super.key});

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
                SubjectBankImage(),
                SizedBox(width: 16.w(context)),
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      SubjectBankTitle(),
                      SizedBox(height: 8.h(context)),
                      SubjectBankDetails(),
                      SizedBox(height: 8.h(context)),
                      SubjectBankFooter(),
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
