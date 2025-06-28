import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:student_hackerha/core/themes/extentions/app_backgrounds.dart';
import 'package:student_hackerha/core/themes/extentions/app_borders.dart';
import 'package:student_hackerha/core/themes/extentions/app_content.dart';
import 'package:student_hackerha/core/themes/typoGraphy/app_text_styles.dart';
import 'package:student_hackerha/core/widgets/headers/custom_tabBar.dart';
import 'package:student_hackerha/features/Enroll-Course/presentation/manager/cubit/course_info_cubit.dart';
import 'package:student_hackerha/features/Enroll-Course/presentation/manager/cubit/course_info_state.dart';
import 'package:student_hackerha/features/Enroll-Course/presentation/widgets/Course%20informations/tab_bar_header_delegate.dart';
import 'package:student_hackerha/features/Enroll-Course/presentation/widgets/Course%20informations/bottom_navigation_price.dart';
import 'package:student_hackerha/features/Enroll-Course/presentation/widgets/Course%20informations/course_info_card_icons.dart';
import 'package:student_hackerha/features/Enroll-Course/presentation/widgets/Course%20informations/course_info_price.dart';
import 'package:student_hackerha/features/Enroll-Course/presentation/widgets/Course%20informations/course_info_sliver_app_bar.dart';
import 'package:student_hackerha/features/Enroll-Course/presentation/widgets/Course%20informations/course_info_summary_text.dart';
import 'package:student_hackerha/features/Enroll-Course/presentation/widgets/Course%20informations/detailes_section.dart';
import 'package:student_hackerha/features/Enroll-Course/presentation/widgets/Course%20informations/section.dart';
import 'package:student_hackerha/features/Enroll-Course/presentation/widgets/Course%20informations/summary_text_course.dart';
import 'package:student_hackerha/features/Enroll-Course/presentation/widgets/Course%20informations/teachers_section.dart';
import 'package:student_hackerha/features/Enroll-Course/presentation/widgets/reviews/review_section_belel.dart';

class CourseInformationView extends StatelessWidget {
  const CourseInformationView({super.key});

  @override
  Widget build(BuildContext context) {
    final cubit = context.read<CourseInfoCubit>();
    final screenHeight = MediaQuery.of(context).size.height;
    final content = Theme.of(context).extension<AppContent>()!;
    final background = Theme.of(context).extension<AppBackgrounds>()!;
    final border = Theme.of(context).extension<AppBorders>()!;

    return BlocBuilder<CourseInfoCubit, CourseInfoState>(
      builder: (context, state) {
        return Scaffold(
          bottomNavigationBar: cubit.tabController.index != 0
              ? BottomNavigationPrice(
                  border: border, background: background, content: content)
              : null,
          backgroundColor: background.surfacePrimary,
          body: CustomScrollView(
            key: cubit.scrollViewKey,
            controller: cubit.scrollController,
            slivers: [
              const CourseInfoSliverAppBar(),
              const CourseInfoSummaryText(),
              const SliverToBoxAdapter(child: SizedBox(height: 12)),
              const CourseInfoPrice(),
              const SliverToBoxAdapter(child: SizedBox(height: 12)),
              const CourseInfoCardIcons(),
              SliverPersistentHeader(
                pinned: true,
                delegate: TabBarHeaderDelegate(
                  CustomTabBar(
                    tabs: const [
                      "حول الدورة",
                      "المدرسين",
                      "محتويات الدورة",
                      "المراجعات"
                    ],
                    tabController: cubit.tabController,
                    onTabChanged: (index) => cubit.scrollToSection(index),
                  ),
                ),
              ),

              SliverToBoxAdapter(
                child: Stack(
                  children: [
                    ConstrainedBox(
                      constraints: BoxConstraints(minHeight: screenHeight),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          AnimatedOpacity(
                            opacity: 1,
                            duration: const Duration(milliseconds: 300),
                            child: Container(),
                          ),
                          const SizedBox(height: 16),
                          Section(
                            scrollKey: cubit.aboutKey,
                            child: const SummaryCourse(),
                          ),
                          Section(
                            scrollKey: cubit.teachersKey,
                            child: const TeachersSection(),
                          ),
                          Section(
                            scrollKey: cubit.contentKey,
                            child: const DetailesSection(),
                          ),
                          Section(
                            scrollKey: cubit.reviewsKey,
                            child: ReviewsSection(),
                          ),
                          const SizedBox(height: 300),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        );
      },
    );
  }
}
