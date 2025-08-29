import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:student_hackerha/core/themes/extentions/app_backgrounds.dart';
import 'package:student_hackerha/core/themes/extentions/app_borders.dart';
import 'package:student_hackerha/core/themes/extentions/app_content.dart';
import 'package:student_hackerha/core/themes/typoGraphy/app_text_styles.dart';
import 'package:student_hackerha/core/widgets/headers/custom_tabBar.dart';
import 'package:student_hackerha/core/widgets/shimmer/course_shimmer.dart';
import 'package:student_hackerha/features/courses/domain/Entity/course.dart';
import 'package:student_hackerha/features/courses/presentation/manager/cubit/Courses/get_courses_cubit.dart';
import 'package:student_hackerha/features/courses/presentation/widgets/Course%20informations/tab_bar_header_delegate.dart';
import 'package:student_hackerha/features/courses/presentation/widgets/Course%20informations/bottom_navigation_price.dart';
import 'package:student_hackerha/features/courses/presentation/widgets/Course%20informations/course_info_card_icons.dart';
import 'package:student_hackerha/features/courses/presentation/widgets/Course%20informations/course_info_price.dart';
import 'package:student_hackerha/features/courses/presentation/widgets/Course%20informations/course_info_sliver_app_bar.dart';
import 'package:student_hackerha/features/courses/presentation/widgets/Course%20informations/course_info_summary_text.dart';
import 'package:student_hackerha/features/courses/presentation/widgets/Course%20informations/detailes_section.dart';
import 'package:student_hackerha/features/courses/presentation/widgets/Course%20informations/section.dart';
import 'package:student_hackerha/features/courses/presentation/widgets/Course%20informations/summary_text_course.dart';
import 'package:student_hackerha/features/courses/presentation/widgets/Course%20informations/teachers_section.dart';
import 'package:student_hackerha/features/courses/presentation/widgets/Course%20informations/reviews/review_section_belel.dart';
import 'package:student_hackerha/features/courses/presentation/manager/cubit/CourseInformationUi/course_info_cubit.dart';
import 'package:student_hackerha/features/courses/presentation/manager/cubit/CourseInformationUi/course_info_state.dart';

class CourseInformationView extends StatelessWidget {
  const CourseInformationView({super.key, required this.course});
  final Course course;

  @override
  Widget build(BuildContext context) {
    final cubit = context.read<CourseInfoCubit>();
    final screenHeight = MediaQuery.of(context).size.height;
    final background = Theme.of(context).extension<AppBackgrounds>()!;
    return BlocBuilder<CourseInfoCubit, CourseInfoState>(
      builder: (context, state) {
        return Scaffold(
          bottomNavigationBar: cubit.tabController.index != 0
              ? BottomNavigationPrice(
                  price: course.price,
                )
              : null,
          backgroundColor: background.surfacePrimary,
          body: CustomScrollView(
            key: cubit.scrollViewKey,
            controller: cubit.scrollController,
            slivers: [
              CourseInfoSliverAppBar(
                courseName: course.name,
              ),
              CourseInfoSummaryText(
                description: course.description,
              ),
              const SliverToBoxAdapter(child: SizedBox(height: 12)),
              CourseInfoPrice(
                price: course.price,
              ),
              const SliverToBoxAdapter(child: SizedBox(height: 12)),
              CourseInfoCardIcons(
                courseType: course.type,
                studentCount: "22 طالب",
                teacherCount: "مدرس واحد",
              ),
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
                            child: SummaryCourse(
                              aboutCourse: course.about,
                            ),
                          ),
                          Section(
                            scrollKey: cubit.teachersKey,
                            child: const TeachersSection(),
                          ),
                          Section(
                            scrollKey: cubit.contentKey,
                            child: BlocBuilder<CoursesCubit, CoursesState>(
                              builder: (context, state) {
                                if(state is CoursesLoaded){
                           var courseDetail = state.courses.firstWhere(
  (element) => element.id == course.id,
  orElse: () => course, 
);

                                return  DetailesSection(
                                  sessions: courseDetail.sessions,
                                );
                                }
                                if (state is CoursesLoading) {
                                  return CourseShimmer();
                                }
                                return DetailesSection(
                                  sessions: course.sessions,
                                );
                              },
                            ),
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
