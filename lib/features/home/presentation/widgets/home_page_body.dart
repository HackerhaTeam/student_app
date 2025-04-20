import 'package:flutter/material.dart';
import 'package:student_hackerha/core/functions/get_responsive_size.dart';
import 'package:student_hackerha/core/themes/extentions/app_backgrounds.dart';
import 'package:student_hackerha/core/themes/extentions/app_borders.dart';
import 'package:student_hackerha/features/home/presentation/widgets/new_course_item.dart';
import 'package:student_hackerha/features/home/presentation/widgets/course_list_section.dart';
import 'package:student_hackerha/features/home/presentation/widgets/courses_header.dart';
import 'package:student_hackerha/features/home/presentation/widgets/home_header.dart';
import 'package:student_hackerha/features/home/presentation/widgets/home_search_section.dart';
import 'package:student_hackerha/features/home/presentation/widgets/my_courses_item.dart';
import 'package:student_hackerha/features/home/presentation/widgets/tags_section.dart';

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
  void dispose() {
    _searchController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final background = Theme.of(context).extension<AppBackgrounds>()!;
    final border = Theme.of(context).extension<AppBorders>()!;
    final screenHeight = MediaQuery.of(context).size.height;
    final isTablet = screenHeight > 850;
    final listHeight = isTablet ? 340.h(context) : 340.h(context);

    return SafeArea(
      child: CustomScrollView(
        slivers: [
          SliverToBoxAdapter(
              child: HomeHeader(
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
              onTagSelected: (index) =>
                  setState(() => selectedTagIndex = index),
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
            child: CourseListSection(
              height: listHeight,
              border: border,
              background: background,
              coursesItem: NewCoursesItem(
                isNew: true,
                border: border,
                background: background,
                courseName: 'البرمجة ( 1})',
                description: 'وصف الدورة رقم ',
                tagsTitle: ["مدرّس 1", "دورة شاملة", " 22 طالب"],
              ),
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
            child: CourseListSection(
              height: listHeight,
              border: border,
              background: background,
              coursesItem: MyCoursesItem(
                border: border,
                background: background,
                courseName: "البرمجة (1)",
                description: "منصور السالم",
              ),
            ),
          )
        ],
      ),
    );
  }
}
