import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:student_hackerha/core/DI/service_locator.dart';
import 'package:student_hackerha/core/Entities/course.dart';
import 'package:student_hackerha/core/functions/get_responsive_size.dart';
import 'package:student_hackerha/core/functions/navigation.dart';
import 'package:student_hackerha/core/manager/tag_cubit/tag_cubit.dart';
import 'package:student_hackerha/core/widgets/tags/tags_list_view.dart';
import 'package:student_hackerha/features/courses/presentation/widgets/courses_headdr.dart';
import 'package:student_hackerha/features/courses/presentation/widgets/year_courses_page.dart';
import 'package:student_hackerha/core/widgets/course%20card/course_list.dart';
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
          BlocBuilder<TagCubit, int>(
            builder: (context, state) {
              return SliverToBoxAdapter(
                child: TagsListView(selectedIndex: state, tagsName: tags),
              );
            },
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
                        context.navigateWithSlideTransition(YearCoursesPage());
                      })),
              const SliverToBoxAdapter(child: SizedBox(height: 16)),
              SliverToBoxAdapter(
                child:
                    Padding(
                      padding: const EdgeInsets.only(bottom:24 ),
                      child: CourseList( courses: courses, scrollDirection: Axis.horizontal,),
                    ),
              ),
            ])
        .toList();
  }
}
