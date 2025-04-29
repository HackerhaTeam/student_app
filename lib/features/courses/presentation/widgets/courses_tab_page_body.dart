import 'package:animated_theme_switcher/animated_theme_switcher.dart';
import 'package:flutter/material.dart';
import 'package:student_hackerha/core/DI/%20service_locator.dart';
import 'package:student_hackerha/core/Entities/course.dart';
import 'package:student_hackerha/core/functions/get_responsive_size.dart';
import 'package:student_hackerha/features/courses/presentation/widgets/courses_headdr.dart';
import 'package:student_hackerha/features/courses/presentation/widgets/year_courses_page.dart';
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
              SliverToBoxAdapter(
                  child: CoursesHeader(
                      title: title,
                      onPressed: () {
                        Navigator.push(
                          context,
                          PageRouteBuilder(
                            pageBuilder: (context, animation,
                                    secondaryAnimation) =>
                                ThemeSwitchingArea(child: YearCoursesPage()),
                            transitionsBuilder: (context, animation,
                                secondaryAnimation, child) {
                              const begin = Offset(1.0, 0.0);
                              const end = Offset.zero;
                              const curve = Curves.easeInOut;

                              var tween = Tween(begin: begin, end: end).chain(
                                CurveTween(curve: curve),
                              );

                              return SlideTransition(
                                position: animation.drive(tween),
                                child: child,
                              );
                            },
                            transitionDuration:
                                const Duration(milliseconds: 300),
                          ),
                        );
                      })),
              const SliverToBoxAdapter(child: SizedBox(height: 16)),
              SliverToBoxAdapter(
                child:
                    NewCourseListSection(height: listHeight, courses: courses),
              ),
            ])
        .toList();
  }
}
