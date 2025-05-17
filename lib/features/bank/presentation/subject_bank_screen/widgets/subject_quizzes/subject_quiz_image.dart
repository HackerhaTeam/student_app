
import 'package:flutter/material.dart';
import 'package:phosphor_flutter/phosphor_flutter.dart';
import 'package:student_hackerha/core/functions/get_responsive_size.dart';
import 'package:student_hackerha/core/themes/extentions/app_backgrounds.dart';
import 'package:student_hackerha/core/themes/extentions/app_content.dart';
import 'package:student_hackerha/features/bank/presentation/shared/widgets/custom_card.dart';

class SubjectQuizImage extends StatelessWidget {
  const SubjectQuizImage({
    super.key,
  });


  @override
  Widget build(BuildContext context) {
        final backgroundColor = Theme.of(context).extension<AppBackgrounds>()!;
    final contentColor = Theme.of(context).extension<AppContent>()!;
    return CustomCard(
      borderRadius: 16.r(context),
      backgroundColor: backgroundColor.primaryBrand,
      child: Padding(
        padding: EdgeInsets.symmetric(
            horizontal: 12.w(context), vertical: 12.h(context)),
        child: PhosphorIcon(
          PhosphorIcons.exam(),
          color: contentColor.primaryInverted,
          size: 16.s(context),
        ),
      ),
    );
  }
}
