import 'package:flutter/material.dart';
import 'package:student_hackerha/core/functions/get_responsive_size.dart';
import 'package:student_hackerha/core/widgets/shimmer/course_shimmer.dart';

class CourseShimmerList extends StatelessWidget {
  const CourseShimmerList({super.key,  this.scrollDirection=Axis.horizontal});
final Axis?  scrollDirection;
  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      scrollDirection: scrollDirection!,
      child: scrollDirection == Axis.horizontal
          ? Row(
              children: List.generate(
              4,
                (index) => Padding(
                  padding: EdgeInsets.only(
                    left: index == 0 ? 1.w(context) : 10.w(context),
                    right: 10.w(context),
                  ),
                  child: CourseShimmer(),
                ),
              ),
            )
          : Column(spacing: 20,
              children: List.generate(
               4,
                (index) => Padding(
                  padding: EdgeInsets.only(
                    top: index == 0 ? 1.h(context) : 2.h(context),
                    bottom: 2.h(context),
                  ),
                  child: CourseShimmer(),
                ),
              ),
            ),
    );
  }
}