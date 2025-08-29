//-----------------------------
// Widget: CourseInformationBody
//-----------------------------

import 'package:flutter/material.dart';
import 'package:phosphor_flutter/phosphor_flutter.dart';
import 'package:student_hackerha/core/functions/get_responsive_size.dart';
import 'package:student_hackerha/core/themes/extentions/app_backgrounds.dart';
import 'package:student_hackerha/core/themes/extentions/app_borders.dart';
import 'package:student_hackerha/core/themes/extentions/app_content.dart';
import 'package:student_hackerha/core/widgets/custom_card.dart';
import 'package:student_hackerha/features/courses/presentation/widgets/Course%20informations/icon_text.dart';

class CustomCourseInformationCardIconText extends StatelessWidget {
  const CustomCourseInformationCardIconText({
    super.key, required this.title, required this.icon,
  });
  final String title;
   final PhosphorIconData icon;
  @override
  Widget build(BuildContext context) {
    return CustomCard(

      borderRadius: 12,
      width: 113.3.w(context),
      height: 34,
      backgroundColor:Theme.of(context)
          .extension<AppBackgrounds>()!.onSurfaceSecondary ,
      alignment: Alignment.center,
      borderColor: Theme.of(context)
          .extension<AppBorders>()!
          .transparent,
      child: IconText(
        icon: icon,
        title:title,
      ),
    );
  }
}