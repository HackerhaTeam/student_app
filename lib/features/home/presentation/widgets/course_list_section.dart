import 'package:flutter/material.dart';
import 'package:student_hackerha/core/functions/get_responsive_size.dart';
import 'package:student_hackerha/core/themes/extentions/app_backgrounds.dart';
import 'package:student_hackerha/core/themes/extentions/app_borders.dart';
import 'package:student_hackerha/features/home/presentation/widgets/course_item.dart';

class CourseListSection extends StatelessWidget {
  final double height;
  final AppBorders border;
  final AppBackgrounds background;

  const CourseListSection({
    super.key,
    required this.height,
    required this.border,
    required this.background,
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
          child: CourseItem(
            isNew: true,
            border: border,
            background: background,
            courseName: 'البرمجة (${index + 1})',
            description: 'وصف الدورة رقم ${index + 1}',
            tagsTitle: [
              "مدرّس ${index + 1}",
              "دورة شاملة",
              "${index + 20} طالب"
            ],
          ),
        ),
      ),
    );
  }
}
