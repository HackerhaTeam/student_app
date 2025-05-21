import 'package:flutter/material.dart';
import 'package:phosphor_flutter/phosphor_flutter.dart';
import 'package:student_hackerha/core/functions/get_responsive_size.dart';
import 'package:student_hackerha/core/themes/extentions/app_backgrounds.dart';
import 'package:student_hackerha/core/themes/extentions/app_borders.dart';
import 'package:student_hackerha/core/themes/extentions/app_content.dart';
import 'package:student_hackerha/features/bank/presentation/shared/widgets/custom_card.dart';

class SubjectQuizImage extends StatelessWidget {
  const SubjectQuizImage({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    final backgroundColor = Theme.of(context).extension<AppBackgrounds>()!;
    final borderColor = Theme.of(context).extension<AppBorders>()!;
    final contentColor = Theme.of(context).extension<AppContent>()!;
    return Stack(
      alignment: AlignmentDirectional.center,
      children: [
        Container(
          width: 44.s(context),
          height: 44.s(context),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(16.r(context)),
            gradient: LinearGradient(
              begin: Alignment.topCenter,
              end: Alignment.bottomCenter,
              colors: [
                borderColor.containerOutlineStart,
                borderColor.containerOutlineEnd,
              ],
            ),
          ),
        ),
        CustomCard(
          width: 40.s(context),
          height: 40.s(context),
          borderRadius: 16.r(context),
          backgroundColor: backgroundColor.primaryBrand,
          child: PhosphorIcon(
            textDirection: TextDirection.ltr,
            PhosphorIcons.exam(),
            color: contentColor.primaryInverted,
            size: 16.s(context),
          ),
        ),
      ],
    );
  }
}
