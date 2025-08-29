import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:student_hackerha/core/functions/get_responsive_size.dart';
import 'package:student_hackerha/core/themes/extentions/app_backgrounds.dart';
import 'package:student_hackerha/core/widgets/headers/custom_tabBar.dart';
import 'package:student_hackerha/features/courses/presentation/manager/cubit/CourseInformationUi/course_info_cubit.dart';
import 'package:student_hackerha/features/courses/presentation/widgets/CoursesTabPage/year_page_header.dart';

class StickyFloatingHeader extends StatelessWidget {
   const StickyFloatingHeader({super.key, required this.cubit});
 final CourseInfoCubit cubit;
   @override
   Widget build(BuildContext context) {
     return AnimatedSwitcher(
      duration: const Duration(milliseconds: 300),
      transitionBuilder: (Widget child, Animation<double> animation) {
        return SlideTransition(
          position: Tween<Offset>(
            begin: const Offset(0, -1),
            end: Offset.zero,
          ).animate(animation),
          child: FadeTransition(opacity: animation, child: child),
        );
      },
      child: AnnotatedRegion<SystemUiOverlayStyle>(
        key: const ValueKey('tabBarHeader'),
        value: SystemUiOverlayStyle(
          statusBarColor: Theme.of(context)
              .extension<AppBackgrounds>()!
              .surfacePrimary,
          statusBarIconBrightness: Brightness.dark,
        ),
        child: SafeArea(
          child: Column(
            children: [
              Container(
                color: Theme.of(context)
                    .extension<AppBackgrounds>()!
                    .surfacePrimary,
                child: YearPageHeader(title: "البرمجة (1)"),
              ),
              Material(
                color: Theme.of(context)
                    .extension<AppBackgrounds>()!
                    .surfacePrimary,
                child: SizedBox(
                  width: MediaQuery.of(context).size.width,
                  child: Padding(
                    padding: EdgeInsets.symmetric(horizontal: 16.w(context)),
                    child: CustomTabBar(
                      tabs: const [
                        "حول الدورة",
                        "المدرسين",
                        "محتويات الدورة",
                        "المراجعات",
                      ],
                      tabController: cubit.tabController,
                      onTabChanged: (index) {
                        cubit.scrollToSection(index);
                      },
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
   }
 }
