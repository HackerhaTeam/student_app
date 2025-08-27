import 'package:flutter/material.dart';
import 'package:student_hackerha/core/functions/navigation.dart';
import 'package:student_hackerha/core/widgets/animation/fade_widget.dart';
import 'package:student_hackerha/core/widgets/course%20card/course_list.dart';
import 'package:student_hackerha/features/courses/domain/Entity/course.dart';
import 'package:student_hackerha/features/courses/presentation/widgets/no_courses_foundbody.dart';
import 'package:student_hackerha/features/courses/presentation/widgets/year_courses_page.dart';
import 'package:student_hackerha/features/home/presentation/widgets/courses_header.dart';

class CoursesLoadedView extends StatelessWidget {
  final List<String> yearTitles;
  final List<Course> courses;

  const CoursesLoadedView({
    super.key,
    required this.yearTitles,
    required this.courses,
  });

  String _mapYearTitleToKey(String title) {
    switch (title) {
      case "السنة الأولى":
        return "سنة اولى";
      case "السنة الثانية":
        return "سنة ثانية";
      case "السنة الثالثة":
        return "سنة ثالثة";
      case "السنة الرابعة":
        return "سنة الرابعة";
      case "السنة الخامسة":
        return "سنة الخامسة";
      default:
        return "";
    }
  }

  @override
  Widget build(BuildContext context) {
    if (courses.isEmpty) {
      return SliverToBoxAdapter(child: NoCoursesFoundbody());
    }
    return SliverList(
      delegate: SliverChildListDelegate(
        yearTitles.expand((title) {
          final list = courses
              .where((c) => c.year == _mapYearTitleToKey(title))
              .toList();

          return [
            if (list.isNotEmpty)
              FadeInWidget(
                child: CoursesHeader(
                  title: title,
                  onPressed: () {
                    context.navigateWithSlideTransition(
  YearCoursesPage(
    year: title,
    course: list
        .where((element) => element.year == _mapYearTitleToKey(title))
        .toList(),
  ),
);

                  },
                ),
              ),
                if (list.isNotEmpty)
            const SizedBox(height: 16),
              if (list.isNotEmpty)
            FadeInWidget(
              child: Padding(
                padding: const EdgeInsets.only(bottom: 24),
                child: CourseList(
                  courses: list,
                  scrollDirection: Axis.horizontal,
                ),
              ),
            ),
          ];
        }).toList(),
      ),
    );
  }
}
