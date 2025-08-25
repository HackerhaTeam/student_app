import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'package:student_hackerha/core/functions/navigation.dart';
import 'package:student_hackerha/core/manager/tag_cubit/tag_cubit.dart';
import 'package:student_hackerha/core/widgets/animation/fade_widget.dart';
import 'package:student_hackerha/core/widgets/shimmer/course_shimmer.dart';
import 'package:student_hackerha/core/widgets/tags/tags_list_view.dart';
import 'package:student_hackerha/core/widgets/course%20card/course_list.dart';
import 'package:student_hackerha/features/courses/domain/Entity/course.dart';
import 'package:student_hackerha/features/courses/presentation/manager/cubit/GetCourses/get_courses_cubit.dart';
import 'package:student_hackerha/features/courses/presentation/widgets/courses_failure_view.dart';
import 'package:student_hackerha/features/courses/presentation/widgets/courses_loaded_view.dart';
import 'package:student_hackerha/features/courses/presentation/widgets/courses_loading_view.dart';
import 'package:student_hackerha/features/courses/presentation/widgets/year_courses_page.dart';
import 'package:student_hackerha/features/home/presentation/widgets/courses_header.dart';
import 'package:student_hackerha/features/courses/presentation/widgets/courses_headdr.dart';

class CoursesTabPageBody extends StatefulWidget {
  const CoursesTabPageBody({super.key});

  @override
  State<CoursesTabPageBody> createState() => _CoursesTabPageBodyState();
}

class _CoursesTabPageBodyState extends State<CoursesTabPageBody> {
  final List<String> tags = [
    "كل الدورات",
    "خصومات",
    "دورات نظرية",
    "دورات عملية",
    "دورات شاملة",
  ];

  final List<String> yearTitles = [
    "السنة الأولى",
    "السنة الثانية",
    "السنة الثالثة",
    "السنة الرابعة",
    "السنة الخامسة",
  ];

  @override
  void initState() {
    super.initState();
    context.read<GetCoursesCubit>().getCoursesUsecase();
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: CustomScrollView(
        slivers: [
          const SliverToBoxAdapter(child: CoursesPageHeader()),

          /// tags
          SliverToBoxAdapter(
            child: BlocBuilder<TagCubit, int>(
              builder: (context, state) {
                return TagsListView(
                  selectedIndex: state,
                  tagsName: tags,
                );
              },
            ),
          ),

          /// courses by years
          BlocBuilder<GetCoursesCubit, GetCoursesState>(
            builder: (context, state) {
              if (state is GetCoursesLoading) {
                return CoursesLoadingView(yearTitles: yearTitles);
              } else if (state is GetCoursesFailure) {
                return CoursesFailureView(message: state.errMessage);
              } else if (state is GetCoursesLoaded) {
                return CoursesLoadedView(
                  yearTitles: yearTitles,
                  courses: state.courses,
                );
              }
              return const SliverToBoxAdapter(child: SizedBox());
            },
          ),
        ],
      ),
    );
  }
}
