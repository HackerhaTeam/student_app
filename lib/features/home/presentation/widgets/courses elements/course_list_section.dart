import 'package:flutter/material.dart';
import 'package:student_hackerha/core/functions/get_responsive_size.dart';
import 'package:student_hackerha/core/themes/extentions/app_backgrounds.dart';
import 'package:student_hackerha/core/themes/extentions/app_borders.dart';

class CourseListSection extends StatelessWidget {
  final double height;
  final AppBorders border;
  final AppBackgrounds background;
  final Widget coursesItem;
  const CourseListSection({
    super.key,
    required this.height,
    required this.border,
    required this.background,
    required this.coursesItem,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: height,
      child: ListView.builder(
        reverse: true,
        scrollDirection: Axis.horizontal,
        itemCount: 50,
        itemBuilder: (context, index) => Padding(
          padding: EdgeInsets.only(
              left: index == 0 ? 1.w(context) : 10.w(context),
              right: 10.w(context)),
          child: coursesItem,
        ),
      ),
    );
  }
}
