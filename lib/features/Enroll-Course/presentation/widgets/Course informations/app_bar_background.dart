//-----------------------------
// Widget: CourseInformationBody
//-----------------------------

import 'package:flutter/material.dart';
import 'package:student_hackerha/core/constants/assets_image.dart';
import 'package:student_hackerha/core/functions/get_responsive_size.dart';
import 'package:student_hackerha/core/functions/navigation.dart';
import 'package:student_hackerha/core/themes/extentions/app_backgrounds.dart';
import 'package:student_hackerha/core/widgets/custom_circle_icon.dart';
import 'package:student_hackerha/features/Enroll-Course/presentation/widgets/Course%20informations/course_information_image.dart';
import 'package:student_hackerha/features/courses/presentation/pages/search_page.dart';

class AppBarBackground extends StatelessWidget {
  final bool isCollapsed;
  final double collapseProgress;
  const AppBarBackground({super.key, required this.isCollapsed, required this.collapseProgress});

  @override
  Widget build(BuildContext context) {
    final background = Theme.of(context).extension<AppBackgrounds>()!;
    return Container(
      color: background.surfacePrimary,
      child: Stack(
        children: [
          ColorFiltered(
            colorFilter: ColorFilter.mode(
              Colors.white.withOpacity(collapseProgress),
              BlendMode.lighten,
            ),
            child: const CourseInformationImage(),
          ),
          if (!isCollapsed)
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 20.w(context), vertical: 60.h(context)),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  CustomCircleIcon(
                    backgroundColor: background.containerStatic,
                    iconAsset: AppImages.carretRightLight,
                    onTap: () => Navigator.pop(context),
                    circleSize: 44.w(context),
                  ),
                  CustomCircleIcon(
                    backgroundColor: background.containerStatic,
                    iconAsset: AppImages.magnifyingGlassLight,
                    onTap: () => context.navigateWithSlideTransition(SearchPage()),
                    circleSize: 44.w(context),
                  ),
                ],
              ),
            ),
        ],
      ),
    );
  }
}
