import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'package:student_hackerha/core/manager/tag_cubit/tag_cubit.dart';
import 'package:student_hackerha/features/courses/domain/Entity/course.dart';
import 'package:student_hackerha/features/courses/presentation/manager/cubit/Courses/get_courses_cubit.dart';
import 'package:student_hackerha/features/courses/presentation/widgets/CoursesTabPage/courses_failure_view.dart';
import 'package:student_hackerha/features/courses/presentation/widgets/CoursesTabPage/courses_headdr.dart';
import 'package:student_hackerha/features/courses/presentation/widgets/CoursesTabPage/courses_loaded_view.dart';
import 'package:student_hackerha/features/courses/presentation/widgets/CoursesTabPage/courses_loading_view.dart';
import 'package:student_hackerha/features/home/presentation/widgets/courses_header.dart';
import 'package:student_hackerha/core/widgets/tags/tags_list_view.dart';

class CoursesTabPageBody extends StatefulWidget {
  const CoursesTabPageBody({super.key});

  @override
  State<CoursesTabPageBody> createState() => _CoursesTabPageBodyState();
}

class _CoursesTabPageBodyState extends State<CoursesTabPageBody> {
  static const List<String> tags = [
    "كل الدورات", // index 0
    "خصومات", // index 1
    "دورات نظرية", // index 2
    "دورات عملية", // index 3
    "دورات شاملة", // index 4
  ];

  static const List<String> yearTitles = [
    "السنة الأولى",
    "السنة الثانية",
    "السنة الثالثة",
    "السنة الرابعة",
    "السنة الخامسة",
  ];

  @override
  void initState() {
    super.initState();
    context.read<CoursesCubit>().coursesUsecase.getCourses();
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: CustomScrollView(
        slivers: [
          const SliverToBoxAdapter(child: CoursesPageHeader()),
          _buildTagsSection(),
          _buildCoursesSection(),
        ],
      ),
    );
  }

  Widget _buildTagsSection() {
    return SliverToBoxAdapter(
      child: BlocBuilder<TagCubit, int>(
        builder: (context, state) {
          return TagsListView(
            selectedIndex: state,
            tagsName: tags,
          );
        },
      ),
    );
  }

  Widget _buildCoursesSection() {
    return BlocBuilder<CoursesCubit, CoursesState>(
      builder: (context, state) {
        if (state is CoursesLoading) {
          return CoursesLoadingView(yearTitles: yearTitles);
        } else if (state is CoursesFailure) {
          return CoursesFailureView(message: state.errMessage);
        } else if (state is CoursesLoaded) {
          return _buildFilteredCourses(state.courses);
        }
        return const SliverToBoxAdapter(child: SizedBox());
      },
    );
  }

  Widget _buildFilteredCourses(List<Course> courses) {
    final tagNumber = context.watch<TagCubit>().state;
    final filteredCourses = _filterCoursesByTag(courses, tagNumber);
    
    return CoursesLoadedView(
      yearTitles: yearTitles,
      courses: filteredCourses,
    );
  }

  List<Course> _filterCoursesByTag(List<Course> courses, int tagNumber) {
    switch (tagNumber) {
      case 1: // خصومات
        return courses.where((course) => course.discount.dis).toList();
      case 2: // دورات نظرية
        return courses.where((course) => course.type == "نظري").toList();
      case 3: // دورات عملية
        return courses.where((course) => course.type == "عملي").toList();
      case 4: // دورات شاملة
        return courses.where((course) => course.type == "شاملة").toList();
      default: // كل الدورات (tagNumber = 0)
        return courses;
    }
  }
}