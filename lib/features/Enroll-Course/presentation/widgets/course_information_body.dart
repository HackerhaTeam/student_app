import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:phosphor_flutter/phosphor_flutter.dart';
import 'package:student_hackerha/core/functions/get_responsive_size.dart';
import 'package:student_hackerha/core/themes/extentions/app_backgrounds.dart';
import 'package:student_hackerha/core/themes/extentions/app_content.dart';
import 'package:student_hackerha/core/themes/typoGraphy/app_text_styles.dart';
import 'package:student_hackerha/core/widgets/custom_card.dart';
import 'package:student_hackerha/core/widgets/headers/custom_tabBar.dart';
import 'package:student_hackerha/features/Enroll-Course/presentation/manager/cubit/course_info_cubit.dart';
import 'package:student_hackerha/features/Enroll-Course/presentation/manager/cubit/course_info_state.dart';
import 'package:student_hackerha/features/Enroll-Course/presentation/widgets/course_information_buttons_header.dart';
import 'package:student_hackerha/features/Enroll-Course/presentation/widgets/course_information_image.dart';
import 'package:student_hackerha/features/Enroll-Course/presentation/widgets/courses_information_tags.dart';
import 'package:student_hackerha/features/Enroll-Course/presentation/widgets/detailes_section.dart';
import 'package:student_hackerha/features/Enroll-Course/presentation/widgets/floating_active_course_button.dart';
import 'package:student_hackerha/features/Enroll-Course/presentation/widgets/sticky_floating_header.dart';
import 'package:student_hackerha/features/Enroll-Course/presentation/widgets/summary_text_course.dart';
import 'package:student_hackerha/features/Enroll-Course/presentation/widgets/teachers_section.dart';

class CourseInformationBody extends StatefulWidget {
  const CourseInformationBody({super.key});

  @override
  State<CourseInformationBody> createState() => _CourseInformationBodyState();
}

class _CourseInformationBodyState extends State<CourseInformationBody>
    with SingleTickerProviderStateMixin {
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => CourseInfoCubit(this),
      child: const _CourseInformationView(),
    );
  }
}

class _CourseInformationView extends StatelessWidget {
  const _CourseInformationView();

  Widget _buildSection(
      {required Key key,
      required String title,
      required Widget child,
      required BuildContext context}) {
    return CustomCard(
      key: key,
      padding: EdgeInsets.symmetric(horizontal: 20.w(context)),
      child: child,
    );
  }

  @override
  Widget build(BuildContext context) {
    final cubit = context.read<CourseInfoCubit>();
    final screenHeight = MediaQuery.of(context).size.height;
    final List<String> tags = ["مدرّس واحد", "دورة شاملة", "55 طالب"];
    var content = Theme.of(context).extension<AppContent>()!;
    return Scaffold(
      backgroundColor:
          Theme.of(context).extension<AppBackgrounds>()!.surfacePrimary,
      body: BlocBuilder<CourseInfoCubit, CourseInfoState>(
        builder: (context, state) {
          return Stack(
            children: [
              SingleChildScrollView(
                controller: cubit.scrollController,
                child: ConstrainedBox(
                  constraints: BoxConstraints(minHeight: screenHeight * 1.5),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      AnimatedOpacity(
                        opacity: state.showTabBar ? 0 : 1,
                        duration: const Duration(milliseconds: 300),
                        child: Stack(
                          children: [
                            const CourseInformationImage(),
                            Padding(
                              padding: EdgeInsets.symmetric(
                                horizontal: 20.w(context),
                                vertical: 60.h(context),
                              ),
                              child: const CourseInformationButtonsHeader(),
                            ),
                          ],
                        ),
                      ),
                      const SizedBox(height: 16),
                      Padding(
                        padding: EdgeInsets.only(right: 20.w(context)),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              "البرمجة (1)",
                              style: context.xHeadingLarge,
                            ),
                            const SizedBox(height: 8),
                            Text(
                              "أساس البرمجة التي من خلالها ستبدأ رحلتك العلمية في عالم البرمجة الواسع.",
                              style: context.xParagraphMedium
                                  .copyWith(color: content.secondary),
                            ),
                            const SizedBox(height: 16),
                            CoursesInformationTags(tags: tags),
                          ],
                        ),
                      ),
                      const SizedBox(height: 16),
                      AnimatedSwitcher(
                        duration: const Duration(milliseconds: 300),
                        transitionBuilder:
                            (Widget child, Animation<double> animation) {
                          return SlideTransition(
                            position: Tween<Offset>(
                              begin: const Offset(0, -1),
                              end: Offset.zero,
                            ).animate(animation),
                            child: FadeTransition(
                                opacity: animation, child: child),
                          );
                        },
                        child: !state.showTabBar
                            ? Material(
                                key: const ValueKey('tabBar'),
                                color: Theme.of(context)
                                    .extension<AppBackgrounds>()!
                                    .surfacePrimary,
                                child: Padding(
                                  padding: EdgeInsets.symmetric(
                                      horizontal: 16.w(context), vertical: 16),
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
                              )
                            : const SizedBox.shrink(),
                      ),
                      _buildSection(
                        key: cubit.aboutKey,
                        title: "حول الدورة",
                        child: const SummaryCourse(),
                        context: context,
                      ),
                      _buildSection(
                        key: cubit.teachersKey,
                        title: "المدرسين",
                        child: TeachersSection(),
                        context: context,
                      ),
                      _buildSection(
                        key: cubit.contentKey,
                        title: "محتويات الدورة",
                        child: DetailesSection(),
                        context: context,
                      ),
                      _buildSection(
                        key: cubit.reviewsKey,
                        title: "المراجعات",
                        context: context,
                        child: Column(
                          children: [
                            Row(
                              children: [
                                Text(
                                  "المراجعات",
                                  style: context.xHeadingLarge,
                                ),
                                Spacer(),
                                TextButton(
                                    onPressed: () {},
                                    child: Text(
                                      "عرض الكل",
                                      style: context.xLabelMedium.copyWith(
                                          color: content.brandPrimary),
                                    ))
                              ],
                            ),
                            SizedBox(
                              height: 16,
                            ),
                            Row(
                              children: [
                                PhosphorIcon(
                                  PhosphorIcons.star(PhosphorIconsStyle.fill),
                                  color: Color(0xffF0B100),
                                )
                              ],
                            )
                          ],
                        ),
                      ),
                      const SizedBox(height: 300),
                    ],
                  ),
                ),
              ),
              if (state.showTabBar) StickyFloatingHeader(cubit: cubit),
              const FloatingActiveCourseButton(),
            ],
          );
        },
      ),
    );
  }
}