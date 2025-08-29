import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/svg.dart';
import 'package:phosphor_flutter/phosphor_flutter.dart';
import 'package:student_hackerha/core/DI/service_locator.dart';
import 'package:student_hackerha/core/Entities/course.dart';
import 'package:student_hackerha/core/constants/assets_image.dart';
import 'package:student_hackerha/core/functions/get_responsive_size.dart';
import 'package:student_hackerha/core/functions/navigation.dart';
import 'package:student_hackerha/core/helpers/tags/get_theme_icon.dart';
import 'package:student_hackerha/core/manager/tag_cubit/tag_cubit.dart';
import 'package:student_hackerha/core/themes/extentions/app_backgrounds.dart';
import 'package:student_hackerha/core/themes/extentions/app_borders.dart';
import 'package:student_hackerha/core/themes/extentions/app_content.dart';
import 'package:student_hackerha/core/themes/typoGraphy/app_text_styles.dart';
import 'package:student_hackerha/core/widgets/animation/fade_widget.dart';
import 'package:student_hackerha/core/widgets/custom_card.dart';
import 'package:student_hackerha/core/widgets/shimmer/course_shimmer.dart';
import 'package:student_hackerha/core/widgets/shimmer/course_shimmer_list.dart';
import 'package:student_hackerha/core/widgets/tags/tags_list_view.dart';
import 'package:student_hackerha/features/courses/presentation/manager/cubit/GetCourses/get_courses_cubit.dart';
import 'package:student_hackerha/features/courses/presentation/pages/search_page.dart';
import 'package:student_hackerha/core/widgets/course%20card/my_course_list_section.dart';
import 'package:student_hackerha/core/widgets/course%20card/course_list.dart';
import 'package:student_hackerha/features/courses/presentation/widgets/CoursesTabPage/courses_failure_view.dart';
import 'package:student_hackerha/features/courses/presentation/widgets/CoursesTabPage/courses_loading_view.dart';
import 'package:student_hackerha/features/home/domain/Entity/course_entity.dart';
import 'package:student_hackerha/features/home/presentation/manager/my%20courses%20cubit/my_courses_cubit.dart';
import 'package:student_hackerha/features/home/presentation/manager/recentlyAddedCourseCubit/recently_added_course_cubit.dart';
import 'package:student_hackerha/features/home/presentation/manager/recentlyAddedCourseCubit/recently_added_courses_state.dart';
import 'package:student_hackerha/features/home/presentation/widgets/courses_header.dart';
import 'package:student_hackerha/features/home/presentation/widgets/home_header.dart';
import 'package:student_hackerha/features/home/presentation/widgets/home_page_text.dart';
import 'package:student_hackerha/features/home/presentation/widgets/home_search_section.dart';
import 'package:student_hackerha/features/home/presentation/widgets/home_section_builder.dart';
import 'package:student_hackerha/features/home/presentation/widgets/monthly_trainer_page_view.dart';
import 'package:student_hackerha/features/home/presentation/widgets/text_card.dart';

class HomePageBody extends StatefulWidget {
  const HomePageBody({
    super.key,
  });

  @override
  State<HomePageBody> createState() => _HomePageBodyState();
}

class _HomePageBodyState extends State<HomePageBody> {
  int selectedTagIndex = 0;

  final List<String> tags = [
    "دورات جديدة",
    "خصومات",
    "دورات نظرية",
    "دورات عملية",
    "دورات شاملة"
  ];

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
   

    final background = Theme.of(context).extension<AppBackgrounds>()!;
    final border = Theme.of(context).extension<AppBorders>()!;

    return SafeArea(
      child: CustomScrollView(slivers: [
        SliverToBoxAdapter(child: HomeHeader()),
        SliverToBoxAdapter(
          child: HomePageText(),
        ),
        SliverToBoxAdapter(
          child: Stack(
            alignment: Alignment.topCenter,
            children: [
              GestureDetector(
                onTap: () {
                  context.navigateWithSlideTransition(SearchPage());
                },
                child: TextCard(),
              ),
            ],
          ),
        ),
        SliverToBoxAdapter(
          child: BlocBuilder<TagCubit, int>(
            builder: (context, state) {
              return TagsListView(selectedIndex: state, tagsName: tags);
            },
          ),
        ),
        SliverToBoxAdapter(
          child: CoursesHeader(
            title: "الدورات الجديدة",
            onPressed: () {},
          ),
        ),
        SliverToBoxAdapter(child: SizedBox(height: 20)),

        SliverToBoxAdapter(child: BlocBuilder<GetCoursesCubit, GetCoursesState>(
      builder: (context, state) {
        if (state is GetCoursesLoading) {
          return CourseShimmer();
        } else if (state is GetCoursesFailure) {
          return CoursesFailureView(message: state.errMessage);
        } else if (state is GetCoursesLoaded) {
          return FadeInWidget(
              child: Padding(
                padding: const EdgeInsets.only(bottom: 24),
                child: CourseList(
                  courses: state.courses,
                  scrollDirection: Axis.horizontal,
                ),
              ),
            );
        }
        return const SliverToBoxAdapter(child: SizedBox());
      },
    )),
        SliverToBoxAdapter(
          child: SizedBox(
            height: 24,
          ),
        ),
      
        SliverToBoxAdapter(
          child: Text("data"),
        ),
        SliverToBoxAdapter(
          child: SizedBox(
            height: 24,
          ),
        ),
        SliverToBoxAdapter(
          child: Padding(
            padding: EdgeInsets.only(right: 20.w(context)),
            child: Text(
              "مدرسي الشهر",
              style: context.xHeadingLarge,
            ),
          ),
        ),
        SliverToBoxAdapter(
          child: SizedBox(
            height: 16,
          ),
        ),
        SliverToBoxAdapter(
          child: MonthlyTrainerPageView(
            border: border,
            bg: background,
            borders: border,
          ),
        )
      ]),
    );
  }
}
