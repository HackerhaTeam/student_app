import 'package:flutter/material.dart';
import 'package:student_hackerha/core/DI/service_locator.dart';

import 'package:student_hackerha/core/functions/get_responsive_size.dart';
import 'package:student_hackerha/core/widgets/animation/fade_widget.dart';
import 'package:student_hackerha/features/courses/domain/Entity/course.dart';
import 'package:student_hackerha/features/courses/presentation/widgets/CoursesTabPage/no_courses_foundbody.dart';
import 'package:student_hackerha/features/courses/presentation/widgets/CoursesTabPage/tabBar_semester.dart';
import 'package:student_hackerha/features/courses/presentation/widgets/CoursesTabPage/year_page_header.dart';
import 'package:student_hackerha/core/widgets/course%20card/course_list.dart';



class YearCoursesPage extends StatefulWidget {
  const YearCoursesPage({super.key, required this.year, required this.course});
final String year;
final List<Course> course;
  @override
  State<YearCoursesPage> createState() => _YearCoursesPageState();
}

class _YearCoursesPageState extends State<YearCoursesPage>
    with SingleTickerProviderStateMixin {
  late TabController _tabController;
  late PageController _pageController;

  final int _currentTabIndex = 0;

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

    List<Course> firstSemester = widget.course.where((c)=>c.semester=="فصل اول").toList();
    List<Course> secondSemester = widget.course.where((c)=>c.semester=="فصل ثاني").toList();

    return Scaffold(
  body: SafeArea(
    child: Column(
      children: [
        YearPageHeader(title: widget.year),
        TabBarSemester(
          tabController: _tabController,
          pageController: _pageController,
        ),
        SizedBox(height: 24.h(context)),
        Expanded(
  child: PageView(
    controller: _pageController,
    onPageChanged: (index) {
      _tabController.animateTo(index); 
    },
    children: [
  firstSemester.isNotEmpty?    FadeInWidget(
        child: CourseList(
          courses: firstSemester, 
          scrollDirection: Axis.vertical,
        ),
      ):NoCoursesFoundbody(),
    secondSemester.isNotEmpty?  FadeInWidget(
        child: CourseList(
          courses: secondSemester, 
          scrollDirection: Axis.vertical,
        ),
      ):NoCoursesFoundbody(),
    ],
  ),
)

,
      ],
    ),
  ),
);

  }
}
