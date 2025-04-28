import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:student_hackerha/core/DI/%20service_locator.dart';
import 'package:student_hackerha/core/Entities/course.dart';
import 'package:student_hackerha/core/functions/get_responsive_size.dart';
import 'package:student_hackerha/core/themes/extentions/app_borders.dart';
import 'package:student_hackerha/core/themes/extentions/app_content.dart';
import 'package:student_hackerha/core/themes/typoGraphy/app_text_styles.dart';
import 'package:student_hackerha/features/courses/presentation/widgets/courses_headdr.dart';
import 'package:student_hackerha/features/home/presentation/widgets/courses%20elements/course_list_section.dart';
import 'package:student_hackerha/features/home/presentation/widgets/courses%20elements/tags_section.dart';
import 'package:student_hackerha/features/home/presentation/widgets/courses_header.dart';

class CoursesTabPageBody extends StatefulWidget {
  const CoursesTabPageBody({super.key});

  @override
  State<CoursesTabPageBody> createState() => _CoursesTabPageBodyState();
}

class _CoursesTabPageBodyState extends State<CoursesTabPageBody> {
  final List<Course> courses =
      locator.get<List<Course>>(instanceName: 'courses');
  final List<String> tags = [
    "كل الدورات",
    "خصومات",
    "دورات نظرية",
    "دورات عملية",
    "دورات شاملة"
  ];
  int selectedTagIndex = 0;

  @override
  Widget build(BuildContext context) {
    final screenHeight = MediaQuery.of(context).size.height;
    final isTablet = screenHeight > 850;
    final listHeight = isTablet ? 340.h(context) : 340.h(context);
    final yearTitles = [
      "السنة الأولى",
      "السنة الثانية",
      "السنة الثالثة",
      "السنة الرابعة",
      "السنة الخامسة",
    ];

    return SafeArea(
      child: CustomScrollView(
        slivers: [
          const SliverToBoxAdapter(child: CoursesPageHeader()),
          const SliverToBoxAdapter(child: SizedBox(height: 20)),
          SliverToBoxAdapter(
            child: TagsSection(
              tags: tags,
              selectedIndex: selectedTagIndex,
              onTagSelected: (index) =>
                  setState(() => selectedTagIndex = index),
            ),
          ),
          const SliverToBoxAdapter(child: SizedBox(height: 24)),
          ..._buildYearSections(yearTitles, listHeight),
        ],
      ),
    );
  }

  List<Widget> _buildYearSections(List<String> yearTitles, double listHeight) {
    return yearTitles
        .expand((title) => [
              SliverToBoxAdapter(child: CoursesHeader(title: title)),
              const SliverToBoxAdapter(child: SizedBox(height: 16)),
              SliverToBoxAdapter(
                child:
                    NewCourseListSection(height: listHeight, courses: courses),
              ),
            ])
        .toList();
  }
}

class CoursesTabBar extends StatefulWidget {
  const CoursesTabBar({
    super.key,
  });
  @override
  State<CoursesTabBar> createState() => _CoursesTabBarState();
}

class _CoursesTabBarState extends State<CoursesTabBar>
    with SingleTickerProviderStateMixin {
  late TabController tabController;

  var tabs = [
    Text("الفصل الأول"),
    Text("الفصل الثاني"),
  ];
  @override
  void initState() {
    tabController = TabController(length: tabs.length, vsync: this);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final border = Theme.of(context).extension<AppBorders>()!;
    final content = Theme.of(context).extension<AppContent>()!;
    return TabBar(
      splashBorderRadius: BorderRadius.all(Radius.circular(22)),
      dividerHeight: 1,
      automaticIndicatorColorAdjustment:
          EditableText.defaultStylusHandwritingEnabled,
      indicator: UnderlineTabIndicator(
          borderSide: BorderSide(
            color: content.brandPrimary,
          ),
          insets: EdgeInsets.only(bottom: BorderSide.strokeAlignCenter)),
      labelStyle: context.xLabelMedium.copyWith(color: content.brandPrimary),
      unselectedLabelColor: content.secondary,
      controller: tabController,
      indicatorColor: content.secondary,
      tabs: tabs,
      dividerColor: border.secondary,
    );
  }
}
