import 'package:flutter/material.dart';
import 'package:student_hackerha/core/functions/get_responsive_size.dart';
import 'package:student_hackerha/core/themes/extentions/app_backgrounds.dart';
import 'package:student_hackerha/core/themes/extentions/app_borders.dart';
import 'package:student_hackerha/features/home/presentation/widgets/course_list_section.dart';
import 'package:student_hackerha/features/home/presentation/widgets/courses_header.dart';
import 'package:student_hackerha/features/home/presentation/widgets/home_header.dart';
import 'package:student_hackerha/features/home/presentation/widgets/home_search_section.dart';
import 'package:student_hackerha/features/home/presentation/widgets/tags_section.dart';

class HomePageBody extends StatefulWidget {
  const HomePageBody({
    super.key,
    required this.backgrounds,
    required this.borders,
  });

  final AppBackgrounds? backgrounds;
  final AppBorders? borders;

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
    final listHeight = isTablet ? 420.h(context) : 340.h(context);

    return CustomScrollView(
      slivers: [
        SliverToBoxAdapter(child: HomeHeader(backgrounds: background)),
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
          child: CoursesHeader(background: background),
        ),
        SliverToBoxAdapter(child: SizedBox(height: 20.h(context))),
        SliverToBoxAdapter(
          child: CourseListSection(
            height: listHeight,
            border: border,
            background: background,
          ),
        ),
        SliverToBoxAdapter(child: SizedBox(height: 40.h(context))),
      ],
    );
  }
}
