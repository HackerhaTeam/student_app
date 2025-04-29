// ignore_for_file: deprecated_member_use

import 'package:flutter/material.dart';
import 'package:student_hackerha/core/DI/%20service_locator.dart';
import 'package:student_hackerha/core/Entities/course.dart';
import 'package:student_hackerha/core/functions/get_responsive_size.dart';
import 'package:student_hackerha/core/themes/extentions/app_backgrounds.dart';
import 'package:student_hackerha/core/themes/extentions/app_borders.dart';
import 'package:student_hackerha/core/themes/typoGraphy/app_text_styles.dart';
import 'package:student_hackerha/features/home/presentation/widgets/courses%20elements/my_course_list_section.dart';
import 'package:student_hackerha/features/home/presentation/widgets/courses%20elements/course_list_section.dart';
import 'package:student_hackerha/features/home/presentation/widgets/courses_header.dart';
import 'package:student_hackerha/features/home/presentation/widgets/page_header.dart';
import 'package:student_hackerha/features/home/presentation/widgets/home_search_section.dart';
import 'package:student_hackerha/features/home/presentation/widgets/courses%20elements/tags_section.dart';
import 'package:student_hackerha/features/home/presentation/widgets/monthly_trainer_page_view.dart';

class HomePageBody extends StatefulWidget {
  const HomePageBody({
    super.key,
  });

  @override
  State<HomePageBody> createState() => _HomePageBodyState();
}

class _HomePageBodyState extends State<HomePageBody> {
  int selectedTagIndex = 0;
  late TextEditingController _searchController;

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
    _searchController = TextEditingController();
  }

  @override
  Widget build(BuildContext context) {
    final courses = locator.get<List<Course>>(instanceName: 'courses');

    final background = Theme.of(context).extension<AppBackgrounds>()!;
    final border = Theme.of(context).extension<AppBorders>()!;
    final screenHeight = MediaQuery.of(context).size.height;
    final isTablet = screenHeight > 850;
    final listHeight = isTablet ? 340.h(context) : 340.h(context);

    return SafeArea(
      child: CustomScrollView(slivers: [
        SliverToBoxAdapter(
            child: PageHeader(
          backgrounds: background,
        )),
        SliverToBoxAdapter(
          child: HomeSearchSection(
            background: background,
            searchController: _searchController,
          ),
        ),
        SliverToBoxAdapter(
          child: TagsSection(
            tags: tags,
            selectedIndex: selectedTagIndex,
            onTagSelected: (index) => setState(() => selectedTagIndex = index),
            background: background,
            border: border,
          ),
        ),
        SliverToBoxAdapter(child: SizedBox(height: 24.h(context))),
        SliverToBoxAdapter(
          child: CoursesHeader(title: "الدورات الجديدة"),
        ),
        SliverToBoxAdapter(child: SizedBox(height: 20.h(context))),
        SliverToBoxAdapter(
          child: NewCourseListSection(
            height: listHeight,
            border: border,
            background: background,
            courses: courses,
          ),
        ),
        SliverToBoxAdapter(
          child: CoursesHeader(
            title: "دوراتي المسجل بها",
          ),
        ),
        SliverToBoxAdapter(
          child: SizedBox(
            height: 16.h(context),
          ),
        ),
        SliverToBoxAdapter(
          child: MyCourseListSection(
            height: listHeight,
            border: border,
            background: background,
            courses: courses,
          ),
        ),
        SliverToBoxAdapter(
          child: Padding(
            padding: EdgeInsets.only(right: 20.w(context)),
            child: Text(
              "مدرسي الشهر",
              style: Theme.of(context).textTheme.xHeadingLarge,
            ),
          ),
        ),
        SliverToBoxAdapter(
          child: SizedBox(
            height: 16.h(context),
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
