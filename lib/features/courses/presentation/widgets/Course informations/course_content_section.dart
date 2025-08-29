import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:student_hackerha/core/themes/extentions/app_content.dart';
import 'package:student_hackerha/core/themes/typoGraphy/app_text_styles.dart';
import 'package:student_hackerha/features/courses/domain/Entity/course.dart';
import 'package:student_hackerha/features/courses/presentation/manager/cubit/Courses/get_courses_cubit.dart';
import 'package:student_hackerha/features/courses/presentation/widgets/Course%20informations/detailes_section.dart';
import 'package:student_hackerha/features/courses/presentation/widgets/Course%20informations/section.dart';
import 'package:student_hackerha/features/courses/presentation/widgets/Course%20informations/shimmer_detiles_section.dart';

class CourseDetilesSection extends StatelessWidget {
  final String courseId;
  final Course course;
  final GlobalKey scrollKey;

  const CourseDetilesSection({
    super.key,
    required this.courseId,
    required this.course,
    required this.scrollKey,
  });

  @override
  Widget build(BuildContext context) {
    final content = Theme.of(context).extension<AppContent>()!;

    return Section(
      scrollKey: scrollKey,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          _buildSectionTitle("محتويات الدورة", context.xHeadingLarge),
          _buildSubtitle("البيانات الرئيسية", context.xHeadingSmall, content),
          _buildDetailsSection(context),
       
        ],
      ),
    );
  }

  Widget _buildSectionTitle(String title, TextStyle style) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 16),
      child: Text(title, style: style),
    );
  }

  Widget _buildSubtitle(String subtitle, TextStyle style, AppContent content) {
    return Text(
      subtitle,
      style: style.copyWith(color: content.secondary),
    );
  }

  Widget _buildDetailsSection(BuildContext context) {
    return BlocBuilder<CoursesCubit, CoursesState>(
      builder: (context, state) {
        if (state is CoursesLoading) {
          return const ShimmerDetilesSection();
        }

        if (state is CoursesLoaded) {
          final courseDetail = context.read<CoursesCubit>().getCourseById(
                courseId,
                course,
              );

          return DetailesSection(sessions: courseDetail.sessions);
        }

       
        return const ShimmerDetilesSection();
      },
    );
  }

}