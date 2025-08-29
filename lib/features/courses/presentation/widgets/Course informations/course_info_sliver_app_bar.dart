//-----------------------------
// Widget: CourseInformationBody
//-----------------------------

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:student_hackerha/core/themes/extentions/app_backgrounds.dart';
import 'package:student_hackerha/core/widgets/headers/custom_tabBar.dart';
import 'package:student_hackerha/features/courses/presentation/widgets/Course%20informations/app_bar_background.dart';
import 'package:student_hackerha/features/courses/presentation/widgets/Course%20informations/app_bar_title.dart';
import 'package:student_hackerha/features/courses/presentation/widgets/Course%20informations/course_information_body.dart';
class CourseInfoSliverAppBar extends StatelessWidget {
  const CourseInfoSliverAppBar({super.key, required this.courseName});
    final String courseName;
  @override
  Widget build(BuildContext context) {
    final background = Theme.of(context).extension<AppBackgrounds>()!;
    const double expandedHeight = 370.0;
   

    return SliverAppBar(
      automaticallyImplyLeading: false,
      forceMaterialTransparency: false,
      backgroundColor: background.surfacePrimary,
      foregroundColor: background.surfacePrimary,
      surfaceTintColor: background.surfacePrimary,
      pinned: true,
      expandedHeight: expandedHeight,
      flexibleSpace: LayoutBuilder(
        builder: (context, constraints) {
          final topPadding = MediaQuery.of(context).padding.top;
          final minHeight = kToolbarHeight + topPadding;
          final collapseProgress = (1 - (constraints.maxHeight - minHeight) / (expandedHeight - minHeight)).clamp(0.0, 1.0);
          final isCollapsed = collapseProgress >= 1.0;

          return FlexibleSpaceBar(
            expandedTitleScale: 1.3,
            titlePadding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
            centerTitle: false,
            title: AppBarTitle(name:courseName ,
              isCollapsed: isCollapsed,
              collapseProgress: collapseProgress,
            ),
            background: AppBarBackground(
              isCollapsed: isCollapsed,
              collapseProgress: collapseProgress,
            ),
          );
        },
      ),
    );
  }
}
