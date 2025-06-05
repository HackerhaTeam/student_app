import 'package:flutter/material.dart';
import 'package:student_hackerha/core/DI/service_locator.dart';
import 'package:student_hackerha/core/Entities/course.dart';
import 'package:student_hackerha/core/functions/get_responsive_size.dart';
import 'package:student_hackerha/features/courses/presentation/widgets/tabBar_semester.dart';
import 'package:student_hackerha/features/courses/presentation/widgets/year_page_header.dart';
import 'package:student_hackerha/features/home/presentation/widgets/courses%20elements/course_list_section.dart';

class YearCoursesPage extends StatefulWidget {
  const YearCoursesPage({super.key});

  @override
  State<YearCoursesPage> createState() => _YearCoursesPageState();
}

class _YearCoursesPageState extends State<YearCoursesPage>
    with SingleTickerProviderStateMixin {
  late TabController _tabController;
  late PageController _pageController;

  int _currentTabIndex = 0;

  @override
  void initState() {
    super.initState();
    _tabController = TabController(length: 2, vsync: this);
    _tabController.addListener(_handleTabChange);
    _pageController = PageController(initialPage: _currentTabIndex);
  }

  @override
  void dispose() {
    _pageController.dispose();
    super.dispose();
  }

  void _handleTabChange() {
    if (_tabController.indexIsChanging || _tabController.indexIsChanging) {
      _pageController.animateToPage(
        _tabController.index,
        duration: Duration(milliseconds: 100),
        curve: Curves.easeInOut,
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    final courses = locator.get<List<Course>>(instanceName: 'courses');

    return Scaffold(
      body: SafeArea(
        child: CustomScrollView(
          slivers: [
            SliverToBoxAdapter(
              child: Column(
                children: [
                  YearPageHeader(title: "السنة الأولى"),
                  TabBarSemester(
                    tabController: _tabController,
                    pageController: _pageController,
                  ),
                  SizedBox(height: 24.h(context)),
                ],
              ),
            ),
            SliverToBoxAdapter(
  child: Padding(
      padding: EdgeInsets.symmetric(horizontal: 20.w(context)),
      child: SizedBox(
        height: 307, // أو أي ارتفاع يناسب تصميمك
        child: PageView(
          controller: _pageController,
          onPageChanged: (index) {
            setState(() {
              _currentTabIndex = index;
              _tabController.animateTo(index);
            });
          },
          children: [
            NewCourseListSection(
              courses: courses.where((course) => course.year == 1).toList(),
              scrollDirection: Axis.horizontal,
            ),
            NewCourseListSection(
              courses: courses.where((course) => course.year == 2).toList(),
              scrollDirection: Axis.horizontal,
            ),
          ],
        ),
      ),
    ),),
]),

         
   
  ));}
}
