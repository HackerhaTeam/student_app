import 'package:flutter/material.dart';
import 'package:student_hackerha/core/functions/get_responsive_size.dart';
import 'package:student_hackerha/core/functions/navigation.dart';
import 'package:student_hackerha/core/widgets/animation/fade_widget.dart';
import 'package:student_hackerha/core/widgets/course%20card/course_list.dart';
import 'package:student_hackerha/core/widgets/shimmer/course_shimmer.dart';
import 'package:student_hackerha/features/courses/domain/Entity/course.dart';
import 'package:student_hackerha/features/courses/presentation/widgets/year_courses_page.dart';
import 'package:student_hackerha/features/home/presentation/widgets/courses_header.dart';

class CoursesLoadingView extends StatelessWidget {
  final List<String> yearTitles;
  const CoursesLoadingView({super.key, required this.yearTitles});

  @override
  Widget build(BuildContext context) {
    return SliverList(
      delegate: SliverChildListDelegate(
        yearTitles.map((_) {
          return  Padding(
            padding: EdgeInsets.only(bottom: 24,left:20.w(context) ,right: 20.w(context)),
            child: CourseShimmer(),
          );
        }).toList(),
      ),
    );
  }
}
